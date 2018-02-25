package bean;

public class Food {
	private int idx;
	private String name; // 음식명
	private int quantity; //1회제공량 (g)
	private int calorie; //열량 (kcal)
	private double tan; //탄수화물 (g)
	private double dan; //단백질 (g)
	private double ji; //지방 (g)
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
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
	
}
