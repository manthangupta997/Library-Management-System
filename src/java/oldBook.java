import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet("oldBook")
public class oldBook extends HttpServlet {    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
                Connection con;
                PreparedStatement ps;
                Statement st;
                RequestDispatcher dispatcher = null;
                
                //getting file name and path
                
                String bookName = request.getParameter("bookName");
                String bookDetils = request.getParameter("bookDetils");
                String bookAuthor = request.getParameter("bookAuthor");
                String bookPub = request.getParameter("bookPub");
                String branch = request.getParameter("branch");
                String bookQuantity = request.getParameter("bookQuantity");
                String bookAva = request.getParameter("bookAva");
                
                
//                PrintWriter out = response.getWriter();
//                out.print(bookPic);
//                out.print(uploadPath);
//                out.print(bookName);
//                out.print(bookDetils);
//                out.print(bookAuthor);
//                out.print(bookPub);
//                out.print(branch);
//                out.print(bookPrice);
//                out.print(bookQuantity);
//                out.print(bookAva);
//                out.print(bookRent);

        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/LMS","root","root");
            ps = con
                .prepareStatement("insert into oldbooks(bookName,bookDetails,bookAuthor,bookPub,branch,bookQuantity,bookAva)values(?,?,?,?,?,?,?)");
            
            ps.setString(1, bookName);
            ps.setString(2, bookDetils);
            ps.setString(3, bookAuthor);
            ps.setString(4, bookPub);
            ps.setString(5, branch);
            ps.setString(6, bookQuantity);
            ps.setString(7, bookAva);
            
            int count = ps.executeUpdate();
           
            dispatcher = request.getRequestDispatcher("oldBook.jsp");
            
            if(count > 0){
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