package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import bean.BoardDto_Free;
import bean.BoardDto_Tip;
import manager.SQLmanager;

public class BoardDao_Free extends SQLmanager{

	public List getList() {
		try {
			//     리턴값 : queryForObject()메소드는 Object타입으로 리턴하기 떄문에 캐스팅해줘야함!!
			//     전달인자 1 : 자기가 사용할 SqlMap파일에 설정한 namespace명.사용할 sql쿼리id
			//     전달인자 2 : where절에 넘길 데이터!!
			
			System.out.println("Free_Dao가 실행됨");
			
			return getSqlMap().queryForList("IbatisBoard.getList_Free");
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return null;
		
		
	}
	
	//페이징
	public List nowPage_Free(int start) {
		try {
			//     리턴값 : queryForObject()메소드는 Object타입으로 리턴하기 떄문에 캐스팅해줘야함!!
			//     전달인자 1 : 자기가 사용할 SqlMap파일에 설정한 namespace명.사용할 sql쿼리id
			//     전달인자 2 : where절에 넘길 데이터!!
			
			System.out.println("Free_Dao가 실행됨");
			
			return getSqlMap().queryForList("IbatisBoard.nowPage_Free", start);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return null;
		
		
	}

	public BoardDto_Free getRead(int num) {
		try {
			//     리턴값 : queryForObject()메소드는 Object타입으로 리턴하기 떄문에 캐스팅해줘야함!!
			//     전달인자 1 : 자기가 사용할 SqlMap파일에 설정한 namespace명.사용할 sql쿼리id
			//     전달인자 2 : where절에 넘길 데이터!!
			getSqlMap().update("IbatisBoard.countup_Free",num);
			
			System.out.println("글번호는 "+num);
			return (BoardDto_Free) getSqlMap().queryForObject("IbatisBoard.getRead_Free",num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;

      }
	
	public List<BoardDto_Free> getMyList_Free(String id) {
		try {
			return getSqlMap().queryForList("IbatisBoard.getMyList_Free", id);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return null;
	}
	
	public void Free_update(BoardDto_Free dto) {
		try {
			//     리턴값 : queryForObject()메소드는 Object타입으로 리턴하기 떄문에 캐스팅해줘야함!!
			//     전달인자 1 : 자기가 사용할 SqlMap파일에 설정한 namespace명.사용할 sql쿼리id
			//     전달인자 2 : where절에 넘길 데이터!!
			
			System.out.println("update dao_Free에 들어왔습니다");
			getSqlMap().update("IbatisBoard.update_Free",dto);
			System.out.println("수정이 완료되었습니다");
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}

	public void Free_delete(int num) {
		
		try {
			getSqlMap().delete("IbatisBoard.delete_Free", num);
		
	} catch (SQLException e) {
		e.printStackTrace();
			
	}
		
		
	}//endFree_delete

	public void Free_write(BoardDto_Free dto) {
		try {

			getSqlMap().update("IbatisBoard.posup_Free");
			getSqlMap().insert("IbatisBoard.write_Free", dto);
			System.out.println("Free글이 남겨졌나요?");

		} catch (SQLException e) {

			e.printStackTrace();

		}
	}//endFree_write
	
	//검색하기
		public ArrayList<BoardDto_Free> getBoardlist(HashMap<String, Object> listopt){
			
			System.out.println(listopt.toString());
			
			try {
				if(listopt.get("keyField").equals("subject")){
					listopt.put("keyWord1", listopt.get("keyWord"));
				}else if(listopt.get("keyField").equals("Id")){
					listopt.put("keyWord2", listopt.get("keyWord"));
				}else{
					listopt.put("keyWord3", listopt.get("keyWord"));
				}
				
				return (ArrayList<BoardDto_Free>) getSqlMap().queryForList("IbatisBoard.getBoardlist_Free", listopt);    
					
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return null;
	    }

		public BoardDto_Free getDetail(int num) {
			
			BoardDto_Free board=null;
			
			try {
				System.out.println("글번호는 "+num);
				return (BoardDto_Free) getSqlMap().queryForObject("IbatisBoard.getDetail_Free",num);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return board;
		}

		public void Free_REwrite(BoardDto_Free dto) {
			
			try {
				
				getSqlMap().update("IbatisBoard.boardReply_Free", dto.getNum());//새로 쓰고 
				
				
				
				getSqlMap().insert("IbatisBoard.REwrite_Free", dto);//추가 됨
				System.out.println("Free댓글");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		public void check(int num) {
			
		       try {
					
					getSqlMap().update("IbatisBoard.boardCheck_Free", num);
					
				
					System.out.println("check");
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
	
	
	}
