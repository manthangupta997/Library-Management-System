import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import static org.apache.tomcat.jni.User.username;

@MultipartConfig
@WebServlet("requestBook")
public class requestBook extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
                Connection con;
                PreparedStatement ps,sear,searchBook;
                ResultSet rs,rsBook;
                RequestDispatcher dispatcher = null;
               
                
                
                String bookId = request.getParameter("bookId");
                String studentId = request.getParameter("studentId");
                String day = request.getParameter("day");
                
//                int days = Integer.parseInt(day);
//                LocalDate localDate = java.time.LocalDate.now();
//                LocalDate returnDate = localDate.plusDays(days);
//                String todayDate = String.valueOf(localDate);
                
                
                PrintWriter out = response.getWriter();
//                    out.println(bookId);
//                    out.print(studentId);
//                    out.print(day);
//                    out.print(returnDate);
                
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/LMS","root","root");
            
            searchBook = con.prepareStatement("select bookName from book where id='"+bookId+"'");
                
            rsBook = searchBook.executeQuery();
   
            dispatcher = request.getRequestDispatcher("requestBook.jsp");
            
            if(rsBook.next()){

                String bookName = rsBook.getString("bookName");
//                System.out.println(bookName);
                

                sear = con.prepareStatement("select * from users where id='"+studentId+"'");

                rs = sear.executeQuery();

                
                if(rs.next()){
                    String userName = rs.getString("username");
                    String userType = rs.getString("user_type");
//                    
//                    System.out.println(userName);
//                    System.out.println(userType);

                    ps = con
                        .prepareStatement("insert into requestbook(userid,bookid,username,usertype,bookname,issuedays)values(?,?,?,?,?,?)");

                    ps.setString(1, studentId);
                    ps.setString(2, bookId);
                    ps.setString(3, userName);
                    ps.setString(4, userType);
                    ps.setString(5, bookName);
                    ps.setString(6, day);

                    int count = ps.executeUpdate();

                    if(count > 0){
                       
                        request.setAttribute("status","success");
                    }
                }
                else{
                    request.setAttribute("status","error");
                }
            }
            dispatcher.forward(request, response);
        }
        catch(Exception e){
            System.out.println("Connection error");
        }
    }
}