package project.naveyosefcc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.naveyosefcc.dao.AuthoritiesDAO;
import project.naveyosefcc.dao.UsersDAO;

@Service
public class UsersServiceImpl implements UsersService {

    private UsersDAO usersDAO;
    private AuthoritiesDAO authoritiesDAO;

    @Override
    public void addUser(String username, String password) {
        usersDAO.addUser(username, password);
    }

    @Override
    public void addAuthorities(String username, String role) {
        authoritiesDAO.addAuthorities(username, role);
    }

    @Override
    public boolean isUserExists(String username) {
        return usersDAO.existsById(username);
    }

    @Autowired
    public void setUsersDAO(UsersDAO usersDAO) {
        this.usersDAO = usersDAO;
    }

    @Autowired
    public void setAuthoritiesDAO(AuthoritiesDAO authoritiesDAO) {
        this.authoritiesDAO = authoritiesDAO;
    }
}
