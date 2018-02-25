package adnum;

import java.util.Vector;

public class Adnum {

	String food[]=new String[]{"","food","excercise"};
	String company[]=new String[]{"","company1","company2","company3"};
	
	String [] Healthsupplements=new String[]{"","protein","amino","Supplements","bodyfat","cholesterol","Strength exercise"};
	String [] gender=new String[]{"","male","female"};
	String [] Event=new String[]{"","Event","Hot"};
	int fn;
	int cn;
	int h1n;
	int h2n;
	int gn;
	int en;
	Vector<String[]> v;
	
	
	
	
	
	
	public Adnum() {
		
	}
	
	
	


	
	public String change1(String food,String healthfood,String Heathsuppleme,String gender,String event){
		fn=food.indexOf(food);
		en=healthfood.indexOf(healthfood);
		
		String sum=fn+""+en+""+cn+""+h1n+""+h2n+""+gn+""+en+"-";
		
		
		return sum;
		
	}

	public String[] change2(String num){
		v.add(food);
		v.add(company);
		v.add(Healthsupplements);
		v.add(gender);
		
		
		
		
		String [] result= new String[8];
		
		for(int i=0;i<result.length;i++){
			
			result[i]=v.get(i)[ Character.getNumericValue(num.indexOf(i))];
			
		}
		
		
		return result;
	}
	
	
	
	
}
