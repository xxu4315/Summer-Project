//get connections from database
package web;
// love xiaochen
import java.sql.*;

public class ConnDB {
	private Connection ct=null;
	public Connection getConn(){
		try{
			//upload drivers
			Class.forName("org.postgresql.Driver").newInstance();
			//get connections
			String url="jdbc:postgresql://127.0.0.1:5433/MyWeb";
	        String user="postgres";
	        String pwd="111";
			ct=DriverManager.getConnection(url,user,pwd);
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		return ct;
	}
}
