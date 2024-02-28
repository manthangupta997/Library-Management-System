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

@WebServlet("studentLogin")
public class studentLogin extends HttpServlet {
    @Override
 protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                response.setContentType("text/html;charset=UTF-8");
                Connection con;
                PreparedStatement ps;
                Statement st;
                ResultSet rs;
                HttpSession session = request.getSession();
                RequestDispatcher dispatcher = null;
//              System.out.println("Hello");
                
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/LMS","root","root");
                    
                        String email = request.getParameter("email");
                        String pass = request.getParameter("password");
                        
                      
//                      System.out.println(pass);

                    ps = con.prepareStatement("select * from users where email='"+email+"' and password='"+pass+"'");
                    
                    rs = ps.executeQuery();
                    
                    dispatcher = request.getRequestDispatcher("stu_login.jsp");
                    
                    if(rs.next()){
                        session.setAttribute("name", rs.getString("id"));
                        response.sendRedirect("studentDashboard.jsp");
//                        System.out.println("Success");
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