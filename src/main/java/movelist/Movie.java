package movelist;

public class Movie {

    private String title;
    private String type;
    private int year;
    private double profit;

    public Movie(String title, String type, int year, double profit) {
        this.title = title;
        this.type = type;
        this.year = year;
        this.profit = profit;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public double getProfit() {
        return profit;
    }

    public void setProfit(double profit) {
        this.profit = profit;
    }
}
