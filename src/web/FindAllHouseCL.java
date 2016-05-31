package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		System.out.println("findallhousecl");
		try{
			PrintWriter out = response.getWriter();
			String email = request.getParameter("email");
			String h_area = request.getParameter("h_area");
			HouseBeanCL hbc= new HouseBeanCL();
			List<HouseBean> houseList = hbc.findAllHouse(h_area);
	//		for(int i = 0; i < houseList.size(); i++){
	//		String title = houseList.get(i).gettitle();
	//		System.out.println(title);
			request.setAttribute("houseList", houseList);  
	        request.getRequestDispatcher("/ShowHouses.jsp").forward(request,response);
	//		}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
	}

}
