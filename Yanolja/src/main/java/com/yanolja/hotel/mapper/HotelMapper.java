package com.yanolja.hotel.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.yanolja.command.HotelVO;
import com.yanolja.command.Hr_Room_BookVO;

public interface HotelMapper {
	public ArrayList<HotelVO> getList(@Param("type") String type);
	public int getTotal(@Param("location") String location);
	public HotelVO get_hInfo(String hno);
   
	public String loca(@Param("h_no") int h_no);
   
	public int hreservation(Hr_Room_BookVO hrbvo);
	public ArrayList<Hr_Room_BookVO> hreservationView(String u_Id);
	
	public int bookcancle(Hr_Room_BookVO hrv);
	
	public int getPrice(@Param("hr_no") int hr_no, @Param("hno")int hno);
	public ArrayList<HotelVO> searchList(@Param("sName") String sName);
}