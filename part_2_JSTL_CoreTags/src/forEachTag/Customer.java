package forEachTag;

public class Customer {
	
	private String firstName, lastName;
	
	private boolean vip;

	public Customer() {}

	public Customer(String firstName, String lastName, boolean vip) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.vip = vip;
	}

	public String getFirstName() {return firstName;}

	public void setFirstName(String firstName) {this.firstName = firstName;}

	public String getLastName() {return lastName;}

	public void setLastName(String lastName) {this.lastName = lastName;}

	public boolean isVip() {return vip;}

	public void setVip(boolean vip) {this.vip = vip;}
	
	
	
}
