package com.yanolja.guesthouse.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.yanolja.command.Gr_Room_BookVO;
import com.yanolja.command.GuesthouseVO;

public interface GuesthouseMapper {
	public ArrayList<GuesthouseVO> getList(@Param("type") String type);
	public int getTotal(@Param("location") String location);
	public GuesthouseVO get_gInfo(String gno);
	
	public String loca(@Param("g_no") int g_no);
	
	public int greservation(Gr_Room_BookVO grbvo);
	public ArrayList<Gr_Room_BookVO> greservationView(String u_Id);
	
	public int bookcancle(Gr_Room_BookVO grv);
	
	public int getPrice(@Param("gr_no") int gr_no, @Param("gno")int gno);
	public ArrayList<GuesthouseVO> searchList(@Param("sName") String sName);
}
