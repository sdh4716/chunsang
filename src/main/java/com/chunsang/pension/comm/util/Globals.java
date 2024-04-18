package com.chunsang.pension.comm.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


/**
 *  Class Name : Globals.java
 *  Description : 시스템 구동 시 프로퍼티를 통해 사용될 전역변수를 정의한다.
 *  Modification Information
 *
 */

public class Globals {
	
	private static Logger logger = LoggerFactory.getLogger(Globals.class);

    public static final String RESULT_SUCCESS = "SUCCESS";
	public static final String RESULT_FAIL = "FAIL";
	public static final String ERROR_SVC = "[Service Error]";
	public static final String ERROR_CON = "[Controller Error]";
	public static final String ERROR_SQL = "[Sql Error]";
	public static final String ERROR_EXCEL = "[Excel Error]";
	public static final String ERROR_AT = "[Authority Error]";
	public static final String ERROR_IF = "[Other Error]";


	public static final String REGEXP_USER_PASSWORD = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[~!@#$%^&*.?_])[A-Za-z\\d~!@#$%^&*.?_]{6,100}$";	// 비밀번호 정규표현식

	public static final int SESSION_TIMEOUT = 60*60*3;	// 세션타임아웃 3시간
	//public static final int SESSION_TIMEOUT = 10;	// 세션타임아웃 10초 인터셉트 테스트
	public static final int SESSION_TIMEOUT_MOBILE = 60*60*6000;	// 세션타임아웃 3시간

	public static String getDate(String format) {
		return getDate(0, format);
	}
	
	public static Date getDate(String date, String format) {
		Date rtnDate = null;
		try {
			rtnDate = (new SimpleDateFormat(((format == null || "".equals(format))?"yyyyMMdd":format), Locale.KOREA).parse(date));
		} catch (NullPointerException e) {
			logger.error("getDate Exception!",e);
		} catch (Exception e) {
			logger.error("getDate Exception!",e);
		}
		return rtnDate;
	}
	
	public static String getDate(int days, String format) {
		GregorianCalendar gc = new GregorianCalendar();
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		gc.add(Calendar.DATE, days);

		return sdf.format(gc.getTime());
	}
	
	public static String getTime(String format) {
		if (format == null || format.equals("") == true)
			format = "yyyyMMddHHmmss";

		TimeZone tz = TimeZone.getDefault();
		tz.setRawOffset((60 * 60 * 1000) * 9);
		TimeZone.setDefault(tz);
		Calendar cal = Calendar.getInstance(tz);
		java.util.Date date = cal.getTime();
		SimpleDateFormat formater = new SimpleDateFormat(format);
		String timestamp = formater.format(date);

		return timestamp;
	}
	
	/**
	 * 숫자를 지정된 포맷으로 변환하여 반환한다. 변환할 숫자문자열이 NULL이거나 빈문자열일 경우 빈문자열을 반환하거나 ""을 반환한다.
	 * ### : 숫자값이 0일때 "" 리턴 ##0 : 숫자값이 0일때 0 리턴 ###.n# : 숫자값이 0이면 "" 리턴 ###.n0 :
	 * 숫자값이 0 이면 .n0리턴 ##0.n# : 숫자값이 0 이면 0 리턴 ##0.n0 : 숫자값이 0 이면 0.00 리턴
	 *
	 * @author 김병남
	 * @param strNumber 문자열 숫자
	 * @param strPattern 날짜 포맷
	 * @throws java.lang.NumberFormatException
	 * @throws java.lang.NullPointerException
	 * @return 지정된 포맷으로 변환된 숫자
	 */
	public static String numberFormat(String strNumber, String strPattern) throws NumberFormatException, NullPointerException {

		if ("".equals(checkNullString(strNumber, "")))
			return "";

		return numberFormat(Double.parseDouble(strNumber), strPattern);
	}

	public static String numberFormat(double val, String strPattern) throws NumberFormatException, NullPointerException {
		String rStr = "";
		String format = "#,###";
		DecimalFormat df = null;

		if (!"".equals(checkNullString(strPattern, "")))
			format = strPattern;

		int idx = -1;
		String key1 = ""; // 소수점 앞자리 값
		String key2 = ""; // 마지막 값
		if (format.lastIndexOf(".") > -1) {
			idx = format.lastIndexOf(".");
			key1 = format.substring(idx - 1, idx);
			key2 = format.substring(format.length() - 1, format.length());

			if ("#".equals(key1) && "#".equals(key2) && 0 == val)
				return "";
			else {
				df = new DecimalFormat(format);
				rStr = df.format(val);
			}
		} else {
			key1 = format.substring(format.length() - 1, format.length());

			if ("#".equals(key1) && 0 == val)
				return "";
			else {
				df = new DecimalFormat(format);
				rStr = df.format(val);
			}
		}

		return rStr;
	}

	/**
	 * 숫자를 지정된 포맷으로 변환하여 반환한다. 변환할 숫자문자열이 NULL이거나 빈문자열일 경우 빈문자열을 반환하거나 ""을 반환한다.
	 * ### : 숫자값이 0일때 "" 리턴 ##0 : 숫자값이 0일때 0 리턴
	 *
	 * @author 김병남
	 * @param strNumber 문자열 숫자
	 * @throws java.lang.NumberFormatException
	 * @throws java.lang.NullPointerException
	 * @return 지정된 포맷으로 변환된 숫자
	 */
	public static String numberFormat(String strNumber) throws NumberFormatException, NullPointerException {
		if ("".equals(checkNullString(strNumber, "")))
			return "";

		return numberFormat(Double.parseDouble(strNumber), null);
	}

	public static String numberFormat(double val) throws NumberFormatException, NullPointerException {

		return numberFormat(val, null);
	}
	
	/*
	 * Null, "" String 값일경우 대치문자열로 return 해준다.
	 *
	 * @param String paramstr check할 문자열
	 *
	 * @param String repstr 대치할 문자열
	 *
	 * @return String
	 */

	public static String checkNullString(String paramstr, String repstr) {

		if (paramstr == null || paramstr.trim().equals("") || paramstr.equals("null")) {
			return repstr;
		} else {
			return paramstr;
		}
	}

	public static String checkNullString(Object obj, String repstr) {
		String sRtn = null;
		StringBuffer sb = new StringBuffer();
		if(obj != null){
			if(obj instanceof String){
				sRtn = checkNullString(obj.toString(), repstr);
			}else if(obj instanceof String[]){
				for(String str : (String[])obj){
					sb.append((sb.length()>0?",":"")).append(str);
				}
				sRtn = checkNullString(sb.toString(), repstr);
			}else if(obj instanceof List){
				for(Object o : (List)obj){
					sb.append((sb.length()>0?",":"")).append(o.toString());
				}
				sRtn = checkNullString(sb.toString(), repstr);
			}else{
				sRtn = obj.toString();
			}
		}else{
			sRtn = repstr;
		}

		return sRtn;
	}
	
	public static Object checkNull(Object obj, Object repObj) {

		if (obj == null) {
			return repObj;
		} else {
			return obj;
		}
	}
	
	/**
	 * 사용자 IP
	 *
	 * @param request
	 * @return
	 */
	public static String getUserAccessIp(HttpServletRequest request) {
		String ip = request.getHeader("Proxy-Client-IP");
		if (ip == null) {
			ip = request.getHeader("WL-Proxy-Client-IP");
			if (ip == null) {
				ip = request.getHeader("X-Forwarded-For");  //클라이언트 ip 주소 가져오기
				if (ip == null) {
					ip = request.getRemoteAddr();
				}
			}
		}
		return ip;
	}
	
	/**
	 * escape 처리
	 */
	public static String getEscape(String str){
	 str = str.replace("&lt;", "<").replace("&gt;", ">").replace("&amp;", "&").replace("&quot;", "\"");
		return str;
	}
	
	public static boolean isInHttpRequest() {
		try {
			getCurrentRequest();
		} catch (IllegalStateException ise) {
			return false;
		}

		return true;
	}

	public static HttpServletRequest getCurrentRequest() {
		ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();

		return sra.getRequest();
	}

	public static String getRequestIp() {
		return getCurrentRequest().getRemoteAddr();
	}

	public static String getRequestURI() {
		return getCurrentRequest().getRequestURI();
	}

	public static HttpSession getCurrentSession() {
		return getCurrentRequest().getSession();
	}

	//get user agent
	public static String getUserAgent() {
		return getCurrentRequest().getHeader("user-agent");
	}

	//get referer
	public static String getReferer() {
		return getCurrentRequest().getHeader("referer");
	}
	
}
