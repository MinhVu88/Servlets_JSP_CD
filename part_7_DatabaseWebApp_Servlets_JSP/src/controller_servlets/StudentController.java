package controller_servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import model.Student;
import model.StudentDB;

/**
 * Servlet implementation class StudentController
 */
@WebServlet("/StudentController")
public class StudentController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	@Resource(name="jdbc/hb_student_tracker")
	private DataSource dataSource;
	
	
	private StudentDB stuDB;
	
	/*
	 * init() is inherited from GenericServlet.class
	 * 
	 * it's called by the java EE server or Tomcat when StudentController.java is 1st loaded or initialized
	 * 
	 * it's overridden here so we can implement our own custom initialization work
	 * 
	 * this's similar in nature to implementing initialization work inside of a regular java class's constructor
	 * */
	@Override
	public void init() throws ServletException {
		
		super.init();
		
		try {
			
			stuDB = new StudentDB(dataSource);
		
		} catch (Exception e) {throw new ServletException(e);}
	}
	
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			
			PrintWriter writer = response.getWriter();
			
			String cmd = request.getParameter("command");
			
			if(cmd == null) {
				cmd = "LIST";
			}
			
			switch (cmd) {
				case "LIST":
					listStudents(request, response);
				break;
				
				case "ADD":
					addStudent(request, response);
				break;
				
				case "LOAD":
					loadStudent(request, response);
				break;
				
				case "UPDATE":
					updateStudent(request, response);
				break;
				
				case "DELETE":
					deleteStudent(request, response);
				break;
				
				default:
					writer.println("STUDENT NOT FOUND");
				break;
			}
		
		} catch (IOException e) {e.printStackTrace();}
	}

	private void deleteStudent(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			
			// read the student info from the form in StudentView.jsp
			String id = request.getParameter("stuId");
			
			// delete student from the db
			stuDB.deleteStu(id);
			
			// list the updated student list
			listStudents(request, response);
			
		} catch (Exception e) {e.printStackTrace();}
	}


	private void updateStudent(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			
			// read the student info from the form in updateStudent.jsp
			int id = Integer.parseInt(request.getParameter("id"));
			
			String firstName = request.getParameter("firstName");
			
			String lastName = request.getParameter("lastName");
			
			String email = request.getParameter("email");
			
			// create a new Student object & update the student db
			Student stu = new Student(id, firstName, lastName, email);
			
			stuDB.updateStu(stu);
			
			// list the updated student list
			listStudents(request, response);
		
		} catch (Exception e) {e.printStackTrace();}
	}


	private void loadStudent(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			
			// get the student id from reading the form data in StudentView.jsp
			String studentId = request.getParameter("stuId");
			
			// get student info from database
			Student student = stuDB.getStu(studentId);
			
			// place student in the request's setAttribute()
			request.setAttribute("stu", student);
			
			// forward the request to updateStudent.jsp
			RequestDispatcher dispatcher = request.getRequestDispatcher("/updateStudent.jsp");
			
			dispatcher.forward(request, response);
		
		} catch (SQLException | ServletException | IOException e) {e.printStackTrace();}
	}


	private void addStudent(HttpServletRequest request, HttpServletResponse response) {
		
		String firstName = request.getParameter("firstName");
		
		String lastName = request.getParameter("lastName");
		
		String email = request.getParameter("email");
		
		Student stu = new Student(firstName, lastName, email);
		
		// add the new student to the db
		stuDB.addStu(stu);
		
		// list the updated student list
		listStudents(request, response);
	}


	private void listStudents(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			
			// 1. get a list of Student objects from StudentDB.java's getStudents()
			//StudentDB stuDB = new StudentDB(dataSource);
			
			List<Student> students = stuDB.getStudents();
						
			// 2. add students to the request object using its setAttribute()
			request.setAttribute("stu_list", students);
						
			// 3. forward the request to the jsp page using the RequestDispatcher object
			RequestDispatcher dispatcher = request.getRequestDispatcher("/StudentView.jsp");
			
			dispatcher.forward(request, response);
			
		} catch (SQLException | ServletException | IOException e) {e.printStackTrace();}
	}

}
