package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import bean.event;
import bean.eventEnter;
import manager.SQLmanager;

public class eventEnterDao extends SQLmanager {

    public void daily(eventEnter dto){
        try {
            
            //     占쎌읈占쎈뼎占쎌뵥占쎌쁽 1 : 占쎌쁽占쎌쁽疫꿸퀗占� 占쎄텢占쎌뒠占쎈막 SqlMap占쎈솁占쎌뵬占쎈퓠 占쎄퐬占쎌젟占쎈립 namespace筌륅옙.占쎄텢占쎌뒠占쎈막 sql�뜎�눖�봺id
            //     占쎌읈占쎈뼎占쎌뵥占쎌쁽 2 : where占쎌쟿占쎈퓠 占쎄퐜疫뀐옙 占쎈쑓占쎌뵠占쎄숲!!
            getSqlMap().insert("IbatisEvent.eventEnter", dto);
            System.out.println("筌〓챷肉э옙�끏�뙴占�");
            
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    
    public int dailyCheck(HashMap check){
        try {
            eventEnter ck = new eventEnter();
            ck  = (eventEnter)getSqlMap().queryForObject("IbatisEvent.dailyCheck", check);
            if(ck==null) return 1;
            else return 0;
            }
         catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
    public String pointCheck(String id){
        try {
            return (String)getSqlMap().queryForObject("IbatisEvent.pointCheck", id);
        } catch (SQLException e) {
            e.printStackTrace();
        } return null;
    }
    public int gambleCheck(HashMap gck){
        List arry = new ArrayList();
        try {
             arry = getSqlMap().queryForList("IbatisEvent.gambleCheck", gck);
             System.out.println("占쎄텢占쎌뵠筌앾옙"+arry.size());
        } catch (SQLException e) {
            e.printStackTrace();
        }return arry.size();
    }
    
    public void mainWrite(event event){
        
        try {
            getSqlMap().insert("IbatisEvent.mainWrite", event);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        
    }
    
    public List mainEvent(){
        
            List arry = new ArrayList();
        
        try {
            arry = getSqlMap().queryForList("IbatisEvent.mainEvent");
            
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        
        return arry;
    }
    
    
    public String couponCheck(HashMap<String, String> map){
    	
    	String ck = null;
    	
    	try {
			ck= (String) getSqlMap().queryForObject("IbatisEvent.couponCheck",map);
		} catch (SQLException e) {
			e.printStackTrace();
		}    	
    	return ck;
    	
    	
    }
    
    
    public void couponGet(HashMap map){
        
        try {
            getSqlMap().insert("IbatisEvent.couponGet", map);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
    }
    
    public void eventCount(String subject){
        
        try {
            getSqlMap().update("IbatisEvent.eventCount",subject);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        
    }
    
    
    public void mainChange(String img){
        
        try {
            getSqlMap().update("IbatisEvent.mainChange",img);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public String mainRight(){
        
        try {
            return (String)getSqlMap().queryForObject("IbatisEvent.mainRight");
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }return null;
        
        
    }
    
    public void eventDelete(String subject){
        
        try {
            getSqlMap().delete("IbatisEvent.eventDelete",subject);
        } catch (SQLException e) {
            e.printStackTrace();
        }
            
    }
    
    public event eventUpdate(String subject){
        
        event dto = new event();
        
        try {
            dto = (event)getSqlMap().queryForObject("IbatisEvent.eventUpdate", subject);
        } catch (SQLException e) {
            e.printStackTrace();
        }   return dto;
    }
    
    public void eventUpdateAction(event event){
        
        try {
            getSqlMap().update("IbatisEvent.eventUpdateAction",event);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
    }
    
    public List admin(){
        
        List arry = new ArrayList();
        String cate = "쿠폰";
    try {
        arry = getSqlMap().queryForList("IbatisEvent.admin", cate);
        
        
    } catch (SQLException e) {
        e.printStackTrace();
    }
    
    return arry;
}
    
    
    public List adminList(String subject){
    		
    	List array = new ArrayList();
    	
    	try {
			array = getSqlMap().queryForList("IbatisEvent.adminList", subject);
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return array;
    	
    }
    
    public String joinCheck(HashMap hash){
    	
    	try {
			return (String)getSqlMap().queryForObject("IbatisEvent.joinCheck", hash);
		} catch (SQLException e) {
			e.printStackTrace();
		}return null;
    }
    
    public void eventJoin(eventEnter dto){
    	
    	try {
			getSqlMap().insert("IbatisEvent.eventJoin",dto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	
    	
    }
    
    public int eventGive(String subject){
    	
    	try {
			 return (int)getSqlMap().queryForObject("IbatisEvent.eventGive", subject);
		} catch (SQLException e) {
			e.printStackTrace();
		} return -1;
    	
    }
    
    public void eventChoice(HashMap map){
    	
    	try {
			getSqlMap().update("IbatisEvent.eventChoice", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
    }
    
    public void eventFail(String subject){
    	
    	try {
			getSqlMap().update("IbatisEvent.eventFail", subject);
		} catch (SQLException e) {
			e.printStackTrace();
		}
    }
    
    public void eventFinish(String subject){
    	
    	try {
			getSqlMap().update("IbatisEvent.eventFinish",subject);
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	
    }
    
    public int eventChoiceCheck(String subject){
    	
    		int finish = -1;
    	try {
			finish = (int)getSqlMap().queryForObject("IbatisEvent.eventChoiceCheck",subject);
		} catch (SQLException e) {
			e.printStackTrace();
		}return finish;
    }
    
    public List eventMsg(String subject){
    	
    	List arry = new ArrayList();
    	
    	try {
			arry = getSqlMap().queryForList("IbatisEvent.eventMsg", subject);
		} catch (SQLException e) {
			e.printStackTrace();
		}return arry;
    	
    }
    
    public String imgMain(){
    	try {
			return (String)getSqlMap().queryForObject("IbatisEvent.imgMain");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}return null;
    }
    
    public void gambleResult(HashMap map){
    	
    	try {
			getSqlMap().insert("IbatisEvent.gambleResult", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	
    }
    
    public List<HashMap<String, String>> gambleResult1(String id){
    	
    	List<HashMap<String, String>> arry = new ArrayList();
    	
    	try {
			arry = getSqlMap().queryForList("IbatisEvent.gambleResult1",id);
			System.out.println(arry.size());
		} catch (SQLException e) {
			e.printStackTrace();
		}return arry;
    	
    }
    
    public List<HashMap<String, String>> eventMypage(String id){
    	
    	try {
			return (List<HashMap<String, String>>)getSqlMap().queryForList("IbatisEvent.eventMypage", id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return null;
    }
}
    

