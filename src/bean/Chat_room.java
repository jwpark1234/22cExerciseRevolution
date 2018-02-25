package bean;

import java.sql.Timestamp;

/**
 * @author itwill
 *
 */
public class Chat_room {
	private int idx;
	private int req_idx;
	private String from_id;
	private int from_level;
	private String to_id;
	private String message;
	private Timestamp regdate;
	private int checkMsg;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getReq_idx() {
		return req_idx;
	}
	public void setReq_idx(int req_idx) {
		this.req_idx = req_idx;
	}
	public String getFrom_id() {
		return from_id;
	}
	public void setFrom_id(String from_id) {
		this.from_id = from_id;
	}
	public int getFrom_level() {
		return from_level;
	}
	public void setFrom_level(int from_level) {
		this.from_level = from_level;
	}
	public String getTo_id() {
		return to_id;
	}
	public void setTo_id(String to_id) {
		this.to_id = to_id;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getCheckMsg() {
		return checkMsg;
	}
	public void setCheckMsg(int checkMsg) {
		this.checkMsg = checkMsg;
	}
	
	
}
