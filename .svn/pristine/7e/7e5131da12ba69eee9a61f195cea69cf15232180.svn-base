package com.GoalMate.www;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
public class FileUpService {
	public String fileUpload(MultipartHttpServletRequest mRequest,String path){
		String img = "";
		
		//String uploadPath = "C:\\java\\workspace_spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\GoalMate\\resources\\img\\"+path+"\\";
		String uploadPath = "C:\\Users\\sviru\\Documents\\workspace-sts-3.7.3.RELEASE\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\GoalMate\\resources\\img\\"+path+"\\";
		File dir = new File(uploadPath);
		Iterator<String> iter = mRequest.getFileNames();
		while(iter.hasNext()) {
			String uploadFileName = iter.next();
			System.out.println("uploadFileName : "+uploadFileName);
			
			MultipartFile mFile = mRequest.getFile(uploadFileName);
			String originalFileName = mFile.getOriginalFilename();
			String saveFileName = originalFileName;
			
			if(saveFileName != null && !saveFileName.equals("")) {
				if(new File(uploadPath + saveFileName).exists()) {
					saveFileName = saveFileName + "_" + System.currentTimeMillis();
				}//end if
				
				try {
					mFile.transferTo(new File(uploadPath + saveFileName));
					img = originalFileName;
				}  catch (Exception e) {
					e.printStackTrace();
				}//try ~catch
			} // if end
		} // while end
		
		return img;		
	}//fileUpload()
	public List<String> fileUploadList(MultipartHttpServletRequest mRequest,String path){
		List<String> img=new ArrayList<String>();
		
		//String uploadPath = "C:\\java\\workspace_spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\GoalMate\\resources\\img\\"+path+"\\";
		String uploadPath = "C:\\Users\\sviru\\Documents\\workspace-sts-3.7.3.RELEASE\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\GoalMate\\resources\\img\\"+path+"\\";
		File dir = new File(uploadPath);
		Iterator<String> iter = mRequest.getFileNames();
		while(iter.hasNext()) {
			String uploadFileName = iter.next();
			
			MultipartFile mFile = mRequest.getFile(uploadFileName);
			String originalFileName = mFile.getOriginalFilename();
			String saveFileName = originalFileName;
			
			if(saveFileName != null && !saveFileName.equals("")) {
				if(new File(uploadPath + saveFileName).exists()) {
					saveFileName = saveFileName + "_" + System.currentTimeMillis();
				}//end if
				
				try {
					mFile.transferTo(new File(uploadPath + saveFileName));
					img.add(originalFileName);
				}  catch (Exception e) {
					e.printStackTrace();
				}//try ~catch
			} // if end
		} // while end
		
		return img;		
	}//fileUpload()
	
}//class
