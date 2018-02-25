package jagi_ganli;

public class Jagi_ganli_plan_1 {
// 자기관리 탑 메뉴 클릭하면 인덱스 테마 제목 뿌리고 해다 ㅇ리스트 뿌리기
	
	public String[] jagi_ganli_plan_by_index_theme(int indexInt){
		String[] result=new String[2];
		
		switch (indexInt) {
	
		case 1:
			result[0]="shoulder/";
			result[1]="어깨 운동 메뉴";
			break;
		case 2:
			result[0]="chest/";
			result[1]="가슴 운동 메뉴";
			break;
		case 3:
			result[0]="back/";
			result[1]="등 운동 메뉴";
			break;
		case 4:
			result[0]="23do/";
			result[1]="이삼두 운동 메뉴";
			break;
		case 5:
			result[0]="bok/";
			result[1]="복근 운동 메뉴";
			break;
		case 6:
			result[0]="waist/";
			result[1]="허리 운동 메뉴";
			break;
		case 7:
			result[0]="leg/";
			result[1]="하체 운동 메뉴";
			break;
		default:
			break;
		}
		
		return result;
		
	}
	
	
	
	
}
