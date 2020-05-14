package com.yanolja.user.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yanolja.command.Critaria;
import com.yanolja.command.GuesthouseVO;
import com.yanolja.command.HotelVO;
import com.yanolja.command.MotelVO;
import com.yanolja.command.PensionVO;
import com.yanolja.command.UserVO;
import com.yanolja.user.mapper.UserMapper;
@Service("userService")
public class UserServiceImpl implements UserService{

   @Autowired
   private UserMapper userMapper;
   
   @Override
   public int join(UserVO vo) {
      return userMapper.join(vo);
   }

   @Override
   public int idConfirm(UserVO vo) {
      return userMapper.idConfirm(vo);
   }

   @Override
   public int login(UserVO vo) {
      return userMapper.login(vo);
   }

   @Override
   public UserVO getInfo(String u_Id) {
      return userMapper.getInfo(u_Id);
   }

   @Override
   public int update(UserVO vo) {
      return userMapper.update(vo);
   }

	@Override
	public UserVO idFind(UserVO vo) {
		return userMapper.idFind(vo);
	}

	@Override
	public UserVO pwFind(UserVO vo) {
		return userMapper.pwFind(vo);
	}

	@Override
	public int pwUpdate(UserVO vo) {
		return userMapper.pwUpdate(vo);
	}

	@Override
	public int total(Critaria cri) {
		
		return userMapper.total(cri);
	}
	
	@Override
	public ArrayList<MotelVO> m_search(String searchName) {
		return userMapper.m_search(searchName);
	}


	@Override
	public ArrayList<HotelVO> h_search(String searchName) {
		return userMapper.h_search(searchName);
	}
	
	@Override
	public ArrayList<PensionVO> p_search(String searchName) {
		return userMapper.p_search(searchName);
	}

	@Override
	public ArrayList<GuesthouseVO> g_search(String searchName) {
		return userMapper.g_search(searchName);
	}

}