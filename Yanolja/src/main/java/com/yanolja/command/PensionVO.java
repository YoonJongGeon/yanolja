package com.yanolja.command;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PensionVO {

	private int p_no;
	private String p_name;
	private String p_content;
	private String p_locabasic;
	private String p_locadetail;
	private String p_phone;
	private String p_grade;
	private int price;
	
	private ArrayList<P_RoomVO> roominfo;
	
	
}
