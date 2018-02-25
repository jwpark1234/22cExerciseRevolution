package bean;

import java.sql.Timestamp;

public class Ex_postDto {
	
//	create table ex_post(
//			num int primary key auto_increment,
//			subject varchar(30) not null,
//			content varchar(100) not null,
//			regdate timestamp null default current_timestamp
//			);
	
	private int num;
	private String Id;
	private String subject;
	private String content;
	private Timestamp regdate;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return Id;
	}
	public void setId(String Id) {
		this.Id = Id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
	
	
	
	
	
}
