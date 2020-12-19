package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class StudentDB {

	private DataSource dataSource;
	
	public StudentDB() {}

	public StudentDB(DataSource dataSource) {this.dataSource = dataSource;}

	public DataSource getDataSource() {return dataSource;}

	public void setDataSource(DataSource dataSource) {this.dataSource = dataSource;}
		
	public List<Student> getStudents() throws SQLException {
		
		List<Student> students = new ArrayList<>();
		
		ResultSet rs = null;
		
		try (
				Connection conn = dataSource.getConnection();
				
				Statement stmt = conn.createStatement();
				
				) {
			
			rs = stmt.executeQuery("select * from student");
			
			while (rs.next()) {
				
				int id = rs.getObject("id", Integer.class);
				
				String firstName = rs.getObject("first_name", String.class);
				
				String lastName = rs.getObject("last_name", String.class);
				
				String email = rs.getObject("email", String.class);
				
				students.add(new Student(id, firstName, lastName, email));
			}
			
			return students;
		
		} finally {close(rs);}
		
	}
	
	public void addStu(Student stu) {
		
		try (
				Connection conn = dataSource.getConnection();
				
				PreparedStatement stmt = conn.prepareStatement("insert into student (first_name, last_name, email) values (?, ?, ?)");
				
				) {
			
			stmt.setObject(1, stu.getFirstName());
			
			stmt.setObject(2, stu.getLastName());
			
			stmt.setObject(3, stu.getEmail());
			
			stmt.execute();
			
		} catch (SQLException e) {System.out.println("\n" + e.getMessage());}
	}
	
	public Student getStu(String studentId) throws SQLException {
		
		Student stu = null;
		
		ResultSet rs = null;
		
		try (
				Connection conn = dataSource.getConnection();
				
				PreparedStatement stmt = conn.prepareStatement("select * from student where id=?");
				
				) {
			
			int stuId = Integer.parseInt(studentId);
			
			stmt.setObject(1, stuId);
			
			rs = stmt.executeQuery();
			
			if (rs.next()) {
				
				String firstName = rs.getObject("first_name", String.class);
				
				String lastName = rs.getObject("last_name", String.class);
				
				String email = rs.getObject("email", String.class);
				
				stu = new Student(stuId, firstName, lastName, email);
			
			} else {throw new SQLException("Student Id not found: " + stuId);}
			
			return stu;
		
		} finally {close(rs);}
		
	}
	
	public void updateStu(Student stu) {
		
		try (
				Connection conn = dataSource.getConnection();
				
				PreparedStatement stmt = conn.prepareStatement("update student set first_name=?, last_name=?, email=? where id=?");
				
				) {
			
			stmt.setObject(1, stu.getFirstName());
			
			stmt.setObject(2, stu.getLastName());
			
			stmt.setObject(3, stu.getEmail());
			
			stmt.setObject(4, stu.getId());
			
			stmt.execute();
			
		} catch (SQLException e) {System.out.println("\n" + e.getMessage());}
	}
	
	public void deleteStu(String id) {
		
		try (
				Connection conn = dataSource.getConnection();
				
				PreparedStatement stmt = conn.prepareStatement("delete from student where id=?");
				
				) {
			
			int stuId = Integer.parseInt(id);
			
			stmt.setObject(1, stuId);
			
			stmt.execute();
			
		} catch (SQLException e) {System.out.println("\n" + e.getMessage());}
	}
	
	private void close(ResultSet rs)  {
		
		try {
			
			if (rs != null) rs.close();
			
		} catch (SQLException e) {System.out.println("\n" + e.getMessage());}
	}


}
