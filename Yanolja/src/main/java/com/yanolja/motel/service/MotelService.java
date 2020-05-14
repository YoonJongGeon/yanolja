package com.yanolja.motel.service;

import java.util.ArrayList;

import com.yanolja.command.MotelVO;
import com.yanolja.command.Mr_Room_BookVO;

public interface MotelService {
	
   public ArrayList<MotelVO> getList(String type);
   public int getTotal(String location);
   public MotelVO get_mInfo(String mno);
   
   public String loca(int m_no);
   
   public int mreservation(Mr_Room_BookVO mrbvo);
   public ArrayList<Mr_Room_BookVO> mreservationView(String u_Id);
   
   public int bookcancle(Mr_Room_BookVO mrv);
   
   public int getPrice(int mr_no, int mno);
   public ArrayList<MotelVO> searchList(String sName);
}