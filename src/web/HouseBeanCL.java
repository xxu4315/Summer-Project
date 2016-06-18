package web;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HouseBeanCL {
	private Connection ct=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	private DatabaseMetaData dmd = null; 
	
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
	public boolean posthouse(String email, String title, String h_location, String h_area, String housetype, String roomtype, String sex, String wechatid, String qq, String phonenumber, String price, String houseinfo, String uimgpath){
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
				ps = ct.prepareStatement("insert into houseinfo values("+"'"+email+"', "+"'"+title+"', "+"'"+h_location+"', "+"'"+h_area+"', "+"'"+housetype+"', "+"'"+roomtype+"', "+"'"+sex+"', "+"'"+wechatid+"', "+"'"+qq+"', "+"'"+phonenumber+"', "+"'"+price+"', "+"'"+houseinfo+"',"+" '1', '"+uimgpath+"'"+")");
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
	
	//get from database
		public List<HouseBean> findAllHouse(String h_area, String housetype, String roomtype, String sex){
			boolean flag = false;
			int x;
			HouseBean obj = null;
			List<HouseBean> houseList = new ArrayList<HouseBean>();
			try{
				ConnDB cd = new ConnDB();
				ct = cd.getConn();
				//and (housetype="+housetype+") and (sex="+sex+") and (roomtype="+roomtype+")
				ps = ct.prepareStatement("select * from houseinfo where (h_area="+h_area+") and (housetype="+housetype+") and (sex="+sex+") and (roomtype="+roomtype+")");
				System.out.println(ps);
				rs = ps.executeQuery();
				while(rs.next()){
					//show houses
					obj = new HouseBean();
					obj.setid(rs.getString("id"));
					obj.settitle(rs.getString("title"));
					obj.sethouseinfo(rs.getString("houseinfo"));
					obj.sethousetype(rs.getString("housetype"));
					obj.setphonenumber(rs.getString("phonenumber"));
					obj.setprice(rs.getString("price"));
					obj.setqq(rs.getString("qq"));
					obj.setroomtype(rs.getString("roomtype"));
					obj.setsex(rs.getString("sex"));
					obj.setwechatid(rs.getString("wechatid"));
					obj.seth_location(rs.getString("h_location"));
					obj.seth_area(rs.getString("h_area"));					
					houseList.add(obj);
				}
			
			}
			catch(Exception ex){
				ex.printStackTrace();
			}
			finally{
				this.close();
			}
			return houseList;
		}
}
