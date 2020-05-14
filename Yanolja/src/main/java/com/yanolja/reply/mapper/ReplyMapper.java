package com.yanolja.reply.mapper;

import java.util.ArrayList;

import com.yanolja.command.ReplyVO;

public interface ReplyMapper {

	public int motel_input_reply(ReplyVO vo);
	public int hotel_input_reply(ReplyVO vo);
	public int guesthouse_input_reply(ReplyVO vo);
	public int pension_input_reply(ReplyVO vo);
	public ArrayList<ReplyVO> motel_replyList(int m_no);
	public ArrayList<ReplyVO> hotel_replyList(int h_no);
	public ArrayList<ReplyVO> guesthouse_replyList(int g_no);
	public ArrayList<ReplyVO> pension_replyList(int p_no);
	public int pwCheck(ReplyVO vo);
	public int delete(ReplyVO vo);
	
	
}
