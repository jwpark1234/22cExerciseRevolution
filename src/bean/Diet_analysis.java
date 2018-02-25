package bean;

import java.sql.Timestamp;

public class Diet_analysis {
	private String Id;
	private String category;
	private int calorie;
	private double tan;
	private double dan;
	private double ji;
	private Timestamp regdate;
	
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getCalorie() {
		return calorie;
	}
	public void setCalorie(int calorie) {
		this.calorie = calorie;
	}
	public double getTan() {
		return tan;
	}
	public void setTan(double tan) {
		this.tan = tan;
	}
	public double getDan() {
		return dan;
	}
	public void setDan(double dan) {
		this.dan = dan;
	}
	public double getJi() {
		return ji;
	}
	public void setJi(double ji) {
		this.ji = ji;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
}
