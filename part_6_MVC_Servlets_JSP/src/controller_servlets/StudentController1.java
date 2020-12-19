package controller_servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Student
 */
@WebServlet("/StudentController1")
public class StudentController1 extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentController1() {super();}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. add data to the request object by calling the object's setAttribute() method & passing in appropriate arguments
		String[] students = {"maynard keenan", "adam jones", "justin chancellor", "danny carey"};
		
		request.setAttribute("stu_list", students);
		
		// 2. get request dispatcher to make a connection to the jsp page
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view1.jsp");
		
		// 3. forward the request & response objects to the jsp page (vital)
		dispatcher.forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
