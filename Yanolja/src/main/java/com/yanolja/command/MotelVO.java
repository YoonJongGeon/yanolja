package com.yanolja.command;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MotelVO {
	
	private int m_no;
	private String m_name;
	private String m_content;
	private String m_locabasic;
	private String m_locadetail;
	private String m_phone;
	private String m_grade;
	private int price;

	private ArrayList<M_RoomVO> roominfo;
}
