package bean;

public class datdto {
	private String id,content,pname;
	private int grade;
	
	
	public datdto() {
		// TODO Auto-generated constructor stub
	}
	public datdto(String id,String pname,String content,int grade) {
		
		this.id=id;
		this.pname=pname;
		this.content=content;
		this.grade=grade;
		// TODO Auto-generated constructor stub
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
}
