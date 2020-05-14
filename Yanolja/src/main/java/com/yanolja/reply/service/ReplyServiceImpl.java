package com.yanolja.reply.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yanolja.command.ReplyVO;
import com.yanolja.reply.mapper.ReplyMapper;


@Service("replyService")
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper replyMapper;
	
	/* ============================== 댓글 등록 ============================== */
	// 모텔 댓글 후기 등록	
	@Override
	public int motel_input_reply(ReplyVO vo) {
		return replyMapper.motel_input_reply(vo);
	}
	// 호텔 댓글 후기 등록
	@Override
	public int hotel_input_reply(ReplyVO vo) {
		return replyMapper.hotel_input_reply(vo);
	}
	// 게스트하우스 댓글 후기 등록
	@Override
	public int guesthouse_input_reply(ReplyVO vo) {
		return replyMapper.guesthouse_input_reply(vo);
	}
	// 펜션 댓글 후기 등록
	@Override
	public int pension_input_reply(ReplyVO vo) {
		return replyMapper.pension_input_reply(vo);
	}
	
	/* ============================== 댓글 후기 List ============================== */
	// 모텔 댓글 후기 List
	@Override
	public ArrayList<ReplyVO> motel_replyList(int m_no) {
		return replyMapper.motel_replyList(m_no);
	}
	// 호텔 댓글 후기 List
	@Override
	public ArrayList<ReplyVO> hotel_replyList(int h_no) {
		return replyMapper.hotel_replyList(h_no);
	}
	// 게스트하우스 댓글 후기 List
	@Override
	public ArrayList<ReplyVO> guesthouse_replyList(int g_no) {
		return replyMapper.guesthouse_replyList(g_no);
	}
	// 펜션 댓글 후기 List
	@Override
	public ArrayList<ReplyVO> pension_replyList(int p_no) {
		return replyMapper.pension_replyList(p_no);
	}
	
	/* ============================== 댓글 후기 삭제 ============================== */
	// 댓글 비밀번호 찾기
	@Override
	public int pwCheck(ReplyVO vo) {
		return replyMapper.pwCheck(vo);
	}
	// 댓글 삭제 처리
	@Override
	public int delete(ReplyVO vo) {
		return replyMapper.delete(vo);
	}
}
