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
@WebServlet("addBook")
public class addBook extends HttpServlet {    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
                Connection con;
                PreparedStatement ps;
                Statement st;
                RequestDispatcher dispatcher = null;
                
                //getting file name and path
                Part file = request.getPart("bookPic");
                String bookPic = file.getSubmittedFileName();
                String uploadPath = "C:/Users/91705/OneDrive/Documents/NetBeansProjects/Library/web/assets/image/"+bookPic;
                
                String bookName = request.getParameter("bookName");
                String bookDetils = request.getParameter("bookDetils");
                String bookAuthor = request.getParameter("bookAuthor");
                String bookPub = request.getParameter("bookPub");
                String branch = request.getParameter("branch");
                String bookPrice = request.getParameter("bookPrice");
                String bookQuantity = request.getParameter("bookQuantity");
                String bookAva = request.getParameter("bookAva");
                String bookRent = request.getParameter("bookRent");
                
                
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
            FileOutputStream fos = new FileOutputStream(uploadPath);
                InputStream is = file.getInputStream();
                
                byte[] data=new byte[is.available()];
                is.read(data);
                fos.write(data);
                fos.close();
        }
        catch(Exception e){
            System.out.println("File doesn't uploaded");
        }
                
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/LMS","root","root");
            ps = con
                .prepareStatement("insert into book(bookPic,bookName,bookDetails,bookAuthor,bookPub,branch,bookPrice,bookQuantity,bookAva,bookRent)values(?,?,?,?,?,?,?,?,?,?)");
            
            ps.setString(1, bookPic);
            ps.setString(2, bookName);
            ps.setString(3, bookDetils);
            ps.setString(4, bookAuthor);
            ps.setString(5, bookPub);
            ps.setString(6, branch);
            ps.setString(7, bookPrice);
            ps.setString(8, bookQuantity);
            ps.setString(9, bookAva);
            ps.setString(10, bookRent);
            
            int count = ps.executeUpdate();
           
            dispatcher = request.getRequestDispatcher("addBook.jsp");
            
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