package com.bg.plzSeatdown.admin.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.bg.plzSeatdown.admin.model.service.AdminTheaterService;
import com.bg.plzSeatdown.admin.model.vo.TheaterLogo;
import com.bg.plzSeatdown.api.model.vo.Theater;
import com.bg.plzSeatdown.common.ExceptionForward;
import com.bg.plzSeatdown.common.FileRename;
import com.bg.plzSeatdown.common.Pagination;
import com.bg.plzSeatdown.common.vo.PageInfo;
import com.google.gson.Gson;

@SessionAttributes({"loginMember","msg"})
@Controller
@RequestMapping("/admin/theater/*")
public class AdminTheaterController {

		@Autowired
		private AdminTheaterService adminTheaterService;
		
		// 공연장 화면으로 이동하여 공연장 리스트 출력
		@RequestMapping("list")
		public String theaterList(Model model, 
								@RequestParam(value="currentPage", required=false) Integer currentPage,
								@RequestParam(value="searchTheater", required=false) String searchTheater) {
			
			try {
				
				String searchValue = null;
				
				// 검색 조건이 있는지 확인하여 변수에 저장
				if(searchTheater != null) {
					searchValue = searchTheater;
				}
				
				// 전체 공연시설장 수 조회
				int theaterCount = adminTheaterService.getTheaterCount(searchValue);
				
				// 현재 페이지 확인
				if(currentPage == null) currentPage = 1;
				
				// 페이지 정보 저장
				PageInfo pInf = Pagination.getPageInfo(9, 5, currentPage, theaterCount);
				
				// 공연시설장 목록 조회
				List<Theater> list = adminTheaterService.selectList(searchValue, pInf);
				
				model.addAttribute("list", list);
				model.addAttribute("pInf", pInf);
				
				return "admin/theater";
				
			}catch(Exception e) {
				return ExceptionForward.errorPage("공연장 리스트 출력", model, e);
			}
		}
		
		@ResponseBody
		@RequestMapping(value="insertLogo", produces="application/json")
		public String insertLogo( HttpServletRequest request, // 파일 경로
									MultipartFile uploadFile, 
									String theaterCode){
			
			TheaterLogo logo = null;
			
			try {
				
				String root = request.getSession().getServletContext().getRealPath("resources");
				String savePath = root + "/theaterLogo";
				//savePath = savePath.replaceAll("\\\\", "/");
				
				System.out.println(savePath);
				
				//String savePath = "C:/Users/A/git/plzSeatdown/plzSeatdown/src/main/webapp/resources/theaterLogo";
				
				// 저장 폴더 선택
				File folder = new File(savePath);
				
				// 만약 해당 폴더가 없는 경우 -> 폴더 만들기
				if(!folder.exists()) folder.mkdir();
				
				String changeName = FileRename.rename(uploadFile.getOriginalFilename());
				
//				logo = new TheaterLogo(savePath + "/" + changeName, theaterCode);
				logo = new TheaterLogo(changeName, theaterCode);
				
				int result = adminTheaterService.insertLogo(logo, savePath);
				
				if(result > 0) {
					if(!uploadFile.getOriginalFilename().equals("") ) {
						uploadFile.transferTo(new File(savePath + "/" + changeName));
					}
				}

			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return new Gson().toJson(logo);
		}
		
		@ResponseBody
		@RequestMapping("deleteLogo")
		public int deleteLogo(HttpServletRequest request, // 파일 경로
								String theaterCode) {
			
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "/theaterLogo";
			
			int result = adminTheaterService.deleteLogo(theaterCode, savePath);
			
			return result;
		}
		
		@RequestMapping(value = "thDetail", method = RequestMethod.GET)
		public String theaterDetail() {
			return "admin/theaterDetail";
		}
		
}
