package action;

import java.awt.Image;
import java.io.File;
import java.util.Enumeration;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sun.jimi.core.Jimi;
import com.sun.jimi.core.JimiException;
import com.sun.jimi.core.JimiUtils;

import controller.CommandAction;
import com.oreilly.servlet.MultipartRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class FileUploadAction implements CommandAction {
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		// 경로값 얻어옴
		String realpath = request.getServletContext().getRealPath("upload");
		int max = 10 * 1024 * 1024; // 최대파일크기는 10MB
		
		//파일 생성
        File file = new File(realpath);
        // upload폴더가 없으면 
        if(!file.exists()){
            // upload폴더를 새로 만든다
            file.mkdirs();
        }
		
		MultipartRequest multi = new MultipartRequest(request,realpath,max,"UTF-8", new DefaultFileRenamePolicy()); 

		@SuppressWarnings("rawtypes")
		Enumeration e = multi.getFileNames();
		String tagname = (String) e.nextElement();	
		String saveFile = multi.getFilesystemName(tagname);
		   	
        // 확장자를 받아온다
        String[] filename = saveFile.split("\\.");
        String extension = filename[1].toLowerCase();

        // 확장자가 gif를 제외한 사진포맷인 경우
        if(extension.equals("jpg") || extension.equals("jpeg") || extension.equals("bmp") || extension.equals("png") ) {
        	
	        int thumbWidth = 300;// 썸네일 가로크기
	        int thumbHeight = 300;// 썸네일 세로크기
	 
	        Image thumbnail = JimiUtils.getThumbnail(realpath + "\\" + saveFile, thumbWidth, thumbHeight, Jimi.IN_MEMORY);// 썸네일 만들기
	        try {
				Jimi.putImage(thumbnail, realpath + "\\thumb_" + saveFile); // 썸네임 파일명은 'thumb_사진파일'
	        } catch (JimiException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} 
        }
        return "{\"savefile\":\"" + saveFile + "\"}";
        	
	}
}
