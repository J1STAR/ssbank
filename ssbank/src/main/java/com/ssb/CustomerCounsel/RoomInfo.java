package com.ssb.CustomerCounsel;

import java.util.HashSet;
import java.util.Set;

public class RoomInfo {
	private String subject;          // 방제목
	private String userName;      // 개설자 닉네임
	private int maximum;          // 최대 인원수
	
	// 채팅방 참여자
	private Set<String> guestSet=new HashSet<>();

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getUserkName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getMaximum() {
		return maximum;
	}

	public void setMaximum(int maximum) {
		this.maximum = maximum;
	}

	public Set<String> getGuestSet() {
		return guestSet;
	}

	public void setGuestSet(Set<String> guestSet) {
		this.guestSet = guestSet;
	}
}
