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
@WebServlet("returnBook")
public class returnBook extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
                Connection con;
                PreparedStatement ps,sear,update,searchBook;
                Statement st;
                ResultSet rs,rsBook;
                RequestDispatcher dispatcher = null;
               
                
                
                String bookId = request.getParameter("bookId");
                
//                String day = request.getParameter("day");
//                int days = Integer.parseInt(day);
//                LocalDate localDate = java.time.LocalDate.now();
//                LocalDate returnD = localDate.plusDays(days);
//                
//                String returnDate = String.valueOf(returnD);
//                String todayDate = String.valueOf(localDate);
                
                
                PrintWriter out = response.getWriter();
//                    System.out.println(bookId);
//                    out.print(studentId);
//                    out.print(localDate);
//                    out.print(returnDate);
                
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/LMS","root","root"); 
            
            searchBook = con.prepareStatement("select bookAva,bookName from book where id='"+bookId+"'");
                
            rsBook = searchBook.executeQuery();
   
            dispatcher = request.getRequestDispatcher("returnBook.jsp");
            
            if(rsBook.next()){

                String bookAva = rsBook.getString("bookAva");
                int noBook = Integer.parseInt(bookAva) + 1;
                String updatedAva = String.valueOf(noBook);
                String bookName = rsBook.getString("bookName");
                
                update = con.prepareStatement("update book set bookAva='"+updatedAva+"' where id='"+bookId+"'");

                int count = update.executeUpdate();
                
                if(count > 0){            
                    
                                    
                    ps = con.prepareStatement("delete from issuebook where issuebook='"+bookId+"' ");

                    ps.executeUpdate();
                    
                }

                request.setAttribute("status","success");
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
}