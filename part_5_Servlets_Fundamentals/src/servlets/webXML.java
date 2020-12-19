package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class webXML
 */
@WebServlet("/webXML")
public class webXML extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public webXML() {super();}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. set the content type
		response.setContentType("text/html");
		
		// 2. get the printWriter object
		PrintWriter writer = response.getWriter();
		
		// 3. read the config params in web.xml
		ServletContext context = getServletContext();
		
		String cartQuantity = context.getInitParameter("shoppingCartQuantity");
		
		String team = context.getInitParameter("teamName");
		
		// 4. generating html content dynamically
		writer.println("<html><body>");
		
		writer.println("shopping cart quantity: " + cartQuantity + "<br><br>");
		
		writer.println("team name: " + team);
		
		writer.println("</body></html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
