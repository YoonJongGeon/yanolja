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

import com.yanolja.command.PensionVO;
import com.yanolja.command.Pr_Room_BookVO;
import com.yanolja.command.UserVO;
import com.yanolja.pension.service.PensionService;

@Controller
@RequestMapping("/pension")
public class PensionController {
	
	@Autowired
	private PensionService pensionService;
	
	// 펜션 지역 List
	@RequestMapping("/areaList")
	public String areaList(@Param("location") String location, Model model){
		String result = "";
		model.addAttribute("type", location);
		
		if(location.equals("pseoul") || location.equals("pkangwon") || location.equals("pbusan") || location.equals("pjeju")) {
			model.addAttribute("getTotal", pensionService.getTotal(location));
			result = "pension/pension_list";
		}
		return result;
	}
	
	// 펜션 리스트 가져오기
	@RequestMapping("/getList/{type}")
	@ResponseBody
	public ArrayList<PensionVO> getList(@PathVariable("type") String type) {
		return pensionService.getList(type);
	}
	
	// 펜션 개별 디테일
	@RequestMapping("/detail")
	public String detail(@Param("pno") String pno, Model model, HttpSession session, RedirectAttributes RA) {

		// Post핸들러와 접목시켜서 사용, 단 중복 리다이렉트 이동이 일어나면 안됌.
		if ((String) session.getAttribute("u_Id") != null) { // 성공
			model.addAttribute("pno", pno);
			model.addAttribute("pInfo", pensionService.get_pInfo(pno));
			return "pension/pension_detail";
		} else { // 실패
			RA.addFlashAttribute("msg", "로그인이 필요합니다.");
			return "redirect:/user/userLogin";
		}
	}
	
	// 구글 지도 API
	@RequestMapping(value = "/locaList", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String loca(@RequestParam("p_no") int p_no) {
		return pensionService.loca(p_no);
	}
	
	// 펜션 예약 처리
	@RequestMapping("/preservation")
	@ResponseBody
	public int greservation(@RequestBody Pr_Room_BookVO prbvo, HttpSession session, UserVO uvo) {
		prbvo.setU_Id((String) session.getAttribute("u_Id"));
		return pensionService.preservation(prbvo);
	}
	
	// 내 예약 현황 (펜션)
	@RequestMapping("/p_bookList")
	@ResponseBody
	public ArrayList<Pr_Room_BookVO> preservationView(HttpSession session) {
		session.getAttribute("u_Id");
		return pensionService.preservationView((String) session.getAttribute("u_Id"));
	}
	
	// 예약 취소 처리 (펜션)
	@RequestMapping("/bookCancle")
	@ResponseBody
	public int bookCancle(@RequestBody Pr_Room_BookVO prv) {
		if (pensionService.bookcancle(prv) == 1) {
			return 1;
		} else {
			return 0;
		}
	}
	
	// 펜션 Detail 화면 가격 가져오기
	@RequestMapping("/getPrice/{pr_no}/{pno}")
	@ResponseBody
	public int getPrice(@PathVariable("pr_no") int pr_no, @PathVariable("pno") int pno) {
		return pensionService.getPrice(pr_no, pno);
	}

	// 펜션 List 내 검색 처리
	@RequestMapping("/searchList/{sName}")
	@ResponseBody
	public ArrayList<PensionVO> searchList(@PathVariable("sName") String sName) {
		return pensionService.searchList(sName);
	}
}
