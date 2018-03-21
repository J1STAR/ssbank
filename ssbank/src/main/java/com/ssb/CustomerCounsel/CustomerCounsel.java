package com.ssb.CustomerCounsel;

import org.springframework.web.socket.WebSocketSession;

public class CustomerCounsel {
	private int listNum, boardIdx, categoryIdx, memberIdx;
	private String userId, userName, categoryName;
	private String subject, content, createDate;
	private int hitCount, maximum;
	private WebSocketSession session;
	private RoomInfo room;
}
