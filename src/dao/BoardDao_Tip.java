package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.sql.SQLException;

import bean.BoardDto_Free;
import bean.BoardDto_Tip;

import manager.SQLmanager;

public class BoardDao_Tip extends SQLmanager{
	//전체 글을 불러옴
	public List getList(){
		
		try {
			//     리턴값 : queryForObject()메소드는 Object타입으로 리턴하기 떄문에 캐스팅해줘야함!!
			//     전달인자 1 : 자기가 사용할 SqlMap파일에 설정한 namespace명.사용할 sql쿼리id
			//     전달인자 2 : where절에 넘길 데이터!!
			
			System.out.println("Dao가 실행됨");
			
			return getSqlMap().queryForList("IbatisBoard.getList_Tip");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
		
	}
	
	//페이징
	public List nowPage_Tip(int start) {
		try {
			//     리턴값 : queryForObject()메소드는 Object타입으로 리턴하기 떄문에 캐스팅해줘야함!!
			//     전달인자 1 : 자기가 사용할 SqlMap파일에 설정한 namespace명.사용할 sql쿼리id
			//     전달인자 2 : where절에 넘길 데이터!!
			
			System.out.println("Tip_Dao가 실행됨");
			
			return getSqlMap().queryForList("IbatisBoard.nowPage_Tip", start);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return null;
		
		
	}
	
	public BoardDto_Tip getRead(int num){
		try {
			//     리턴값 : queryForObject()메소드는 Object타입으로 리턴하기 떄문에 캐스팅해줘야함!!
			//     전달인자 1 : 자기가 사용할 SqlMap파일에 설정한 namespace명.사용할 sql쿼리id
			//     전달인자 2 : where절에 넘길 데이터!!
	
			getSqlMap().update("IbatisBoard.countup_Tip",num);
			
			System.out.println("글번호는 "+num);
			return (BoardDto_Tip) getSqlMap().queryForObject("IbatisBoard.getRead_Tip",num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	public List<BoardDto_Tip> getMyList_Tip(String id) {
		try {
			return getSqlMap().queryForList("IbatisBoard.getMyList_Tip", id);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return null;
	}
	
	public void Tip_update(BoardDto_Tip dto){
		try {
			//     리턴값 : queryForObject()메소드는 Object타입으로 리턴하기 떄문에 캐스팅해줘야함!!
			//     전달인자 1 : 자기가 사용할 SqlMap파일에 설정한 namespace명.사용할 sql쿼리id
			//     전달인자 2 : where절에 넘길 데이터!!
			
			System.out.println("update dao에 들어왔습니다");
			getSqlMap().update("IbatisBoard.update_Tip",dto);
			System.out.println("수정이 완료되었습니다");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void Tip_delete(int num) {
		
		try {
			getSqlMap().delete("IbatisBoard.delete_Tip", num);
		
	} catch (SQLException e) {
		e.printStackTrace();
			
	}
		
	}

	public void Tip_write(BoardDto_Tip dto) {
		try {
			
			
			getSqlMap().update("IbatisBoard.posup_Tip");
			
			getSqlMap().insert("IbatisBoard.write_Tip", dto);
			System.out.println("Tip글이 남겨졌나요?");

		} catch (SQLException e) {

			e.printStackTrace();

		}		
		
	}//endTip_write

	//검색하기
	public ArrayList<BoardDto_Tip> getBoardlist(HashMap<String, Object> listopt){
		System.out.println(listopt.toString());
		
		
		try {
			if(listopt.get("keyField").equals("subject")){
				listopt.put("keyWord1", listopt.get("keyWord"));
			}else if(listopt.get("keyField").equals("Id")){
				listopt.put("keyWord2", listopt.get("keyWord"));
			}else{
				listopt.put("keyWord3", listopt.get("keyWord"));
			}
			
			return (ArrayList<BoardDto_Tip>) getSqlMap().queryForList("IbatisBoard.getBoardlist_Tip", listopt);    
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
    }

	public BoardDto_Tip getDetail(int num) {
		
		BoardDto_Tip board=null;
		
		try {
			System.out.println("글번호는 "+num);
			return (BoardDto_Tip) getSqlMap().queryForObject("IbatisBoard.getDetail_Tip",num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return board;
	}

	public void Tip_REwrite(BoardDto_Tip dto) {
		
		try {
			
			getSqlMap().update("IbatisBoard.boardReply_Tip", dto.getNum());//새로 쓰고 
			
			
			
			getSqlMap().insert("IbatisBoard.REwrite_Tip", dto);//추가 됨
			System.out.println("댓글이 남겨졌나요?");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void check(int num) {
		
	       try {
				
				getSqlMap().update("IbatisBoard.boardCheck_Tip", num);
				
			
				System.out.println("check");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	 
	
}

