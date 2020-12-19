package model;

import java.util.ArrayList;
import java.util.List;

public class StudentData {

	/**
	 * 
	 * @return a list of Student instances
	 */
	public static List<Student> getStudents() {
		
		List<Student> students = new ArrayList<>();
		
		students.add(new Student("maynard", "keenan", "mjk@rockgod.com"));
		
		students.add(new Student("adam", "jones", "adam@rockgod.com"));
		
		students.add(new Student("justin", "chancellor", "justin@rockgod.com"));
		
		students.add(new Student("danny", "carey", "carey@rockgod.com"));
		
		return students;
		
	}
	
	
}
