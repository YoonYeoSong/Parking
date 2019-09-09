package api.test.main;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Properties;

import org.json.JSONArray;
import org.json.JSONObject;

import com.parking.api.model.vo.Parking;

public class ParseJSON {
  public static void main(String[] args) {
    Properties prop = new Properties();
    try {
      prop.load(new FileReader("config.properties"));
    } catch(IOException e) {
      e.printStackTrace();
    }

    String serviceKey = prop.getProperty("serviceKey");
    int start_index = 1;
    int end_index = 200;
    String urlStr = "http://openapi.seoul.go.kr:8088/" + serviceKey 
        + "/json/GetParkInfo/"+start_index +"/"+end_index+"/632-1";
    
    BufferedReader br = null;
    try {
      URL url = new URL(urlStr);
      HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
      urlconnection.setRequestMethod("GET");
      br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
      
      String result = "";
      String line;
      while((line = br.readLine()) != null) {
        result += (line + "\n");
      }

      System.out.println(result);
      JSONObject obj = new JSONObject(result);
      JSONArray arr = obj.getJSONObject("GetParkInfo").getJSONArray("row");
      Parking p = null;

      System.out.println("Parsing List Num # = " + arr.length());

      for(int i =0; i<arr.length(); i++) {
        p = new Parking();

        p.setParkingCode(arr.getJSONObject(i).getString("PARKING_CODE"));
        p.setParkingName(arr.getJSONObject(i).getString("PARKING_NAME"));
        p.setAddr(arr.getJSONObject(i).getString("ADDR"));
        p.setParkingType(arr.getJSONObject(i).getString("PARKING_TYPE"));
        p.setParkingTypeNm(arr.getJSONObject(i).getString("PARKING_TYPE_NM"));
        p.setOperationRule(arr.getJSONObject(i).getInt("OPERATION_RULE"));
        p.setOperationRuleNm(arr.getJSONObject(i).getString("OPERATION_RULE_NM"));
        p.setTel(arr.getJSONObject(i).getString("TEL"));
        p.setQueStatus(arr.getJSONObject(i).getInt("QUE_STATUS"));
        p.setQueStatusNm(arr.getJSONObject(i).getString("QUE_STATUS_NM"));
        p.setCapacity(arr.getJSONObject(i).getInt("CAPACITY"));
        p.setCurParking(arr.getJSONObject(i).getInt("CUR_PARKING"));
        
        System.out.println(p);
      }
    } catch(IOException e) {
      e.printStackTrace();
    }

  }
}
