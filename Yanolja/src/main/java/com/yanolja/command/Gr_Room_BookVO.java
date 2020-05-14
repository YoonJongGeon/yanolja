package com.yanolja.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Gr_Room_BookVO {
   
   private String g_no;
   private String g_name;
   private String gr_no;
   private String u_Id;
   private String gr_CheckIn;
   private String gr_CheckOut;
   private String gr_Book_Pw;
   private String gr_Book_Per;
   private int gr_Book_no;
   
   
}