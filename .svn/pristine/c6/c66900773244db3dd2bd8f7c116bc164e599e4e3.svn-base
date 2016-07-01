package com.GoalMate.www;

import java.io.File; 
import java.io.IOException;
import java.util.Iterator;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.GoalMate.www.DTO.ClubDTO;


@Service
public class MemJoin_FileUpService {
	public String fileUpload(MultipartHttpServletRequest mRequest){
		String mem_path = "";
		
		String uploadPath = "C:\\Java\\workspace_spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\GoalMate\\resources\\img\\mem\\";
		File dir = new File(uploadPath);
		Iterator<String> iter = mRequest.getFileNames();
		while(iter.hasNext()) {
			String uploadFileName = iter.next();
			MultipartFile mFile = mRequest.getFile(uploadFileName);
			
			String originalFileName = mFile.getOriginalFilename();
			String saveFileName = originalFileName;
			
			if(saveFileName != null && !saveFileName.equals("")) {

				
				try {
					mFile.transferTo(new File(uploadPath + saveFileName));
					mem_path = originalFileName;
				}  catch (Exception e) {
					e.printStackTrace();
				}//try ~catch
			} // if end
		} // while end
		return mem_path;		
	}//ClubJoin_FileUpService()
	
}//class
