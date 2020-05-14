package com.yanolja.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReplyVO {
	private String r_no;
	private String m_no;
	private String h_no;
	private String p_no;
	private String g_no;
	private String reply;
	private String replyId;
	private String replyPw;
	private Timestamp replydate;
	private int rating;
}
