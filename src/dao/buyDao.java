package dao;




import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import bean.User;
import bean.buyDto;
import bean.coupon;
import bean.datdto;
import bean.deliver;
import manager.SQLmanager;

public class buyDao extends SQLmanager{
	
	public List<buyDto> get(){
		
		try{
			
			return getSqlMap().queryForList("IbatisEx_buy.getall");
		}catch(Exception e){
			System.out.println("get()에러: "+e);
		}
		
		return null;
	}
	public List<buyDto> get_key(String Keyword){
		
		try{
			
			return getSqlMap().queryForList("IbatisEx_buy.get_key",Keyword);
		}catch(Exception e){
			System.out.println("get()에러: "+e);
		}
		
		return null;
	}
	
	public List<buyDto> get_adnum(String str){
		
		try{
			
			return getSqlMap().queryForList("IbatisEx_buy.get_Adnum",str);
		}catch(Exception e){
			System.out.println("getadnum()에러: "+e);
		}
		
		return null;
	}
	
	
	
	
	public buyDto readArticle(String name){
	
		
		try{
			return (buyDto)getSqlMap().queryForObject("IbatisEx_buy.articleRead",name);
		}catch(Exception e){
			System.out.println("readArticle()에러: "+e);
		}
		
		return null;
	}
	
	public buyDto readArticleByNum(int num){
		
		try{
			return (buyDto)getSqlMap().queryForObject("IbatisEx_buy.articleReadByNum",num);
		}catch(Exception e){
			System.out.println("readArticle()에러: "+e);
		}
		
		return null;
	}
	
public void delArticle(String name){
	
		
		try{
			getSqlMap().delete("IbatisEx_buy.articleDel",name);
		}catch(Exception e){
			System.out.println("DelArticle()에러: "+e);
		}
		
		
	}
public void insertsboard(buyDto bdto) {
	try{
		getSqlMap().insert("IbatisEx_buy.inserts",bdto);
	}catch(Exception  e){
		System.out.println("insertsboard()에러:+"+e);		
	}
	
}

		public Object insertdeliver1(deliver deliver) {
			// TODO Auto-generated method stub
			try{
				
				
				Object result=getSqlMap().insert("IbatisEx_buy.insertdeliver1",deliver);
				System.out.println("insertdeliver1 ::"+result);
				return result;
			}catch(Exception  e){
				System.out.println("insertdeliver1()에러:::+"+e);	
				return null;
			}
		}
		public void insertdeliver2(deliver deliver) {
			// TODO Auto-generated method stub
			try{
				
				getSqlMap().insert("IbatisEx_buy.insertdeliver2",deliver);
			}catch(Exception  e){
				System.out.println("insertdeliver2()에러:::+"+e);		
			}
		}
		public List<deliver> overlapfind(deliver deliver) {
			// TODO Auto-generated method stub
			try{
				
				return getSqlMap().queryForList("IbatisEx_buy.overlapfind",deliver);
			}catch(Exception e){
				System.out.println(" overlapfind() 에러::: ");
			}
			return null;
		}
		public List<deliver> selectbabgni(deliver deliver) {
			// TODO Auto-generated method stub
			try{
				
				return getSqlMap().queryForList("IbatisEx_buy.selectbabgni",deliver);
			}catch(Exception e){
				System.out.println("selectbabgni()에러: "+e);
			}
			return null;
		}
		
		public List<HashMap<String, String>> selectbabgni2(deliver deliver) {
			// TODO Auto-generated method stub
			try{
				
				return getSqlMap().queryForList("IbatisEx_buy.selectbabgni2",deliver);
			}catch(Exception e){
				System.out.println("selectbabgni()에러: "+e);
			}
			return null;
		}
		
