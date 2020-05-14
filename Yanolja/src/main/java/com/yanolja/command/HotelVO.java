package com.yanolja.command;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HotelVO {

	private int h_no;
	private String h_name;
	private String h_content;
	private String h_locabasic;
	private String h_locadetail;
	private String h_phone;
	private String h_grade;
	private int price;
	
	private ArrayList<H_RoomVO> roominfo;
	
	
}
