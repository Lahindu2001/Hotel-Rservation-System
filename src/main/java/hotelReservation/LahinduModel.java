package hotelReservation;

public class LahinduModel {
    private String roomType;
    private double perDayPrice;
    private boolean availability;

    public LahinduModel() {}

    public LahinduModel(String roomType, double perDayPrice, boolean availability) {
        this.roomType = roomType;
        this.perDayPrice = perDayPrice;
        this.availability = availability;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public double getPerDayPrice() {
        return perDayPrice;
    }

    public void setPerDayPrice(double perDayPrice) {
        this.perDayPrice = perDayPrice;
    }

    public boolean isAvailability() {
        return availability;
    }

    public void setAvailability(boolean availability) {
        this.availability = availability;
    }
}