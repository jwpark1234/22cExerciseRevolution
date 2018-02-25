package jagi_ganli;

import java.util.Calendar;

public class Cal {
	Calendar cal;
	//현재 월 현재 년도
	public int[] currentCal(){
		cal=Calendar.getInstance();
		int nowYear = cal.get(Calendar.YEAR);
        int nowMonth = cal.get(Calendar.MONTH)+1;
        int result[]={nowYear,nowMonth};
        return result;
	}
	
	
	public String[][] getCal(int year,int month,int day){
	    
        cal = Calendar.getInstance(); //캘린더 인스턴스 얻기
        //필요한 정보 받기 해당 년도 , 해당월 
        //이 두개로 해당 1일의 요일 마지막 요일 얻을수 잇음
        
       cal.set(year, month-1,1);	
      
     
//        int today = cal.get(Calendar.DATE); //오늘 일자 저장  
        String calStr[][]=new String[6][7];
       
        int sDayNum = cal.get(Calendar.DAY_OF_WEEK); // 1일의 요일 얻어오기, SUNDAY (1) .MONDAY(2) , TUESDAY(3),.....
        int endDate = cal.getActualMaximum(Calendar.DAY_OF_MONTH); //달의 마지막일 얻기
        			
        int nowYear = cal.get(Calendar.YEAR);
        int nowMonth = cal.get(Calendar.MONTH);  //0이 1월 1이 2월 2가 3월
        
        System.out.println("===================== "+ nowYear+"년  " + (nowMonth+1) + "월 ==================");
        System.out.println("해당 달의 마지막일:"+endDate);
        
//        int sDay = sDayNum;
        
        //요일명 출력
        System.out.println(" 일\t 월\t 화\t 수\t 목\t 금\t 토\t");  
        System.out.println("====================================================");
        //1일이 시작되는 이전의 요일 공백으로 채우기 
        int row=0;
        int col=-1;
        for (int i=1; i<=sDayNum;i++){
        	col++;
        	calStr[row][col]=null;
        
        }//for----------------- 
        for (int i = 1; i <= endDate ; i++) {   // 1부터 마지막일까지 반복.        
            if(col==7){
            	col=0;
            	row++;
            }
            
        	calStr[row][col]=String.valueOf(i);
        	col++;
               
        }//for-----------------           

		
        for(int i=0; i<calStr.length;i++){
        	for(int j=0; j<calStr[i].length;j++){
        		System.out.print(" "+calStr[i][j]);
        	}
        	System.out.println();
        }
        
        
        return calStr;
	}//end getCal
        
        

}
