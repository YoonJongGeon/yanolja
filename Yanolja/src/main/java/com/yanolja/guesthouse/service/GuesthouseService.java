package com.yanolja.guesthouse.service;

import java.util.ArrayList;

import com.yanolja.command.Gr_Room_BookVO;
import com.yanolja.command.GuesthouseVO;

public interface GuesthouseService {
	
	public ArrayList<GuesthouseVO> getList(String type);
	public int getTotal(String location);
	public GuesthouseVO get_gInfo(String gno);
	
	public String loca(int g_no);
	
	public int greservation(Gr_Room_BookVO grbvo);
	public ArrayList<Gr_Room_BookVO> greservationView(String u_Id);
	
	public int bookcancle(Gr_Room_BookVO grv);
	
	public int getPrice(int gr_no, int gno);
	public ArrayList<GuesthouseVO> searchList(String sName);
}
