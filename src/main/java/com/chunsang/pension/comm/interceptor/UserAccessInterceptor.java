package com.chunsang.pension.comm.interceptor;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UrlPathHelper;

import com.chunsang.pension.comm.util.Globals;
import com.chunsang.pension.comm.service.CommonService;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class UserAccessInterceptor implements HandlerInterceptor{

	@Resource(name = "CommonService")
	private CommonService commonService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		
		//top 메뉴 조회에서 메뉴접속 이력을 남김(접속정보)
		UrlPathHelper urlPathHelper = new UrlPathHelper();
		String originalURL = urlPathHelper.getOriginatingRequestUri(request);
		String url = originalURL.replaceFirst(request.getContextPath(), "");
		
		// 시스템 접속로그 생성
		insertAccessLog(request, url);
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
	}
	
	/**
	 * 시스템 접속시 접속이력 기록
	 */
	private void insertAccessLog(HttpServletRequest request, String url) {
		try {

			Map<String, Object> accessInfo = new HashMap<>();
			accessInfo.put("accessUrl", url);
			accessInfo.put("ip", Globals.getRequestIp());
			accessInfo.put("os", getClientOS(request.getHeader("USER-AGENT")));
			accessInfo.put("broswser", getClientBrowser(request.getHeader("USER-AGENT")));
			accessInfo.put("beforeUrl", Globals.getReferer());
			accessInfo.put("header", Globals.getUserAgent());
			accessInfo.put("userAgent", request.getHeader("USER-AGENT"));
			//accessInfo.put("isBot", isBot(request.getHeader("USER-AGENT")));
			
			System.out.println(accessInfo);
			
			commonService.insertSystemAccessLog(accessInfo);
		}catch(SQLException e) {
			/* LOGGER.error(e.getMessage()); */
			e.printStackTrace();
		}catch(NullPointerException e) {
			/* LOGGER.error(e.getMessage()); */
			e.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
			/* LOGGER.error(e.getMessage()); */
		}

	}
	
	private static String getClientOS(String userAgent) {
		String os = "";
		userAgent = userAgent.toLowerCase();
		if (userAgent.indexOf("windows nt 10.0") > -1) {
			os = "Windows10";
		}else if (userAgent.indexOf("windows nt 6.1") > -1) {
			os = "Windows7";
		}else if (userAgent.indexOf("windows nt 6.2") > -1 || userAgent.indexOf("windows nt 6.3") > -1 ) {
			os = "Windows8";
		}else if (userAgent.indexOf("windows nt 6.0") > -1) {
			os = "WindowsVista";
		}else if (userAgent.indexOf("windows nt 5.1") > -1) {
			os = "WindowsXP";
		}else if (userAgent.indexOf("windows nt 5.0") > -1) {
			os = "Windows2000";
		}else if (userAgent.indexOf("windows nt 4.0") > -1) {
			os = "WindowsNT";
		}else if (userAgent.indexOf("windows 98") > -1) {
			os = "Windows98";
		}else if (userAgent.indexOf("windows 95") > -1) {
			os = "Windows95";
		}else if (userAgent.indexOf("iphone") > -1) {
			os = "iPhone";
		}else if (userAgent.indexOf("ipad") > -1) {
			os = "iPad";
		}else if (userAgent.indexOf("android") > -1) {
			os = "android";
		}else if (userAgent.indexOf("mac") > -1) {
			os = "mac";
		}else if (userAgent.indexOf("linux") > -1) {
			os = "Linux";
		}else{
			os = "Other";
		}
		return os;
	}
	
	private static String getClientBrowser(String userAgent) {
		String browser = "";
		if (userAgent.indexOf("Trident/7.0") > -1) {
			browser = "ie11";
		} else if (userAgent.indexOf("MSIE 10") > -1) {
			browser = "ie10";
		} else if (userAgent.indexOf("MSIE 9") > -1) {
			browser = "ie9";
		} else if (userAgent.indexOf("MSIE 8") > -1) {
			browser = "ie8";
		} else if (userAgent.indexOf("Chrome") > -1) {
			browser = "Chrome";
		} else if (userAgent.indexOf("Chrome") == -1 && userAgent.indexOf("Safari") >= -1) {
			browser = "Safari";
		} else if (userAgent.indexOf("Firefox") >= -1) {
			browser = "Firefox";
		} else {
			browser ="Other";
		}
		return browser;
	}
	
	private String isBot(String userAgent) {
		String isBot = "";
		String[] botList = { 
				"bot" , "Bot", "spider" ,"crawl",             			   // GENERAL TERMS
			    "APIs-Google","AdsBot","Googlebot",                //GOOGLE ROBOTS
			    "mediapartners","Google Favicon",
			    "FeedFetcher","Google-Read-Aloud",
			    "DuplexWeb-Google","googleweblight",
			    "bing","yandex","baidu","duckduck","yahoo",        // OTHER ENGINES
			    "ecosia","ia_archiver",
			    "facebook","instagram","pinterest","reddit",       // SOCIAL MEDIA
			    "slack","twitter","whatsapp","youtube",
			    "semrush", "censys"
		};
		
		if(StringUtils.indexOfAny(userAgent , botList) > -1) {
			isBot = "Y";
		}else {
			isBot = "N";
		}
		
		return isBot;
	}
		
}






