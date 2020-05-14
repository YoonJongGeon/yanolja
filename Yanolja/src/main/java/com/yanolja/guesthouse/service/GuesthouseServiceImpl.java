package com.yanolja.guesthouse.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yanolja.command.Gr_Room_BookVO;
import com.yanolja.command.GuesthouseVO;
import com.yanolja.guesthouse.mapper.GuesthouseMapper;

@Service("guesthouseService")
public class GuesthouseServiceImpl implements GuesthouseService {
	
	@Autowired
	private GuesthouseMapper guesthouseMapper;
	
	@Override
	public ArrayList<GuesthouseVO> getList(String type) {
		return guesthouseMapper.getList(type);
	}

	@Override
	public int getTotal(String location) {
		return guesthouseMapper.getTotal(location);
	}
	
	@Override
	public GuesthouseVO get_gInfo(String gno) {
		return guesthouseMapper.get_gInfo(gno);
	}

	@Override
	public String loca(int g_no) {
		return guesthouseMapper.loca(g_no);
	}

	@Override
	public int greservation(Gr_Room_BookVO grbvo) {
		return guesthouseMapper.greservation(grbvo);
	}

	@Override
	public ArrayList<Gr_Room_BookVO> greservationView(String u_Id) {
		return guesthouseMapper.greservationView(u_Id);
	}

	@Override
	public int bookcancle(Gr_Room_BookVO grv) {
		return guesthouseMapper.bookcancle(grv);
	}

	@Override
	public int getPrice(int gr_no, int gno) {
		return guesthouseMapper.getPrice(gr_no, gno);
	}

	@Override
	public ArrayList<GuesthouseVO> searchList(String sName) {
		return guesthouseMapper.searchList(sName);
	}
}
