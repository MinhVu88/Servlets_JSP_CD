package controller_servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Student;
import model.StudentData;

/**
 * Servlet implementation class Student
 */
@WebServlet("/StudentController2")
public class StudentController2 extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentController2() {super();}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. get the list of Student objects from StudentData.java & add the data to the request object
		List<Student> students = StudentData.getStudents();
		
		request.setAttribute("student_list", students);
		
		// 2. get request dispatcher to make a connection to the jsp page
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view2.jsp");
		
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
