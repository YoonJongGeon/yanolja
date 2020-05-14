package com.yanolja.pension.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yanolja.command.PensionVO;
import com.yanolja.command.Pr_Room_BookVO;
import com.yanolja.pension.mapper.PensionMapper;

@Service("pensionService")
public class PensionServiceImpl implements PensionService {
	
	@Autowired
	private PensionMapper pensionMapper;

	@Override
	public ArrayList<PensionVO> getList(String type) {
		return pensionMapper.getList(type);
	}

	@Override
	public int getTotal(String location) {
		return pensionMapper.getTotal(location);
	}

	@Override
	public PensionVO get_pInfo(String pno) {
		return pensionMapper.get_pInfo(pno);
	}

	@Override
	public String loca(int p_no) {
		return pensionMapper.loca(p_no);
	}

	@Override
	public int preservation(Pr_Room_BookVO prbvo) {
		return pensionMapper.preservation(prbvo);
	}

	@Override
	public ArrayList<Pr_Room_BookVO> preservationView(String u_Id) {
		return pensionMapper.preservationView(u_Id);
	}

	@Override
	public int bookcancle(Pr_Room_BookVO prv) {
		return pensionMapper.bookcancle(prv);
	}

	@Override
	public int getPrice(int pr_no, int pno) {
		return pensionMapper.getPrice(pr_no, pno);
	}

	@Override
	public ArrayList<PensionVO> searchList(String sName) {
		return pensionMapper.searchList(sName);
	}
	
}
