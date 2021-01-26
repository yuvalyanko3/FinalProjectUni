package project.naveyosefcc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.naveyosefcc.dao.PersonDAO;
import project.naveyosefcc.dao.PreferableDaysDAO;
import project.naveyosefcc.entity.Person;
import project.naveyosefcc.entity.PreferableDays;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

@Service
public class PersonServiceImpl implements PersonService {

    private PersonDAO personDAO;
    private PreferableDaysDAO preferableDaysDAO;

    @Override
    public boolean isPersonExists(String id) {
        return personDAO.existsById(id);
    }

    @Override
    public List<Person> getAllPersons() {
        return personDAO.findAll();
    }

    @Override
    public Person getPersonById(String id) {
        return personDAO.getPersonById(id);
    }

    @Override
    public void addPrefDay(String id, String day, Time start, Time finish) {
        personDAO.addPrefDay(id, day, start, finish);
    }

    @Override
    public void deletePersonById(String id) {
        personDAO.deletePersonById(id);
    }

    @Override
    public void updatePerson(String id, String firstN, String lastN, Date birth, String gender, String phone, String email) {
        personDAO.updatePerson(id, firstN, lastN, birth, gender, phone, email);
    }

    @Override
    public void updatePassword(String id, String pass) {
        personDAO.updatePassword(id, pass);
    }

    @Override
    public void addSkill(String id, String name, int lvl) {
        personDAO.addSkill(id, name, lvl);
    }

    @Override
    public void updateMail(String id, String mail) {
        personDAO.updateMail(id, mail);
    }

    @Autowired
    public void setPersonDAO(PersonDAO personDAO) {
        this.personDAO = personDAO;
    }

    @Autowired
    public void setPreferableDaysDAO(PreferableDaysDAO preferableDaysDAO) {
        this.preferableDaysDAO = preferableDaysDAO;
    }
}
