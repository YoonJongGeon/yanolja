package com.yanolja.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserVO {
	private String u_Id;
	private String u_Email1;
	private String u_Email2;
	private String u_Pw;
	private String u_Name;
	private String u_Phone1;
	private String u_Phone2;

}