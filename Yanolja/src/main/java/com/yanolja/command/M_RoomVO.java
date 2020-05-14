package com.yanolja.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class M_RoomVO {
	private int m_no;
	private String mr_name;
	private String m_per;
	private String m_price;
	private String u_id;
	private int mr_no;	
}
