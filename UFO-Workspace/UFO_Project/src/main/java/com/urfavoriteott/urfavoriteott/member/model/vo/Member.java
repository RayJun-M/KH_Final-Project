package com.urfavoriteott.urfavoriteott.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본생성자
@AllArgsConstructor // 모든 필드 매개변수 생성자
@Setter
@Getter
@ToString
public class Member {
	
	private int userNo;
	private String userId;
	private String userPwd;
	private String userNickname;
	private String userProfile;
	private Date userEnrollDate;
	private String userStatus;
	
}
