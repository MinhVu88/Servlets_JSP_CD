package jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("/TestDbConecction")
public class TestDbConecction extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	// define data source/connection pooling for Resource Injection
	@Resource(name="jdbc/hb_student_tracker")
	private DataSource dataSource;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try (
				Connection conn = dataSource.getConnection();
				
				Statement stmt = conn.createStatement();
				
				ResultSet rs = stmt.executeQuery("select * from student");
				
				) {
			
			// 1. setting up the content type & PrintWriter object
			response.setContentType("text/plain");
			
			PrintWriter writer = response.getWriter();
			
			// 2. process the result set
			while (rs.next()) {
				
				for(int col = 1; col <= 4; col++) {
					writer.print(" " + rs.getObject(col) + " ");
				}
				
				writer.println("\n");
			}
			
		} catch (SQLException e) {e.printStackTrace();}
		
	}

}
