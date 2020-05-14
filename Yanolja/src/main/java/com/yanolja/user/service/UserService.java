package com.yanolja.user.service;

import java.util.ArrayList;

import com.yanolja.command.Critaria;
import com.yanolja.command.GuesthouseVO;
import com.yanolja.command.HotelVO;
import com.yanolja.command.MotelVO;
import com.yanolja.command.PensionVO;
import com.yanolja.command.UserVO;

public interface UserService {
	public int join(UserVO vo);
	public int idConfirm(UserVO vo);
	public int login(UserVO vo);
	public UserVO getInfo(String u_Id);
	public int update(UserVO vo);
	public UserVO idFind(UserVO vo);
	public UserVO pwFind(UserVO vo);
	public int pwUpdate(UserVO vo);
	
	public int total(Critaria cri);
    public ArrayList<MotelVO> m_search(String searchName);
    public ArrayList<HotelVO> h_search(String searchName);
	public ArrayList<PensionVO> p_search(String searchName);
	public ArrayList<GuesthouseVO> g_search(String searchName);
}