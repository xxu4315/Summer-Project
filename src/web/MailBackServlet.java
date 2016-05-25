package web;
import java.io.IOException;  
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  

@WebServlet(name="MailBackServlet",urlPatterns="/MailBackServlet")
public class MailBackServlet extends HttpServlet {  
    private static final long serialVersionUID = 1L;  
  
    public void doGet(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
        String registerID = request.getParameter("registerId");  
        if(registerID == null){  
            request.getRequestDispatcher("/Login.jsp").forward(request,response);  
           return ;  
        }  
         
        String registerName = (String)request.getSession().getAttribute(registerID);  
         
       if(registerName == null || registerName.equals("")){  
            request.getRequestDispatcher("/Login.jsp").forward(request,response);  
            return ;  
        }  
         
        request.setAttribute("registerName", registerName);  
        request.getRequestDispatcher("/second.jsp").forward(request,response);  
    }  
  
    public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
        doGet(request, response);  
    }  
  
}  