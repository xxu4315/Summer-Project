package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterCL
 */
@WebServlet("/RegisterCL")
public class RegisterCL extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterCL() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			response.setContentType("text/html;charset=gb2312");
			PrintWriter out = response.getWriter();
			UserBeanCL ubc = new UserBeanCL();
			String UserName = request.getParameter("username");
			String Email = request.getParameter("userid");
			//Email.toLowerCase();
			String PassWord = request.getParameter("password");
			if(!(UserName == null && Email == null && PassWord == null)){
				boolean check = ubc.Register(Email, UserName, PassWord);
				if(check == false){
					//request.setAttribute("error","Email-address already exist");
					//request.getRequestDispatcher("Register.jsp").forward(request, response);
					out.println("Email-address already exist");
					out.println("<br/>");
					out.println("<a href=\"http://localhost:8080/MyWeb/signup.jsp\" target=_self >Go back to Register Page</a>");
				}
				else{
					String regex="[a-zA-Z0-9_\\-\\.]+@(stevens)+(\\.(edu))" ;
					if(Email.matches(regex)){
						System.out.println("yes");
						request.setAttribute("Email", Email);
						request.getRequestDispatcher("/Success.jsp").forward(request,response); 
					}
					else{
						System.out.println("no");
						out.println("Invalid email address, you should need to use your stevens email address to register!");
						out.println("<br/>");
						out.println("<a href=\"http://localhost:8080/MyWeb/signup.jsp\" target=_self >Go back to Register Page</a>");
					}
				}
			}
			else{
				response.sendRedirect("Register.jsp");
			}
		
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
	}

}
