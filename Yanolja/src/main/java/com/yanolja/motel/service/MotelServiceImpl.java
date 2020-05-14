package com.yanolja.motel.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yanolja.command.MotelVO;
import com.yanolja.command.Mr_Room_BookVO;
import com.yanolja.motel.mapper.MotelMapper;

@Service("motelService")
public class MotelServiceImpl implements MotelService{

   @Autowired
   private MotelMapper motelMapper;
   
   @Override
   public ArrayList<MotelVO> getList(String type) {
      return motelMapper.getList(type);
   }

   @Override
   public int getTotal(String location) {
      return motelMapper.getTotal(location);
   }
   
   @Override
   public MotelVO get_mInfo(String mno) {
      return motelMapper.get_mInfo(mno);
   }
   
	@Override
	public String loca(int m_no) {
		return motelMapper.loca(m_no);
	}
	
	@Override
	public int mreservation(Mr_Room_BookVO mrbvo) {
	   return motelMapper.mreservation(mrbvo);
	}

	@Override
	public ArrayList<Mr_Room_BookVO> mreservationView(String u_Id) {
	   return motelMapper.mreservationView(u_Id);
	}

	@Override
	public int bookcancle(Mr_Room_BookVO mrv) {
		return motelMapper.bookcancle(mrv);
	}

	@Override
	public int getPrice(int mr_no, int mno) {
		return motelMapper.getPrice(mr_no, mno);
	}

	@Override
	public ArrayList<MotelVO> searchList(String sName) {
		return motelMapper.searchList(sName);
	}

}