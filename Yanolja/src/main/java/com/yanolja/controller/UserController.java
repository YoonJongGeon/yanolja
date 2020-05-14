package com.yanolja.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yanolja.command.Critaria;
import com.yanolja.command.GuesthouseVO;
import com.yanolja.command.HotelVO;
import com.yanolja.command.MotelVO;
import com.yanolja.command.PensionVO;
import com.yanolja.command.UserVO;
import com.yanolja.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

   @Autowired
   @Qualifier("userService")
   private UserService userService;
   
   // ============================== 회원 정보 관련 ============================== 
   @RequestMapping("/userLogin")
   public String userLogin() {
		return "user/yanolja_login";
   }
   
   @RequestMapping("/userMyPage")
   public String userMyPage(HttpSession session, Model model){
      String u_Id = (String)session.getAttribute("u_Id");
      UserVO UserVO = userService.getInfo(u_Id);
      model.addAttribute("UserVO", UserVO);
      return "user/yanolja_MyPage";
   }
   
   @RequestMapping("/userJoin")
   public String userJoin() {
      return "user/yanolja_join";
   }

   @RequestMapping("/board")
   public String board() {
      return "user/yanolja_board";
   }

   @RequestMapping(value = "/idConfirm")
   @ResponseBody
   public int idConfirm(@RequestBody UserVO vo) {
      return userService.idConfirm(vo);
   }
   
   @RequestMapping(value="/joinForm", method = RequestMethod.POST)
   public String joinForm(UserVO vo, RedirectAttributes RA) {
      
		if (userService.join(vo) == 1) {
			RA.addFlashAttribute("msg", "'" + vo.getU_Name() + "'님! 회원가입을 축하합니다.");
			return "redirect:/user/userLogin";
		} else {
			RA.addFlashAttribute("msg", "회원가입에 실패하셨습니다.");
			return "redirect:/user/userJoin";
		}
	}
   
   @RequestMapping(value="/loginForm")
   public String loginForm(UserVO vo, RedirectAttributes RA, HttpSession session) {
		
		// Post핸들러와 접목시켜서 사용, 단 중복 리다이렉트 이동이 일어나면 안됌.
		if (userService.login(vo) == 1) { // 성공
			session.setAttribute("u_Id", vo.getU_Id());
			RA.addFlashAttribute("msg", vo.getU_Id() + "님 로그인 하셨습니다");
			return "home";// 홈화면
		} else { // 실패
			RA.addFlashAttribute("msg", "로그인에 실패했습니다.");
			return "redirect:/user/userLogin";
		}
   
      
   }
   @RequestMapping(value="/userLogout")
   public String userLogout(HttpSession session, RedirectAttributes RA) {
      session.invalidate();
      RA.addFlashAttribute("msg","로그아웃하셨습니다.");
      return "redirect:/";
   }
   
   
   @RequestMapping(value="/userInfoUpdate", method = RequestMethod.POST)
   @ResponseBody
   public String userInfoUpdate(@RequestBody UserVO vo) {
      return userService.update(vo) == 1 ? "success" : "fail";
   }
   
   // ID 찾기 화면 처리
   @RequestMapping("/idFind")
   public String idFind() {
      return "user/yanolja_IdFind";
   }
   
   // 비밀번호 찾기 화면 처리
   @RequestMapping("/pwFind")
   public String pwFind() {
      return "user/yanolja_PwFind";
   }
   
   // ID 찾기 폼처리
   @RequestMapping(value="/idFindForm")
   @ResponseBody
   public UserVO idFindForm(@RequestBody UserVO vo) {
	   return userService.idFind(vo);
   }
   
   // 비밀번호 찾기 폼처리
   @RequestMapping(value="/pwFindForm")
   @ResponseBody
   public UserVO pwFindForm(@RequestBody UserVO vo) {
	   return userService.pwFind(vo);
   }
   
   // 비밀번호 변경 처리
   @RequestMapping("/pwUpdate")
   public String pwUpdate(UserVO vo, RedirectAttributes RA) {
	   int result = userService.pwUpdate(vo);
	   if(result==1) {
		   RA.addFlashAttribute("msg","비밀번호가 변경되었습니다.");
		   return "redirect:/user/userLogin";
	   }else
		   RA.addFlashAttribute("msg","비밀번호 변경에 실패했습니다.");
	   return "redirect:/user/pwFindForm";
   }
   
   
   // ============================== 지역별 List ==============================
   @RequestMapping("/type")
   public String userAreaList(@Param("name") String name) {
      
      String result = "";
      if(name.equals("motel")) {
         result = "motel/motel_arealist";
      } else if(name.equals("hotel")) {
         result = "hotel/hotel_arealist";
      } else if(name.equals("pension")) {
         result = "pension/pension_arealist";
      } else if(name.equals("guesthouse")) {
         result = "guesthouse/guesthouse_arealist";
      }
      return result;
   }
   
   //
   @RequestMapping("/search")
   public String search(@Param("searchType") String searchType, Model model, Critaria cri ,@Param("searchName") String searchName ) {
      
	   model.addAttribute("searchType", searchType);
	   model.addAttribute("total", userService.total(cri));
	   
	   if (searchType.equals("Motel")) {
		ArrayList<MotelVO> list_m = userService.m_search(searchName);
		model.addAttribute("mlist",list_m);
	   }
	   else if(searchType.equals("Hotel")) {
		   ArrayList<HotelVO> list_h = userService.h_search(searchName);
		   model.addAttribute("hlist",list_h);
	   }
	   else if(searchType.equals("Pension")) {
		   ArrayList<PensionVO> list_p = userService.p_search(searchName);
		   model.addAttribute("plist",list_p);
	   }
	   else if(searchType.equals("Guesthouse")) {
		   ArrayList<GuesthouseVO> list_g = userService.g_search(searchName);
		   model.addAttribute("glist",list_g);
	   }
	   
      return "user/search";
   }
}