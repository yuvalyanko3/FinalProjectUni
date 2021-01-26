package utils;

public enum E_Programs {

    FLOWER("פר\"ח"), SAHAK("שח\"ק");

    private String name;

    E_Programs(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
