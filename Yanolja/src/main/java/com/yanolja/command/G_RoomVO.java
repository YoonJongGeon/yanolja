package com.yanolja.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class G_RoomVO {
	private int g_no;
	private String gr_name;
	private String g_per;
	private String g_price;
	private String g_checkin;
	private String g_checkout;
	private String u_id;
	private int gr_no;	
}