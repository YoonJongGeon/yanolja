package com.yanolja.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Pr_Room_BookVO {
   
   private String p_no;
   private String p_name;
   private String pr_no;
   private String u_Id;
   private String pr_CheckIn;
   private String pr_CheckOut;
   private String pr_Book_Pw;
   private String pr_Book_Per;
   private int pr_Book_no;
   
   
}