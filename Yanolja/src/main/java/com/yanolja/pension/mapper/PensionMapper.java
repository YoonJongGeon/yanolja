package com.yanolja.pension.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.yanolja.command.PensionVO;
import com.yanolja.command.Pr_Room_BookVO;

public interface PensionMapper {
	
	public ArrayList<PensionVO> getList(@Param("type") String type);
	public int getTotal(@Param("location") String location);
	public PensionVO get_pInfo(String pno);
	
	public String loca(@Param("p_no") int p_no);
	
	public int preservation(Pr_Room_BookVO prbvo);
	public ArrayList<Pr_Room_BookVO> preservationView(String u_Id);
	
	public int bookcancle(Pr_Room_BookVO prv);
	
	public int getPrice(@Param("pr_no") int pr_no, @Param("pno")int pno);
	public ArrayList<PensionVO> searchList(@Param("sName") String sName);
}
