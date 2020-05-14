package com.yanolja.pension.service;

import java.util.ArrayList;

import com.yanolja.command.PensionVO;
import com.yanolja.command.Pr_Room_BookVO;

public interface PensionService {
	
	public ArrayList<PensionVO> getList(String type);
	public int getTotal(String location);
	public PensionVO get_pInfo(String pno);
	
	public String loca(int p_no);
	
	public int preservation(Pr_Room_BookVO prbvo);
	public ArrayList<Pr_Room_BookVO> preservationView(String u_Id);
	
	public int bookcancle(Pr_Room_BookVO prv);
	
	public int getPrice(int pr_no, int pno);
	public ArrayList<PensionVO> searchList(String sName);
}

