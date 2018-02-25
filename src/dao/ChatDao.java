package dao;

import java.sql.SQLException;
import java.util.List;

import bean.Chat_request;
import bean.Chat_room;
import manager.SQLmanager;

public class ChatDao extends SQLmanager {

	// 상담 요청 리스트에 대한 dao작업
	
	// 아이디로 채팅방 목록 가져옴, 상담신청한 채팅방+내가 상담자인 채팅방+나와 운영자의 채팅방
	@SuppressWarnings("unchecked")
	public List<Chat_request> readChatRequestList(String id) {
		try {
			return getSqlMap().queryForList("IbatisChat.readChatRequestList",id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	// 아이디로 채팅방 목록을 가져옴, 내가 신청한 모든 채팅방+나와 운영자의 채팅방
	@SuppressWarnings("unchecked")
	public List<Chat_request> readMyChatRequestList(String id) {
		try {
			return getSqlMap().queryForList("IbatisChat.readMyChatRequestList",id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public List<Chat_request> readAdminRequestList() {
		try {
			return getSqlMap().queryForList("IbatisChat.readAdminRequestList");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	// 나와 운영자의 채팅방의 인덱스를 가져옴
	public int getAdminReqIdx(String id) {
		try {
			return (int) getSqlMap().queryForObject("IbatisChat.getAdminReqIdx",id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	// 해당 채팅방 상태를 가져옴
	public int getChatRequestStatus(int idx) {
		try {
			return (int)getSqlMap().queryForObject("IbatisChat.getChatRequestStatus",idx);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
	}
		
	// 새로운 채팅방 만듬
	public void insertChatRequest(Chat_request req) {
		try {
			getSqlMap().insert("IbatisChat.insertChatRequest",req);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 채팅방의 정보, 상태를 변경함.
	public void updateChatRequestStatus(Chat_request req) {
		try {
			getSqlMap().update("IbatisChat.updateChatRequestStatus",req);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 채팅을 종료함
	public void quitChatRequest(int idx) {
		try {
			getSqlMap().update("IbatisChat.quitChatRequest",idx);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 채팅을 삭제함 : 조회 안되도록 상태 변경
	public void deleteChatRequest(int idx) {
		try {
			getSqlMap().update("IbatisChat.deleteChatRequest",idx);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	// 상담 요청 리스트에 대한 dao작업
	
	// 상담방에 대한 dao작업
	// 해당 채팅방의 메세지들을 가져옴
	@SuppressWarnings("unchecked")
	public List<Chat_room> readChatRoom(Chat_room chat) {
		try {
			getSqlMap().update("IbatisChat.updateCheckMsg",chat);
			return getSqlMap().queryForList("IbatisChat.readChatRoom",chat);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
		
	// 새로운 메세지
	public void insertMessage(Chat_room chat) {
		try {
			getSqlMap().insert("IbatisChat.insertMessage",chat);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 안읽은 메세지들을 가져옴
	@SuppressWarnings("unchecked")
	public List<Integer> readCheckMsg(String id) {
		try {
			return getSqlMap().queryForList("IbatisChat.readCheckMsg", id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	// 상담방에 대한 dao작업

}
