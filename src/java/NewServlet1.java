import java.io.IOException;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("NewServlet1")
public class NewServlet1 extends HttpServlet {
    @Override
 protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                response.setContentType("text/html;charset=UTF-8");
                Connection con;
                PreparedStatement ps;
                Statement st;
                ResultSet rs;
//              System.out.println("Hello");
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/LMS","root","root");
                        String email = request.getParameter("email");
                        String pass = request.getParameter("password");
                        
//                      System.out.println(email);
//                      System.out.println(pass);

                    ps = con.prepareStatement("select * from admin where useremail='"+email+"' and password='"+pass+"'");
                   
                    rs = ps.executeQuery();
                    
                    if(rs.next()){
                        response.sendRedirect("dashboard.html");
//                        System.out.println("Success");
                    }
                    else{
                        System.out.println("login fail");
                    }
                }
                catch(Exception e){
                    System.out.println("Connection error");
                }
    }
}