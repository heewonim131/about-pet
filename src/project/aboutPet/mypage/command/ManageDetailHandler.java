package project.aboutPet.mypage.command;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.filechooser.FileNameExtensionFilter;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import project.aboutPet.controller.CommandHandler;
import project.aboutPet.mypage.model.MemberDTO;
import project.aboutPet.mypage.service.ManageDetailService;
import project.aboutPet.mypage.service.MemberService;

public class ManageDetailHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		int mem_code = (int) session.getAttribute("num");

		if (request.getMethod().equalsIgnoreCase("GET")) {
			// 회원정보 가져오기

			MemberService mservice = MemberService.getInstance();
			MemberDTO memDTO = mservice.selectMember(mem_code);

			request.setAttribute("memDTO", memDTO);

			return "manageDetail";

		} else if (request.getMethod().equalsIgnoreCase("POST")) {

			// 업로드 파일 저장 경로
			String saveDirectory = request.getRealPath("/Project/aboutPet/upload");
			File saveDir = new File( saveDirectory );
			if( !saveDir.exists() ) saveDir.mkdirs();

			int maxPostSize = 5 * 1024 * 1024 ;  // 5MB 더 늘려야 하나?
			String encoding = "UTF-8"; 
			FileRenamePolicy policy = new DefaultFileRenamePolicy();

			MultipartRequest mrequest = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);

			MemberDTO dto = new MemberDTO();

			File uploadFile = mrequest.getFile("uploadFile");
			
			String fileName, ext = null;
			if (uploadFile != null) {
				// 파일 확장자 가져오기
				fileName = uploadFile.getName();
				ext = fileName.substring(fileName.lastIndexOf(".")+1);
	
				// 첨부파일이 있고, 확장자가 png,jpg 이면
				if( ext.equalsIgnoreCase("png")||ext.equalsIgnoreCase("jpg") ) {
					
					String filesystemname  = mrequest.getFilesystemName("uploadFile");
	
					String filepath = String.format("upload/%s", filesystemname);
					dto.setMem_img(filepath);
	
					// 기존 파일 삭제
					String delete_filesystemname = mrequest.getParameter("orgImg");
					String deleteFilePath = String.format("%s%s%s", saveDirectory, File.separator, delete_filesystemname);   
	
					File deleteFile = new File(deleteFilePath);
					if( deleteFile.exists() ) deleteFile.delete();
	
				} else {
					// 이미지 변경했는데 확장자 png,jpg 아니면
					// 업로드된 파일 삭제, 기존 이미지 set
					uploadFile.delete();
					dto.setMem_img(mrequest.getParameter("orgImg"));            	
				}
			} else {
				// 이미지 변경안하면 기존 이미지 set
				dto.setMem_img(mrequest.getParameter("orgImg"));			
			}
			
			dto.setMem_code(mem_code);
			dto.setNickname(mrequest.getParameter("nickNm"));
			dto.setMem_email(mrequest.getParameter("email"));
			dto.setMtag(mrequest.getParameter("htag"));

			ManageDetailService service = ManageDetailService.getInstance();
			int rowCount = service.updatePrf(dto);

			if (rowCount == 1) response.sendRedirect("myPage.do");


		}

		return null;

	}

}
