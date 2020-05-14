package com.yanolja.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yanolja.command.MotelVO;
import com.yanolja.command.Mr_Room_BookVO;
import com.yanolja.command.UserVO;
import com.yanolja.motel.service.MotelService;

@Controller
@RequestMapping("/motel")
public class MotelController {
	
	@Autowired
	private MotelService motelService;
	
	// 모텔 지역 리스트
	@RequestMapping("/areaList")
	public String areaList(@Param("location") String location, Model model) {
		String result = "";
		model.addAttribute("type", location);
		
		if(location.equals("mseoul") || location.equals("mkangwon") || location.equals("mbusan") || location.equals("mjeju")) {
			model.addAttribute("getTotal", motelService.getTotal(location));
			result = "motel/motel_list";
		}
		return result;
	}
	
	// 모텔 리스트 가져오기
	@RequestMapping("/getList/{type}")
	@ResponseBody
	public ArrayList<MotelVO> getList(@PathVariable("type") String type) {
		return motelService.getList(type);
	}
	
	// 모텔 개별 디테일
	@RequestMapping("/detail")
	public String detail(@Param("mno") String mno, Model model, HttpSession session, RedirectAttributes RA) {
		
		// Post핸들러와 접목시켜서 사용, 단 중복 리다이렉트 이동이 일어나면 안됌.
		if ((String) session.getAttribute("u_Id") != null) { // 성공
			model.addAttribute("mno", mno);
			model.addAttribute("mInfo", motelService.get_mInfo(mno));
			return "motel/motel_detail";
		} else { // 실패
			RA.addFlashAttribute("msg", "로그인이 필요합니다.");
			return "redirect:/user/userLogin";
		}
	}
	
	// 구글 지도 API
	@RequestMapping(value = "/locaList", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String loca(@RequestParam("m_no") int m_no) {
		return motelService.loca(m_no);
	}

	// 모텔 예약 처리
	@RequestMapping("/mreservation")
	@ResponseBody
	public int mreservation(@RequestBody Mr_Room_BookVO mrbvo, HttpSession session, UserVO uvo) {
		mrbvo.setU_Id((String) session.getAttribute("u_Id"));
		return motelService.mreservation(mrbvo);
		
	}
	// 모텔 내 예약 현황
	@RequestMapping("/m_bookList")
	@ResponseBody
	public ArrayList<Mr_Room_BookVO> mreservationView(HttpSession session) {
		return motelService.mreservationView((String)session.getAttribute("u_Id"));
	}
	
	// 예약 취소 처리 (모텔)
	@RequestMapping("/bookCancle")
	@ResponseBody
	public int bookCancle(@RequestBody Mr_Room_BookVO mrv) {
		if (motelService.bookcancle(mrv) == 1) {
			return 1;
		} else {
			return 0;
		}
	}
	
	// 모텔 Detail 화면 가격 가져오기
	@RequestMapping("/getPrice/{mr_no}/{mno}")
	@ResponseBody
	   public int getPrice(@PathVariable("mr_no") int mr_no, @PathVariable("mno") int mno) {
	      return motelService.getPrice(mr_no, mno);
	}
	
	// 모텔 List 내 검색 처리
	@RequestMapping("/searchList/{sName}")
	@ResponseBody
	public ArrayList<MotelVO> searchList(@PathVariable("sName") String sName) {
		return motelService.searchList(sName);
	}
}
