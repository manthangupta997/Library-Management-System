import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("approveRequest")
public class approveRequest extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        Connection con;
        PreparedStatement ps,psD,psU,psS;
        Statement st;
        ResultSet rs,rsU;
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;
        
            String id = request.getParameter("id");
            String username = request.getParameter("username");
            String usertype = request.getParameter("usertype");
            String bookname = request.getParameter("bookname");
            String bookId = request.getParameter("bookid");
            String userid = request.getParameter("userid");
            String day = request.getParameter("day");
            int days = Integer.parseInt(day);
            LocalDate localDate = java.time.LocalDate.now();
            LocalDate returnDate = localDate.plusDays(days);
            String returnD = String.valueOf(returnDate);
            String todayDate = String.valueOf(localDate);
            String fine = "0";

        try {
                Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/LMS","root","root");
            
//                      System.out.println(email);
//                      System.out.println(pass);

                ps = con.prepareStatement("insert into issuebook(issuename,issuebook,issuetype,issuedays,issuedate,Userid,fine,returnDate)values(?,?,?,?,?,?,?,?)");

                ps.setString(1, username);
                ps.setString(2, bookId);
                ps.setString(3, usertype);
                ps.setString(4, day);
                ps.setString(5, todayDate);
                ps.setString(6, userid);
                ps.setString(7, fine);
                ps.setString(8, returnD);
                
                int count = ps.executeUpdate();
            
                dispatcher = request.getRequestDispatcher("approveRequest.jsp");

            if(count > 0){
                System.out.println(bookId);
                psS = con.prepareStatement("select bookAva from book where id='"+bookId+"'");
                rsU = psS.executeQuery();
                
                if(rsU.next()){
                    String Ava = rsU.getString("bookAva");

                    System.out.println(Ava);
                    int Avab = Integer.parseInt(Ava) - 1;
                    System.out.println(Avab);
                    String updatedAva = String.valueOf(Avab);
                    System.out.println(updatedAva);

                    psU = con.prepareStatement("update book set bookAva='"+updatedAva+"' where id='"+bookId+"'");
                    psU.executeUpdate();
                    
                }
                
                psD = con.prepareStatement("delete from requestbook where id='"+id+"' ");
                psD.executeUpdate();
                request.setAttribute("status","success");
            }
            else{                        
                request.setAttribute("status", "failed");
            }
            dispatcher.forward(request, response);                    
        }
        catch(Exception e){
            System.out.println("Connection error admin login");
        }
        
    }
    
}
