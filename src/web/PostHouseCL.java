package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PostHouseCL
 */
@WebServlet("/PostHouseCL")
public class PostHouseCL extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostHouseCL() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			PrintWriter out = response.getWriter();
			String email = request.getParameter("email");
			System.out.println(email);
			String title = request.getParameter("title");
			System.out.println(title);
			String h_location = request.getParameter("h_location");
			//In order keep database data consistency, reduce redundancy
			h_location = h_location.toLowerCase(); 
			System.out.println(h_location);
			String h_area = request.getParameter("h_area");
			System.out.println(h_area);
			String housetype = request.getParameter("housetype");
			System.out.println(housetype);
			String roomtype = request.getParameter("roomtype");
			System.out.println(roomtype);
			String sex = request.getParameter("gender");
			System.out.println(sex);
			String wechatid = request.getParameter("wechatid");
			System.out.println(wechatid);
			String qq = request.getParameter("qq");
			System.out.println(qq);
			String phonenumber = request.getParameter("phonenumber");
			System.out.println(phonenumber);
			String price = request.getParameter("price");
			System.out.println(price);
			String houseinfo = request.getParameter("houseinfo");
			System.out.println(houseinfo);
			HouseBeanCL hbc= new HouseBeanCL();
			
			if(email != null && h_location != null && h_area != null){
				boolean check = hbc.posthouse(email, title, h_location, h_area, housetype, roomtype, sex, wechatid, qq, phonenumber, price, houseinfo);
				System.out.print("here");
				if(check == false){
					//houseinfo already exist
					System.out.print("post fail");
					String error1 ="House information already exist!" ;
					out.println(error1);
					out.println("<br/>");
					//Thread.sleep(5000);
					response.sendRedirect("PostHouse.jsp?email="+email+"&error="+error1);
				}
				else{
					//post successed
					System.out.print("post succeed");
					String success1 = "House information post successful!";
					out.println(success1);
					out.println("<br/>");
					response.sendRedirect("StevensHousing.jsp?email="+email+"&success="+success1);
				}
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
	}

}
