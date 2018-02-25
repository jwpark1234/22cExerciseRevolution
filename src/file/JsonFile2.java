package file;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class JsonFile2 {

	// 파일에 있는 문자열을 읽어와서 JSONObject로 파싱해주는 메서드
	public JSONObject readJsonFile(String url) {
		
		JSONParser parser = new JSONParser();
		
		try {
			return (JSONObject) parser.parse(new FileReader(url)); 
			
		} catch (IOException | ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	// 문자열로 만든 JSON 데이터를 파일로 저장하는 메서드
	public void writeJsonFile(String url, String datas) {
		
		try {
			FileWriter out = new FileWriter(url);
			out.write(datas);
			out.flush();
			out.close();
			System.out.println("저장");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
