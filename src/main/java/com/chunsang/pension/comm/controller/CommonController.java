package com.chunsang.pension.comm.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.chunsang.pension.comm.model.RoomPrice;
import com.chunsang.pension.comm.service.CommonService;
import com.chunsang.pension.comm.vo.SearchVO;

import net.coobird.thumbnailator.Thumbnails;

/*
 * 프로젝트 내 공통적으로 사용되는 로직을 모아놓은 Controller
 * by dev1song
 */
@RequestMapping( value = "/comm")
@Controller
public class CommonController {
	
	@Resource(name = "CommonService")
	private CommonService commonService;
	
	//application.properties에서 조회
	@Value("${path.ckEditor}")
	private String ckEditorPath;
	
	@Value("${path.thumbnail}")
	private String thumbnailPath;
	
	//객실 요금 조회
	@RequestMapping(value = "/selectRoomPrice", method=RequestMethod.GET)
	public ModelAndView selectRoomPrice(@ModelAttribute SearchVO searchVO , BindingResult errors) throws Exception {
		
		ModelAndView mav  = new ModelAndView();
		
		try {
			List<RoomPrice> roomPriceList = commonService.selectRoomPrice(searchVO);
	       
	        mav.addObject("roomPriceList", roomPriceList);
		}catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	@PostMapping("/updateRoomPrice")
	public ModelAndView updateRoomPrice(@RequestBody List<RoomPrice> roomPrices) throws Exception {
	    ModelAndView mav = new ModelAndView("jsonView");

	    for (RoomPrice roomPrice : roomPrices) {
	        int result = commonService.updateRoomPrice(roomPrice);
	        if (result != 1) {
	            mav.addObject("isSuccess", false);
	            return mav; // 실패 시 즉시 반환
	        }
	    }

	    mav.addObject("isSuccess", true);
	    return mav;
	}
	
    // 파일 업로드 엔드포인트
//    @PostMapping("/imageUpload") // "/upload/image" 경로에 매핑
//    public Map<String, Object> uploadFile(@RequestParam("file") MultipartFile file) throws Exception {
//        Map<String, Object> response = new HashMap<>();
//
//        File uploadDir = new File(UPLOAD_DIR);
//        if (!uploadDir.exists()) {
//            uploadDir.mkdirs(); // 디렉토리가 없으면 생성
//        }
//
//        try {
//            String orgFileNm = file.getOriginalFilename();
//            String chgFileNm = UUID.randomUUID() + "_" + orgFileNm; // 고유 파일 이름 생성
//            File fileDir = new File(uploadDir, chgFileNm);
//            String filePath = fileDir.toString();
//            
//            file.transferTo(fileDir); // 파일 저장
//
//            // DB에 파일 정보 저장
//            UploadFile uploadFile = UploadFile.builder()
//            		.fileNm(orgFileNm)
//            		.chgFileNm(chgFileNm)
//            		.filePath(filePath)
//            		.fileSize(file.getSize())
//            		.build();
//
//            commonService.saveUploadFileInfo(uploadFile);
//            
//            // CKEditor에 반환될 URL
//            response.put("url", "/uploads/" + chgFileNm);
//            response.put("uploaded", true);
//        } catch (IOException e) {
//            e.printStackTrace();
//            response.put("uploaded", false);
//            //response.put("error", Map.of("message", "파일 업로드에 실패했습니다."));
//        } catch (Exception e) {
//			e.printStackTrace();
//		}
//
//        return response;
//    }
	
	@PostMapping("/uploadFile")
	public ModelAndView uploadFile(@RequestParam("file") MultipartFile file) throws Exception {
	    ModelAndView mav = new ModelAndView("jsonView");

	    File uploadDir = new File(ckEditorPath);
	    if (!uploadDir.exists()) {
	        uploadDir.mkdirs(); // 디렉토리가 없으면 생성
	    }

	    try {
	        String originalFilename = file.getOriginalFilename();
	        
	        // 파일 확장자 추출
	        String extension = "";
	        int dotIndex = originalFilename.lastIndexOf(".");
	        if (dotIndex > 0) {
	            extension = originalFilename.substring(dotIndex); // 예: ".jpg"
	        }

	        // 새 파일 이름 생성 (UUID + 확장자)
	        String newFileName = UUID.randomUUID() + extension;

	        File destinationFile = new File(uploadDir, newFileName);

	        file.transferTo(destinationFile); // 파일 저장

	        // URL 생성 (사용자가 접근 가능한 경로)
	        String fileUrl = "/upload/ckEditor/" + newFileName;

	        mav.addObject("url", fileUrl);
	        mav.addObject("uploaded", true);
	    } catch (IOException e) {
	        e.printStackTrace();
	        mav.addObject("uploaded", false);
	        mav.addObject("error", "파일 업로드에 실패했습니다.");
	    } catch (Exception e) {
	        e.printStackTrace();
	        mav.addObject("uploaded", false);
	        mav.addObject("error", "알 수 없는 오류가 발생했습니다.");
	    }

	    return mav;
	}
	
	@PostMapping("/createThumbnail")
    public ModelAndView createThumbnail(@RequestParam("imageName") String imageName) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
        try {
            File inputFile = new File(ckEditorPath + imageName);
            String thumbnailName = "thumb_" + inputFile.getName();
            File thumbnailFile = new File(thumbnailPath + thumbnailName);

            // 썸네일 생성
            Thumbnails.of(inputFile)
                    .size(400, 300) // 원하는 썸네일 크기
                    .toFile(thumbnailFile);

            // 썸네일 경로 반환
            mav.addObject("thumbnailDir", "/upload/thumbnail/" + thumbnailName);
            mav.addObject("success", "true");
        }catch (FileNotFoundException e) {
        	mav.addObject("success", "false");
        	mav.addObject("error", e.getMessage());
        	e.printStackTrace();
		}catch (IOException e) {
			mav.addObject("success", "false");
			mav.addObject("error", e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
			e.printStackTrace();
		}
        
        return mav;
    }
	
}
