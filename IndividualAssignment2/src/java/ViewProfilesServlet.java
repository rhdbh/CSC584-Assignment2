import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ViewProfilesServlet")
public class ViewProfilesServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:derby://localhost:1527/student_profiles";   
    private static final String DB_USER = "app";
    private static final String DB_PASS = "app";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<String[]> studentList = new ArrayList<>();

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

         
            String search = request.getParameter("search");

            String sql;
            PreparedStatement ps;

       
            if (search != null && !search.trim().isEmpty()) {
                sql = "SELECT * FROM PROFILES WHERE UPPER(NAME) LIKE ? OR UPPER(STUDENTID) LIKE ?";
                ps = con.prepareStatement(sql);      
                ps.setString(1, "%" + search.toUpperCase() + "%");
                ps.setString(2, "%" + search.toUpperCase() + "%");

            } 
           
            else {
                sql = "SELECT * FROM PROFILES";
                ps = con.prepareStatement(sql);
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String[] student = new String[6];

                student[0] = rs.getString("NAME");
                student[1] = rs.getString("STUDENTID");
                student[2] = rs.getString("PROGRAM");
                student[3] = rs.getString("EMAIL");
                student[4] = rs.getString("HOBBIES");
                student[5] = rs.getString("INTRO");

                studentList.add(student);
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("studentList", studentList);
        request.getRequestDispatcher("viewProfiles.jsp").forward(request, response);
    }
}