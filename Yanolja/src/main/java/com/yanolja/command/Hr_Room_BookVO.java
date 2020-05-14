package com.yanolja.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Hr_Room_BookVO {
   
   private String h_no;
   private String h_name;
   private String hr_no;
   private String u_Id;
   private String hr_CheckIn;
   private String hr_CheckOut;
   private String hr_Book_Pw;
   private String hr_Book_Per;
   private int hr_Book_no;
   
   
}