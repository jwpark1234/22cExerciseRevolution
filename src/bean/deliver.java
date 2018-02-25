package bean;

import java.sql.Timestamp;

public class deliver {
	
	private int  num ;
	private String  id; 
	private String  name;
	private String pname;
	private String pimg;
	private int price;
	
	private String  count;
	private int ttime;
	private Timestamp date;
	private String  stat;
	private String dest;
	private int  star;
	
	public deliver() {
		// TODO Auto-generated constructor stub
	}
	public deliver(String id,String pname, String pimg,int price) {
		// TODO Auto-generated constructor stub
		this.id=id;
		this.pname=pname;
		this.price=price;
		this.pimg=pimg;
				
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPimg() {
		return pimg;
	}
	public void setPimg(String pimg) {
		this.pimg = pimg;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public int getTtime() {
		return ttime;
	}
	public void setTtime(int ttime) {
		this.ttime = ttime;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public String getStat() {
		return stat;
	}
	public void setStat(String stat) {
		this.stat = stat;
	}
	public String getDest() {
		return dest;
	}
	public void setDest(String dest) {
		this.dest = dest;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	
	
	
}
