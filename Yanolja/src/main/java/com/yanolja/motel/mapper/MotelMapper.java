package com.yanolja.motel.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.yanolja.command.MotelVO;
import com.yanolja.command.Mr_Room_BookVO;

public interface MotelMapper {
	
   public ArrayList<MotelVO> getList(@Param("type") String type);
   public int getTotal(@Param("location") String location);
   public MotelVO get_mInfo(String mno);
   
   public String loca(@Param("m_no") int m_no);
   
   public int mreservation(Mr_Room_BookVO mrbvo);
   public ArrayList<Mr_Room_BookVO> mreservationView(String u_Id);
   
   public int bookcancle(Mr_Room_BookVO mrv);
   
   public int getPrice(@Param("mr_no") int mr_no, @Param("mno")int mno);
   public ArrayList<MotelVO> searchList(@Param("sName") String sName);
}