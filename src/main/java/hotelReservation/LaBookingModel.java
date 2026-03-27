package hotelReservation;

import java.sql.Date;

public class LaBookingModel {

	private int user_id;
	private Date checkin;
	private Date checkout;
	private int adults;
	private int children;
	private String roomtype;
	
	public LaBookingModel() {}
	
	
	public int getUser_id() {
		return user_id;
	}




	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}




	public Date getCheckin() {
		return checkin;
	}




	public void setCheckin(Date checkin) {
		this.checkin = checkin;
	}




	public Date getCheckout() {
		return checkout;
	}




	public void setCheckout(Date checkout) {
		this.checkout = checkout;
	}




	public int getAdults() {
		return adults;
	}




	public void setAdults(int adults) {
		this.adults = adults;
	}




	public int getChildren() {
		return children;
	}




	public void setChildren(int children) {
		this.children = children;
	}




	public String getRoomtype() {
		return roomtype;
	}




	public void setRoomtype(String roomtype) {
		this.roomtype = roomtype;
	}




	public LaBookingModel(int user_id, Date checkin, Date checkout, int adults, int children, String roomtype) {
		super();
		this.user_id = user_id;
		this.checkin = checkin;
		this.checkout = checkout;
		this.adults = adults;
		this.children = children;
		this.roomtype = roomtype;
	}

	
	
	
}
