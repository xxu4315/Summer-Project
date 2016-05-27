package web;
import java.io.IOException;  
import java.util.Date;  
import java.util.Properties;  
  
import javax.mail.Address;  
import javax.mail.Authenticator;  
import javax.mail.Message.RecipientType;  
import javax.mail.MessagingException;  
import javax.mail.Transport;  
import javax.mail.internet.InternetAddress;  
import javax.mail.internet.MimeMessage;  
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;  

@WebServlet(name="RegisterServlet",urlPatterns="/RegisterServlet")
public class RegisterServlet extends HttpServlet {  
private static final long serialVersionUID = 1L;  
public RegisterServlet() {
    super();
    // TODO Auto-generated constructor stub
}
public void doGet(HttpServletRequest request, HttpServletResponse response)  
           throws ServletException, IOException {  
    System.out.print("yeah");
        String toMail = request.getParameter("email");  
        String registerName = request.getParameter("userName");  
    
       String userName = "lujunye09221990@163.com";  
        String password = "zxcvbmn1";  
         
       String registerId = "" + Math.random() * Math.random();  
        String url = "http://localhost:8080/MyWeb/MailBackServlet?registerId=" + registerId;  
         
        HttpSession httpSession = request.getSession();  
        httpSession.setAttribute(registerId, registerName);  
        httpSession.setMaxInactiveInterval(600);  
         
        Properties props = new Properties();  
        props.setProperty("mail.smtp.host", "smtp.163.com");  
        props.setProperty("mail.smtp.auth", "true");  
         
        Authenticator authenticator = new MyAuthenticator(userName, password);  
        
        javax.mail.Session session = javax.mail.Session.getDefaultInstance(props,authenticator);  
        session.setDebug(true);
        
        try{  
            Address from = new InternetAddress(userName);  
           Address to = new InternetAddress(toMail);  
            
            MimeMessage msg = new MimeMessage(session);  
            msg.setFrom(from);  
            msg.setSubject("Stevens Housing Register");  
            msg.setSentDate(new Date());  
            msg.setContent("<a href='" + url + "'>Please click me to finish activating and login! </a>", "text/html;charset=utf-8");  
            msg.setRecipient(RecipientType.TO, to);  
            /*
60.            Transport transport = session.getTransport("smtp");
61.            transport.connect("smtp.163.com", userName, password);
62.            transport.sendMessage(msg,msg.getAllRecipients());
63.            transport.close();
64.            */  
            Transport.send(msg);  
        } catch(MessagingException e){  
            e.printStackTrace();  
        }  
         
//        request.getRequestDispatcher("/second.jsp").forward(request, response);  
   }  
  
    public void doPost(HttpServletRequest request, HttpServletResponse response)  
           throws ServletException, IOException {  
       doGet(request, response);  
    }  
}  