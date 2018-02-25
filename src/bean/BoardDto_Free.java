package bean;

import java.sql.Timestamp;

public class BoardDto_Free {
	
	private int Num;
	private String Id;
	private String Subject;
	private String Password;
	private Timestamp date;
	private int Re_step;
	private int Readcount;
	private String Content;
	private int pos;
	private int depth;
	
	public int getPos() {
		return pos;
	}
	public void setPos(int pos) {
		this.pos = pos;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getNum() {
		return Num;
	}
	public void setNum(int num) {
		Num = num;
	}
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getSubject() {
		return Subject;
	}
	public void setSubject(String subject) {
		Subject = subject;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public int getRe_step() {
		return Re_step;
	}
	public void setRe_step(int re_step) {
		Re_step = re_step;
	}
	public int getReadcount() {
		return Readcount;
	}
	public void setReadcount(int readcount) {
		Readcount = readcount;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
}
