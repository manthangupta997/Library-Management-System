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
@WebServlet("issueBook")
public class issueBook extends HttpServlet {
    
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
                String studentId = request.getParameter("studentId");
                String day = request.getParameter("day");
                
                int days = Integer.parseInt(day);
                LocalDate localDate = java.time.LocalDate.now();
                LocalDate returnD = localDate.plusDays(days);
                
                String returnDate = String.valueOf(returnD);
                String todayDate = String.valueOf(localDate);
                
                
                PrintWriter out = response.getWriter();
//                    System.out.println(bookId);
//                    out.println(studentId);
//                    out.println(localDate);
//                    out.println(returnDate);
                
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/LMS","root","root");
            
            
            
            searchBook = con.prepareStatement("select bookAva,bookName from book where id='"+bookId+"'");
                
            rsBook = searchBook.executeQuery();
   
            dispatcher = request.getRequestDispatcher("issueBook.jsp");
            
            if(rsBook.next()){

                String bookAva = rsBook.getString("bookAva");
                int noBook = Integer.parseInt(bookAva);
                String bookName = rsBook.getString("bookName");
                
                if(noBook > 0){
//                    System.out.println(noBook);
                    sear = con.prepareStatement("select * from users where id='"+studentId+"'");

                    rs = sear.executeQuery();
                    
                    dispatcher = request.getRequestDispatcher("issueBook.jsp");
                    
                    if(rs.next()){
                        String userName = rs.getString("username");
                        String userType = rs.getString("user_type");
                        String fine = "0";

//                        System.out.println("userName");
//                        System.out.println("bookId");
//                        System.out.println("userType");
//                        System.out.println("day");
//                        System.out.println("todayDate");
//                        System.out.println("studentId");
//                        System.out.println("fine");
//                        System.out.println("returnDate");
                        
                        ps = con
                            .prepareStatement("insert into issuebook(issuename,issuebook,issueType,issueDays,issueDate,Userid,fine,returnDate)values(?,?,?,?,?,?,?,?)");

                        ps.setString(1, userName);
                        ps.setString(2, bookId);
                        ps.setString(3, userType);
                        ps.setString(4, day);
                        ps.setString(5, todayDate);
                        ps.setString(6, studentId);
                        ps.setString(7, fine);
                        ps.setString(8, returnDate);

                        int count = ps.executeUpdate();

                        if(count > 0){
//                            System.out.println(noBook);
                            int bookAval = Integer.parseInt(bookAva) - 1;

                            String updatedAva = String.valueOf(bookAval);

                            update = con.prepareStatement("update book set bookAva='"+updatedAva+"' where id='"+bookId+"'");

                            update.executeUpdate();

                            request.setAttribute("status","success");
                        }
                    }
                }
                else{
                    request.setAttribute("status","error");
                }

            }
            else{
                request.setAttribute("status", "failed");
            }
            dispatcher.forward(request, response);
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
}