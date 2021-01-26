package utils;

import java.util.Random;

public class PasswordGenerator {

    private static final String NUMBERS = "1234567890";
    private static final String LOWER_CASE_LETTERS = "abcdefghijklmnopqrstuvwxyz";
    private static final String UPPER_CASE_LETTERS = LOWER_CASE_LETTERS.toUpperCase();
    private static final int PASSWORD_LEN = 6;

    public static String getPassword() {
        StringBuilder sb = new StringBuilder();
        Random rand = new Random();
        for(int i = 0 ; i < PASSWORD_LEN / 3 ; i++)
        {
            sb.append(LOWER_CASE_LETTERS.charAt(rand.nextInt(LOWER_CASE_LETTERS.length())));
            sb.append(UPPER_CASE_LETTERS.charAt(rand.nextInt(UPPER_CASE_LETTERS.length())));
            sb.append(NUMBERS.charAt(rand.nextInt(NUMBERS.length())));
        }
        return sb.toString();
    }

}
