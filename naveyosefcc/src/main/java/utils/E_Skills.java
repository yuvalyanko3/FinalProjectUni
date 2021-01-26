package utils;

public enum E_Skills {

    ENGLISH("אנגלית"), MATHEMATICS("מתמטיקה"), HEBREW("שפה");

    private String name;

    E_Skills(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
