package bean;

import java.sql.Timestamp;

public class Chat_request {
	private int idx;
	private String req_id;
	private int req_level;
	private String resp_id;
	private int resp_level;
	private String subject;
	private Timestamp regdate;
	private int status;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getReq_id() {
		return req_id;
	}
	public void setReq_id(String req_id) {
		this.req_id = req_id;
	}	
	public int getReq_level() {
		return req_level;
	}
	public void setReq_level(int req_level) {
		this.req_level = req_level;
	}
	public String getResp_id() {
		return resp_id;
	}
	public void setResp_id(String resp_id) {
		this.resp_id = resp_id;
	}
	public int getResp_level() {
		return resp_level;
	}
	public void setResp_level(int resp_level) {
		this.resp_level = resp_level;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
