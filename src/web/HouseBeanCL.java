package web;

import java.sql.*;

public class HouseBeanCL {
	private Connection ct=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	
	//close
	public void close(){
		try{
			if(rs!=null){
				rs.close();
				rs=null;
			}
			if(ps!=null){
				ps.close();
				ps=null;
			}
			if(ct!=null){
				ct.close();
				ct=null;
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	
	//store in database
	public boolean posthouse(String email, String title, String h_location, String h_area, String housetype, String roomtype, String sex, String wechatid, String qq, String phonenumber, String price, String houseinfo){
		boolean flag = false;
		int x;
		try{
			ConnDB cd = new ConnDB();
			ct = cd.getConn();
			ps = ct.prepareStatement("select id from houseinfo where id="+"'"+email+"' and h_location='"+h_location+"' and h_area='"+h_area+"'");
			//System.out.println(ps);
			rs = ps.executeQuery();
			if(rs.next()){
				//username already exist!
				//request.setAttribute("error","Email-address already exist");
				//PostHouseCL will deal with that
			}
			else{
				ps = ct.prepareStatement("insert into houseinfo values("+"'"+email+"', "+"'"+title+"', "+"'"+h_location+"', "+"'"+h_area+"', "+"'"+housetype+"', "+"'"+roomtype+"', "+"'"+sex+"', "+"'"+wechatid+"', "+"'"+qq+"', "+"'"+phonenumber+"', "+"'"+price+"', "+"'"+houseinfo+"',"+" '1'"+")");
				System.out.println(ps);
				x = ps.executeUpdate();
				flag = true;
			}
		
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			this.close();
		}
		return flag;
	}
}
