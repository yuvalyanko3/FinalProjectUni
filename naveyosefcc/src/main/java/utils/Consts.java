package utils;

import project.naveyosefcc.entity.Skill;
import project.naveyosefcc.entity.SkillsForPerson;

import java.util.Iterator;
import java.util.Set;

public class Consts {

    public static final String[] DAYS = {"sunday", "monday", "tuesday", "wednesday", "thursday"};

    public static final String INITIAL_POOL_SIZE = "connection.pool.initialPoolSize";
    public static final String MIN_POOL_SIZE = "connection.pool.minPoolSize";
    public static final String MAX_POOL_SIZE = "connection.pool.maxPoolSize";
    public static final String MAX_IDLE_TIME = "connection.pool.maxIdleTime";

    //helper method - capitalize word
    public static final String capitalizeWord(String input) {
        return input.toUpperCase().substring(0, 1) + input.toLowerCase().substring(1);
    }

    public static final String getEmailTemplate(String name, String password) {
        String s = "שלום " + name + ",\nסיסמתך לצורך התחברות ראשונית היא: " + password + "\nתוכל\\י לשנות את סיסמתך לאחר ההתחברות הראשונית.";
        return s;
    }

    public static final String getEmailNewPassTemplate(String name, String password) {
        String s = "שלום " + name + ",\nסיסמתך שונתה בהצלחה: " + password + "\nתוכל\\י לשנות את סיסמתך לאחר ההתחברות.";
        return s;
    }

}
