import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("addUser")
public class addUser extends HttpServlet {    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
                Connection con;
                PreparedStatement ps,check;
                Statement st;
                ResultSet rs;
                
                String uname = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String dob = request.getParameter("dob");
                String rollno = request.getParameter("rollno");
                String department = request.getParameter("department");
                String userType = request.getParameter("userType");
                RequestDispatcher dispatcher = null;
                
//                PrintWriter out = response.getWriter();
//                out.print(uname);
//                out.print(email);
//                out.print(password);
//                out.print(dob);
//                out.print(rollno);
//                out.print(department);
//                out.print(userType);


        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/LMS","root","root");
            check = con.prepareStatement("select email from users where email='"+email+"' ");
            
            rs = check.executeQuery();
            dispatcher = request.getRequestDispatcher("addUser.jsp");
            if(rs.next()){
                System.out.println("User already exist");
                request.setAttribute("status", "exist");
            }
            
            else{
                try{
                    
                    ps = con
                        .prepareStatement("insert into users(username,email,password,dob,rollno,department,user_type)values(?,?,?,?,?,?,?)");

                    ps.setString(1, uname);
                    ps.setString(2, email);
                    ps.setString(3, password);
                    ps.setString(4, dob);
                    ps.setString(5, rollno);
                    ps.setString(6, department);
                    ps.setString(7, userType);

                    int count = ps.executeUpdate();
                    dispatcher = request.getRequestDispatcher("addUser.jsp");

                    if(count > 0){
                        request.setAttribute("status", "success");
                    }
                    else{
                        request.setAttribute("status", "failed");                
                    }
                    dispatcher.forward(request, response);
                }
                catch(Exception e){
                    System.out.println("Connection error");
                }
            }
            dispatcher.forward(request, response);
        }
        catch(Exception e){
            System.out.println("Connection error one");
        }
                
        
    }
}