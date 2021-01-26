package project.naveyosefcc.dto;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class GradesByYearAndMonthDTO {
    private String years;
    private String months;
    private String avgs;

    public GradesByYearAndMonthDTO(Object[] obj) {
        this.years = obj[0].toString();
        this.months = obj[1].toString();
        this.avgs= obj[2].toString();
    }


    public String getYear() {
        return years;
    }

    public String getMonth() {
        return months;
    }

    public String getAvg() {
        return avgs;
    }

    public void setMonths(String months) {
        this.months = months;
        switch(months) {
            case "1":
                this.months = "January";
                break;
            case "2":
                this.months = "February";
                break;
            case "3":
                this.months = "March";
                break;
            case "4":
                this.months = "April";
                break;
            case "5":
                this.months = "May";
                break;
            case "6":
                this.months = "June";
                break;
            case "9":
                this.months = "September";
                break;
            case "10":
                this.months = "October";
                break;
            case "11":
                this.months = "November";
                break;
            case "12":
                this.months = "December";
                break;
        }
    }

    @Override
    public String toString() {
        return "Dashboard3DTO{" +
                "years=" + years +
                ", months=" + months +
                ", avgs='" + avgs + '\'' +
                '}';
    }
}
