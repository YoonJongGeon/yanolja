package com.yanolja.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import com.yanolja.command.ReplyVO;
import com.yanolja.reply.service.ReplyService;

@RestController
@RequestMapping("/reply")
public class ReplyController {

	@Autowired
	@Qualifier("replyService")
	private ReplyService replyService;
	
	/* ============================== 댓글 등록 ============================== */
	// 모텔 댓글 후기 등록
	@RequestMapping("/motel_input_reply")
	public int motel_input_reply(@RequestBody ReplyVO vo, Model model) {
		int result = replyService.motel_input_reply(vo);		
		return result;
	}
	// 호텔 댓글 후기 등록
	@RequestMapping("/hotel_input_reply")
	public int hotel_input_reply(@RequestBody ReplyVO vo, Model model) {
		int result = replyService.hotel_input_reply(vo);		
		return result;
	}
	// 게스트하우스 댓글 후기 등록
	@RequestMapping("/guesthouse_input_reply")
	public int guesthouse_input_reply(@RequestBody ReplyVO vo, Model model) {
		int result = replyService.guesthouse_input_reply(vo);		
		return result;
	}
	// 펜션 댓글 후기 등록
	@RequestMapping("/pension_input_reply")
	public int pension_input_reply(@RequestBody ReplyVO vo, Model model) {
		int result = replyService.pension_input_reply(vo);		
		return result;
	}
	
	/* ============================== 댓글 후기 List ============================== */
	// 모텔 댓글 후기 List
	@RequestMapping("/motel_list_reply/{m_no}")
	public ArrayList<ReplyVO> motel_list_reply(@PathVariable("m_no") int m_no) {
		ArrayList<ReplyVO> list = replyService.motel_replyList(m_no);
		return list;
	}
	// 호텔 댓글 후기 List
	@RequestMapping("/hotel_list_reply/{h_no}")
	public ArrayList<ReplyVO> hotel_list_reply(@PathVariable("h_no") int h_no) {
		ArrayList<ReplyVO> list = replyService.hotel_replyList(h_no);
		return list;
	}
	// 게스트하우스 댓글 후기 List
	@RequestMapping("/guesthouse_list_reply/{g_no}")
	public ArrayList<ReplyVO> guesthouse_list_reply(@PathVariable("g_no") int g_no) {
		ArrayList<ReplyVO> list = replyService.guesthouse_replyList(g_no);
		return list;
	}
	// 펜션 댓글 후기 List
	@RequestMapping("/pension_list_reply/{p_no}")
	public ArrayList<ReplyVO> pensionl_list_reply(@PathVariable("p_no") int p_no) {
		ArrayList<ReplyVO> list = replyService.pension_replyList(p_no);
		return list;
	}
	
	/* ============================== 댓글 후기 삭제 ============================== */
	// 댓글 후기 삭제
	@RequestMapping("/delete_reply")
	public int delete_reply(@RequestBody ReplyVO vo) {
		int result = replyService.pwCheck(vo);
		if (result == 1) {
			return replyService.delete(vo);
		}
		else {
			return 0;
		}
	}
}



