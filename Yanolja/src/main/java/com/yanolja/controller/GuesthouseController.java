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

import com.yanolja.command.Gr_Room_BookVO;
import com.yanolja.command.GuesthouseVO;
import com.yanolja.command.UserVO;
import com.yanolja.guesthouse.service.GuesthouseService;

@Controller
@RequestMapping("/guesthouse")
public class GuesthouseController {
	
	@Autowired
	private GuesthouseService guesthouseService;
	
	// 게스트하우스 지역 List
	@RequestMapping("/areaList")
	public String areaList(@Param("location") String location, Model model){
		String result = "";
		model.addAttribute("type", location);
		
		if(location.equals("gseoul") || location.equals("gkangwon") || location.equals("gbusan") || location.equals("gjeju")) {
			model.addAttribute("getTotal", guesthouseService.getTotal(location));
			result = "guesthouse/guesthouse_list";
		}
		return result;
	}
	
	// 게스트하우스 리스트 가져오기
	@RequestMapping("/getList/{type}")
	@ResponseBody
	public ArrayList<GuesthouseVO> getList(@PathVariable("type") String type) {
		return guesthouseService.getList(type);
	}

	// 게스트하우스 개별 디테일
	@RequestMapping("/detail")
	public String detail(@Param("gno") String gno, Model model, HttpSession session, RedirectAttributes RA) {

		// Post핸들러와 접목시켜서 사용, 단 중복 리다이렉트 이동이 일어나면 안됌.
		if ((String) session.getAttribute("u_Id") != null) { // 성공
			model.addAttribute("gno", gno);
			model.addAttribute("gInfo", guesthouseService.get_gInfo(gno));
			return "guesthouse/guesthouse_detail";
		} else { // 실패
			RA.addFlashAttribute("msg", "로그인이 필요합니다.");
			return "redirect:/user/userLogin";
		}
	}
	
	// 구글 지도 API
	@RequestMapping(value = "/locaList", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String loca(@RequestParam("g_no") int g_no) {
		return guesthouseService.loca(g_no);
	}
	
	// 게스트하우스 예약 처리
	@RequestMapping("/greservation")
	@ResponseBody
	public int greservation(@RequestBody Gr_Room_BookVO grbvo, HttpSession session, UserVO uvo) {
		grbvo.setU_Id((String) session.getAttribute("u_Id"));
		return guesthouseService.greservation(grbvo);
	}
	
	// 내 예약 현황 (게스트하우스)
	@RequestMapping("/g_bookList")
	@ResponseBody
	public ArrayList<Gr_Room_BookVO> greservationView(HttpSession session) {
		session.getAttribute("u_Id");
		return guesthouseService.greservationView((String) session.getAttribute("u_Id"));
	}
	
	// 예약 취소 처리 (게스트하우스)
	@RequestMapping("/bookCancle")
	@ResponseBody
	public int bookCancle(@RequestBody Gr_Room_BookVO grv) {
		if (guesthouseService.bookcancle(grv) == 1) {
			return 1;
		} else {
			return 0;
		}
	}
	
	// 게스트하우스 Detail 화면 가격 가져오기
	@RequestMapping("/getPrice/{gr_no}/{gno}")
	@ResponseBody
	public int getPrice(@PathVariable("gr_no") int gr_no, @PathVariable("gno") int gno) {
		return guesthouseService.getPrice(gr_no, gno);
	}

	// 게스트하우스 List 내 검색 처리
	@RequestMapping("/searchList/{sName}")
	@ResponseBody
	public ArrayList<GuesthouseVO> searchList(@PathVariable("sName") String sName) {
		return guesthouseService.searchList(sName);
	}
}
