package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Welcome
 */
@WebServlet("/Welcome")
public class Welcome extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Welcome() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession hs = request.getSession(true);
		String u=(String)request.getParameter("uname");
		UserBean val = (UserBean)hs.getAttribute(u);
		if(val==null){//illegal user
			response.sendRedirect("Login.jsp");
			return;
		}
		PrintWriter out = response.getWriter();
		UserBeanCL ubc = new UserBeanCL();
		//UserBean currU = new UserBean();
		//currU = ubc.GetUser(u);
		out.println("Welcome, "+val.getName());
		out.println("<br/>");
		out.println("<br/>");
		out.println("<br/>");
		//Go to StevensHousing page
		out.println("<a href=\"http://localhost:8080/MyWeb/StevensHousing.jsp\" target=_self >StevensHousing</a><br/>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
