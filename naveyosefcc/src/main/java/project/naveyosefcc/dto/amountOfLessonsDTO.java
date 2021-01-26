package project.naveyosefcc.dto;

public class AmountOfLessonsDTO {
    private String pupilId;
    private String amount;

    public AmountOfLessonsDTO(Object[] obj) {
        this.pupilId = (String)obj[0];
        this.amount = obj[1].toString();
    }

    public String getPupilId() {
        return pupilId;
    }

    public void setPupilId(String pupilId) {
        this.pupilId = pupilId;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }


}
