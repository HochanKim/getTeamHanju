package com.example.hanju.details.model;

import lombok.Data;

@Data
public class Comment {
   private String commentId;
   private String sellId;
   private String userId;
   private String content;
   private String grade;
   private String cDateTime;
   private String parentId;

   //유저
   private String userName;

   //이미지
   private String fileOrgName;
   private String filePath;
}
