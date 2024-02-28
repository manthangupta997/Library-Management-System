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

@WebServlet("deleteBook")
public class deleteBook extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Connection con;
        PreparedStatement ps;
        Statement st;
        ResultSet rs;
        RequestDispatcher dispatcher = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/LMS","root","root");
                String id = request.getParameter("delete_id");

//                      System.out.println(id);
//                      System.out.println(pass);

            ps = con.prepareStatement("delete from book where id='"+id+"' ");

            int count = ps.executeUpdate();
            dispatcher = request.getRequestDispatcher("bookReport.jsp");

            if(count > 0){
                request.setAttribute("status","success");
            }
            else{
//                System.out.println("login fail");
                request.setAttribute("status", "failed");
            }
            dispatcher.forward(request, response);
        }
        catch(Exception e){
            System.out.println("Connection error");
        }
        
    }

}
