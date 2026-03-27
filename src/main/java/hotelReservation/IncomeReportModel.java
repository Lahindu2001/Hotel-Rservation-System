package hotelReservation;

public class IncomeReportModel {
    private String roomType;
    private double perDayPrice;
    private java.sql.Date checkinDate;
    private java.sql.Date checkoutDate;
    private double incomePrice;

    public IncomeReportModel(String roomType, double perDayPrice, java.sql.Date checkinDate, java.sql.Date checkoutDate, double incomePrice) {
        this.roomType = roomType;
        this.perDayPrice = perDayPrice;
        this.checkinDate = checkinDate;
        this.checkoutDate = checkoutDate;
        this.incomePrice = incomePrice;
    }

    public String getRoomType() { return roomType; }
    public double getPerDayPrice() { return perDayPrice; }
    public java.sql.Date getCheckinDate() { return checkinDate; }
    public java.sql.Date getCheckoutDate() { return checkoutDate; }
    public double getIncomePrice() { return incomePrice; }
}