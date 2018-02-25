package jagi_ganli;

import java.util.Calendar;

public class Calex {

	
	public static void main(String[] args){
		
		Calendar c=Calendar.getInstance();
	//1씩 감소시켜야함
		c.set(2017, 1,27);
		System.out.println(c.getActualMaximum(Calendar.DAY_OF_MONTH)
        );
	
	}
}
