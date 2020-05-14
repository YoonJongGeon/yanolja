package com.yanolja.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class P_RoomVO {
	private int p_no;
	private String pr_name;
	private String p_per;
	private String p_price;
	private String p_checkin;
	private String p_checkout;
	private String u_id;
	private int pr_no;	
}