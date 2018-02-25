package bean;

import java.security.Timestamp;

public class buyDto {
	private int num;
private	String name;
private String img;
private Timestamp datetime; 
private	String adnum ;
private	int price;
private	String sexpl; 
private	String lexpl;
private	String body ;
private	int stock ;
private int sell;
private	int grade;
private	String fexpl;

public buyDto() {
	// TODO Auto-generated constructor stub
}
public buyDto(String name,String img,String adnum,int price,String sexpl,String lexpl,
				int stock,String fexpl) {
	this.name=name;
	this.img=img;
	this.adnum=adnum;
	this.price=price;
	this.sexpl=sexpl;
	this.lexpl=lexpl;
	this.stock=stock;
	this.fexpl=fexpl; 
	// TODO Auto-generated constructor stub
}
public String getName() {
	return name;
}
public int getNum() {
	return num;
}
public void setNum(int num) {
	this.num = num;
}
public int getSell() {
	return sell;
}
public void setSell(int sell) {
	this.sell = sell;
}
public void setName(String name) {
	this.name = name;
}
public String getImg() {
	return img;
}
public void setImg(String img) {
	this.img = img;
}
public Timestamp getDatetime() {
	return datetime;
}
public void setDatetime(Timestamp datetime) {
	this.datetime = datetime;
}

public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public String getSexpl() {
	return sexpl;
}
public void setSexpl(String sexpl) {
	this.sexpl = sexpl;
}
public String getLexpl() {
	return lexpl;
}
public void setLexpl(String lexpl) {
	this.lexpl = lexpl;
}
public String getBody() {
	return body;
}
public void setBody(String body) {
	this.body = body;
}
public int getStock() {
	return stock;
}
public void setStock(int stock) {
	this.stock = stock;
}
public String getAdnum() {
	return adnum;
}
public void setAdnum(String adnum) {
	this.adnum = adnum;
}
public int getGrade() {
	return grade;
}
public void setGrade(int grade) {
	this.grade = grade;
}
public String getFexpl() {
	return fexpl;
}
public void setFexpl(String fexpl) {
	this.fexpl = fexpl;
}



}
