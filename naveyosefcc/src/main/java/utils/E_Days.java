package utils;

public enum E_Days {
    SUNDAY("א"), MONDAY("ב"), TUESDAY("ג"), WEDNESDAY("ד"), THURSDAY("ה");

    private String day;

    E_Days(String day) {
        this.day = day;
    }

    public String getDay() {
        return day;
    }
}
