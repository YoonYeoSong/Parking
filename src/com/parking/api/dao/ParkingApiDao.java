package com.parking.api.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.parking.api.model.vo.Parking;
import com.parking.member.model.vo.Member;

public class ParkingApiDao {
	
	private Properties prop = new Properties();
	
	public ParkingApiDao() {
		String path = ParkingApiDao.class.getResource("/sql/api/api-query.properties").getPath();
		try {
		      prop.load(new FileReader(path));
		    } catch(IOException e) {
		      e.printStackTrace();
		    }
		}
	
	
	public int insertParkingList(Connection conn, List list) {
	    PreparedStatement pstmt = null;
	    int result = 0;
	    String sql = prop.getProperty("insertparking_seoul");
	    
	    for(int i =0; i< list.size(); i++) {
	   
		    try {
	
		    	 pstmt = conn.prepareStatement(sql);
		    	  
		    	  pstmt.setString(1, ((Parking)list.get(i)).getParkingCode());
		    	  pstmt.setString(2, ((Parking)list.get(i)).getAddr());
		    	  pstmt.setString(3, ((Parking)list.get(i)).getParkingName());
		    	  pstmt.setDouble(4, ((Parking)list.get(i)).getLatitude());
		    	  pstmt.setDouble(5, ((Parking)list.get(i)).getLongitude());
		    	  result = pstmt.executeUpdate();
    		} 
	    	catch(SQLException e) 
		    {
		    
		      e.printStackTrace();
		    } finally {
		      close(pstmt);
		    }
	    }
	    return result; 
	  }
	
	public List<Parking> selectAutoCommit(Connection conn, String addrName)
	{
		PreparedStatement pstmt=null;      
		ResultSet rs=null;
		List<Parking> list = new ArrayList();
		Parking p = null;
		String sql=prop.getProperty("selectListView");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+addrName+"%");
			rs=pstmt.executeQuery();
			while(rs.next()) {
				p = new Parking();
				p.setAddr(rs.getString("ps_addr"));
				p.setParkingName(rs.getString("ps_name"));
				list.add(p);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	
	
}
