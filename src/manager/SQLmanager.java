package manager;

import java.io.IOException;


import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public abstract class SQLmanager {
	private SqlMapClient sc;
	
	public SQLmanager(){
		sc=null;
		try{
			sc=SqlMapClientBuilder.buildSqlMapClient(Resources.getResourceAsReader("sqlmap/SqlMapConfig.xml"));
			System.out.println(sc.toString()+" , ");
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	public SqlMapClient getSqlMap(){
		return sc;
	}
}
