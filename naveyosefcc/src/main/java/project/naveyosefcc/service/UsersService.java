package project.naveyosefcc.service;

public interface UsersService {

    void addUser(String username, String password);
    void addAuthorities(String username, String role);
    boolean isUserExists(String username);

}
