package com.yanolja.command;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GuesthouseVO {

	private int g_no;
	private String g_name;
	private String g_content;
	private String g_locabasic;
	private String g_locadetail;
	private String g_phone;
	private String g_grade;
	private int price;
	
	private ArrayList<G_RoomVO> roominfo;
	
	
}
