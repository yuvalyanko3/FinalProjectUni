package project.naveyosefcc.entity;

import javax.persistence.*;
import java.sql.Time;

@Entity
@Table(name = "preferabledays")
public class PreferableDays {

    @Id
    @Column(name = "day")
    private String day;

    @JoinColumn(name = "id")
    private String id;

    @Column(name = "start_hour")
    private Time startHour;

    @Column(name = "finish_hour")
    private Time finishHour;

    public PreferableDays() {}

    public PreferableDays(String id, String day, Time startHour, Time finishHour) {
        this.id = id;
        this.day = day;
        this.startHour = startHour;
        this.finishHour = finishHour;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public Time getStartHour() {
        return startHour;
    }

    public void setStartHour(Time startHour) {
        this.startHour = startHour;
    }

    public Time getFinishHour() {
        return finishHour;
    }

    public void setFinishHour(Time finishHour) {
        this.finishHour = finishHour;
    }
}
