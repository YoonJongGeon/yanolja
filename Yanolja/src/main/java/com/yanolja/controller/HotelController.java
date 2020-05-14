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

import com.yanolja.command.HotelVO;
import com.yanolja.command.Hr_Room_BookVO;
import com.yanolja.command.UserVO;
import com.yanolja.hotel.service.HotelService;

@Controller
@RequestMapping("/hotel")
public class HotelController {

	@Autowired
	private HotelService hotelService;

	// 호텔 지역 리스트
	@RequestMapping("/areaList")
	public String areaList(@Param("location") String location, Model model) {
		String result = "";
		model.addAttribute("type", location);

		if (location.equals("hseoul") || location.equals("hkangwon") || location.equals("hbusan") || location.equals("hjeju")) {
			model.addAttribute("getTotal", hotelService.getTotal(location));
			result = "hotel/hotel_list";
		}
		return result;
	}

	// 호텔 리스트 가져오기
	@RequestMapping("/getList/{type}")
	@ResponseBody
	public ArrayList<HotelVO> getList(@PathVariable("type") String type) {
		return hotelService.getList(type);
	}

	// 호텔 개별 디테일
	@RequestMapping("/detail")
	public String detail(@Param("hno") String hno, Model model, HttpSession session, RedirectAttributes RA) {

		// Post핸들러와 접목시켜서 사용, 단 중복 리다이렉트 이동이 일어나면 안됌.
		if ((String) session.getAttribute("u_Id") != null) { // 성공
			model.addAttribute("hno", hno);
			model.addAttribute("hInfo", hotelService.get_hInfo(hno));
			return "hotel/hotel_detail";
		} else { // 실패
			RA.addFlashAttribute("msg", "로그인이 필요합니다.");
			return "redirect:/user/userLogin";
		}
	}

	// 구글 지도 API
	@RequestMapping(value = "/locaList", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String loca(@RequestParam("h_no") int h_no) {
		return hotelService.loca(h_no);
	}

	// 호텔 예약 처리
	@RequestMapping("/hreservation")
	@ResponseBody
	public int hreservation(@RequestBody Hr_Room_BookVO hrbvo, HttpSession session, UserVO uvo) {
		hrbvo.setU_Id((String) session.getAttribute("u_Id"));
		return hotelService.hreservation(hrbvo);
	}

	// 내 예약 현황 (호텔)
	@RequestMapping("/h_bookList")
	@ResponseBody
	public ArrayList<Hr_Room_BookVO> hreservationView(HttpSession session) {
		session.getAttribute("u_Id");
		return hotelService.hreservationView((String) session.getAttribute("u_Id"));
	}

	// 예약 취소 처리 (호텔)
	@RequestMapping("/bookCancle")
	@ResponseBody
	public int bookCancle(@RequestBody Hr_Room_BookVO hrv) {
		if (hotelService.bookcancle(hrv) == 1) {
			return 1;
		} else {
			return 0;
		}
	}
	
	// 호텔 Detail 화면 가격 가져오기
	@RequestMapping("/getPrice/{hr_no}/{hno}")
	@ResponseBody
	public int getPrice(@PathVariable("hr_no") int hr_no, @PathVariable("hno") int hno) {
		return hotelService.getPrice(hr_no, hno);
	}

	// 호텔 List 내 검색 처리
	@RequestMapping("/searchList/{sName}")
	@ResponseBody
	public ArrayList<HotelVO> searchList(@PathVariable("sName") String sName) {
		return hotelService.searchList(sName);
	}
}