		public List<coupon> getcoupon(coupon cp) {
			// TODO Auto-generated method stub
				try{
				
				return getSqlMap().queryForList("IbatisEx_buy.couponuse",cp);
			}catch(Exception e){
				System.out.println("getcoupon()에러: "+e);
			}
			return null;
		}
		public void changeDeliver(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			
			try{
				
				getSqlMap().insert("IbatisEx_buy.changeDeliver",map);
			}catch(Exception e){
				System.out.println("changeDeliver()에러: "+e);
			}
		}
		public void minuscoupon(coupon cp ) {
			// TODO Auto-generated method stub
			try{
				getSqlMap().insert("IbatisEx_buy.minuscoupon",cp);
			}catch(Exception e){
				System.out.println("minuscoupon()에러: "+e);
			}
		}
		public void changecount(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
try{
				
				getSqlMap().insert("IbatisEx_buy.changecount",map);
			}catch(Exception e){
				System.out.println("changecount()에러: "+e);
			}
		}
		public List<buyDto> selectMaxfsell() {
			// TODO Auto-generated method stub
	try{
				
			return getSqlMap().queryForList("IbatisEx_buy.selectMaxfsell");
			}catch(Exception e){
				System.out.println("selectMaxfsell()에러: "+e);
			}
			return null;
		}
		public List<buyDto> selectMaxesell() {
			// TODO Auto-generated method stub
		
			try{
				
				return getSqlMap().queryForList("IbatisEx_buy.selectMaxesell");
				}catch(Exception e){
					System.out.println("selectMaxfsell()에러: "+e);
				}
				return null;
		}
		public void masterfhot(HashMap<String, Object> map1) {
			// TODO Auto-generated method stub
			try{
				
				getSqlMap().insert("IbatisEx_buy.masterfhot",map1);
			}catch(Exception e){
				System.out.println("masterfhot()에러: "+e);
			}
		}
		public void masterehot(HashMap<String, Object> map2) {
			// TODO Auto-generated method stub
			try{
				
				getSqlMap().insert("IbatisEx_buy.masterehot",map2);
			}catch(Exception e){
				System.out.println("masterehot()에러: "+e);
			}
		}
		
		public void upadatebasong() {
			// TODO Auto-generated method stub
try{
				
				getSqlMap().insert("IbatisEx_buy.upadatebasong");
			}catch(Exception e){
				System.out.println("upadatebasong()에러: "+e);
			}
		}
	
		public void upadatebasong1() {
			// TODO Auto-generated method stub
			try{
				
				getSqlMap().insert("IbatisEx_buy.upadatebasong1");
			}catch(Exception e){
				System.out.println("upadatebasong()에러: "+e);
			}
		}
	
		public List<buyDto> getdeliverstat(deliver deliver) {
			// TODO Auto-generated method stub
			
			try{
					
					return getSqlMap().queryForList("IbatisEx_buy.getdeliverstat",deliver);
					}catch(Exception e){
						System.out.println("getdeliverstat()에러: "+e);
					}
					return null;
		}
		public void insertdatgle(datdto datdto) {
			// TODO Auto-generated method stub
				
			try{
				getSqlMap().insert("IbatisEx_buy.insertdatgle",datdto);
			}catch(Exception  e){
				System.out.println("insertdatgle()에러:+"+e);		
			}
			
		}
		public List<datdto> getdatgle(String name) {
			try{
				
				return getSqlMap().queryForList("IbatisEx_buy.getdatgle",name);
				}catch(Exception e){
					System.out.println(" getdatgle()에러: "+e);
				}
				return null;
		}
		public List<bean.deliver> selectnotbaguni(deliver deliver) {
			// TODO Auto-generated method stub
			try{
				
				return getSqlMap().queryForList("IbatisEx_buy.selectnotbaguni",deliver);
			}catch(Exception e){
				System.out.println("selectbabgni()에러: "+e);
			}
			return null;
		}
		public List<buyDto> getevent(String str) {
			
			try{
				return getSqlMap().queryForList("IbatisEx_buy.getevent",str);
			}catch(Exception e){
				System.out.println("getevent()에러: "+e);
			}
			return null;
		}
		public List<buyDto> gethot(String str) {
			// TODO Auto-generated method stub
				try{
				
				return getSqlMap().queryForList("IbatisEx_buy.gethot",str);
			}catch(Exception e){
				System.out.println("getevent()에러: "+e);
			}
			return null;
		}
		
		
		
		
		
		
		
}




