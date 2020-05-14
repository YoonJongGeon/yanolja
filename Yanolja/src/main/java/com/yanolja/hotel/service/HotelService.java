package com.yanolja.hotel.service;

import java.util.ArrayList;

import com.yanolja.command.HotelVO;
import com.yanolja.command.Hr_Room_BookVO;

public interface HotelService {
	
	public ArrayList<HotelVO> getList(String type);
	public int getTotal(String location);
	public HotelVO get_hInfo(String hno);
   
	public String loca(int m_no);
   
	public int hreservation(Hr_Room_BookVO hrbvo);
	public ArrayList<Hr_Room_BookVO> hreservationView(String u_Id);
	
	public int bookcancle(Hr_Room_BookVO hrv);
	
	public int getPrice(int hr_no, int hno);
	public ArrayList<HotelVO> searchList(String sName);
}