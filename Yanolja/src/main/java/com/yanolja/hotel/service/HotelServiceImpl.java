package com.yanolja.hotel.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yanolja.command.HotelVO;
import com.yanolja.command.Hr_Room_BookVO;
import com.yanolja.hotel.mapper.HotelMapper;

@Service("hotelService")
public class HotelServiceImpl implements HotelService{

   @Autowired
   private HotelMapper hotelMapper;

	@Override
	public ArrayList<HotelVO> getList(String type) {
		return hotelMapper.getList(type);
	}

	@Override
	public int getTotal(String location) {
		return hotelMapper.getTotal(location);
	}

	@Override
	public HotelVO get_hInfo(String hno) {
		return hotelMapper.get_hInfo(hno);
	}

	@Override
	public String loca(int m_no) {
		return hotelMapper.loca(m_no);
	}

	@Override
	public int hreservation(Hr_Room_BookVO hrbvo) {
		return hotelMapper.hreservation(hrbvo);
	}

	@Override
	public ArrayList<Hr_Room_BookVO> hreservationView(String u_Id) {
		return hotelMapper.hreservationView(u_Id);
	}

	@Override
	public int bookcancle(Hr_Room_BookVO hrv) {
		return hotelMapper.bookcancle(hrv);
	}

	@Override
	public int getPrice(int hr_no, int hno) {
		return hotelMapper.getPrice(hr_no, hno);
	}

	@Override
	public ArrayList<HotelVO> searchList(String sName) {
		return hotelMapper.searchList(sName);
	}
   
   
}