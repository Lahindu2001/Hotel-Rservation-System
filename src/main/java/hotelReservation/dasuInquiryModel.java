package hotelReservation;

import java.sql.Date;

public class dasuInquiryModel {
	private int user_id;
	private String fullName;
	private String email;
	private String phone;
	private Date date;
	private String serviceType;
	private String message;
	
	
	
	public dasuInquiryModel(int user_id,String fullName, String email, String phone, Date date, String serviceType,
			String message) {
		super();
		this.user_id = user_id;
		this.fullName = fullName;
		this.email = email;
		this.phone = phone;
		this.date = date;
		this.serviceType = serviceType;
		this.message = message;
	}
	
	
	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getServiceType() {
		return serviceType;
	}
	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	
}




