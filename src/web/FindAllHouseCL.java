package web;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class PostHouseCL
 */
@WebServlet("/FindAllHouseCL")
public class FindAllHouseCL extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindAllHouseCL() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			//response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			String email = request.getParameter("email");
			String h_area = request.getParameter("h_area");
			String housetype = request.getParameter("housetype");
			String roomtype = request.getParameter("roomtype");
			String sex = request.getParameter("sex");
			HouseBeanCL hbc= new HouseBeanCL();
			List<HouseBean> houseList = hbc.findAllHouse(h_area, housetype, roomtype, sex);
			request.setAttribute("houseList", houseList); 
			HttpSession session = request.getSession();
			session.setAttribute("houseList", houseList);
			for(HouseBean hb : houseList){
			out.println(hb.gettitle()+"<br/>");
            out.flush();
			out.println(hb.gethouseinfo()+"<br/>");
			out.print(hb.geth_location()+"\r\n");
			out.write(hb.geth_area()+"\r\n");
			out.write(hb.geth_area()+"<br>");
			out.println(hb.geth_area()+"<br>");
			out.println(hb.gethousetype()+"<br>");
			out.println(hb.getroomtype());
			out.println(hb.getsex());
			out.println(hb.getid());
			out.println(hb.getphonenumber());
			out.println(hb.getprice());
			out.println(hb.getqq());
			out.println(hb.getwechatid());
			
			}
			JSONArray jsonArray = JSONArray.fromObject(houseList);
			System.out.println(jsonArray);
			String json1 = new Gson().toJson(houseList);
			response.setContentType("application/json");
			response.getWriter().write(jsonArray.toString());
			//request.setAttribute("jsonArray", jsonArray);
			//System.out.println(json1);
		//	request.getRequestDispatcher("/addFindWish.jsp").forward(request,response);
			
			
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
	}

}
