import java.io.IOException;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;

@WebServlet("adminLogin")
public class adminLogin extends HttpServlet {
    @Override
 protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                response.setContentType("text/html;charset=UTF-8");
                Connection con;
                PreparedStatement ps;
                ResultSet rs;
                HttpSession session = request.getSession();
                RequestDispatcher dispatcher;
                
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/LMS","root","root");
                    
                        String email = request.getParameter("email");
                        String pass = request.getParameter("password");


                    ps = con.prepareStatement("select * from admin where useremail='"+email+"' and password='"+pass+"'");
                   
                    rs = ps.executeQuery();
                    
                    dispatcher = request.getRequestDispatcher("adm_login.jsp");
                    
                    if(rs.next()){
                        session.setAttribute("name", rs.getString("useremail"));
                        response.sendRedirect("adminDashboard.jsp");
                    }
                    else{                        
                        request.setAttribute("status", "failed");
                        dispatcher.forward(request, response);  
                    }
                                      
                }
                catch(Exception e){
                    out.println("Connection error");
                }
    }
}