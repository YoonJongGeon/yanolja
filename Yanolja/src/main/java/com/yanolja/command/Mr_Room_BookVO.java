package com.yanolja.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Mr_Room_BookVO {
   
   private String m_no;
   private String m_name;
   private String mr_no;
   private String u_Id;
   private String mr_CheckIn;
   private String mr_CheckOut;
   private String mr_Book_Pw;
   private String mr_Book_Per;
   private int mr_Book_no;
   
   
}