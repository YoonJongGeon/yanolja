package com.yanolja.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class H_RoomVO {
	private int h_no;
	private String hr_name;
	private String h_per;
	private String h_price;
	private String h_checkin;
	private String h_checkout;
	private String u_id;
	private int hr_no;	
}