package project.naveyosefcc.service;

import project.naveyosefcc.entity.Person;
import project.naveyosefcc.entity.PreferableDays;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

public interface PersonService {

    boolean isPersonExists(String id);

    List<Person> getAllPersons();

    Person getPersonById(String id);

    void addPrefDay(String id, String day, Time start, Time finish);

    void deletePersonById(String id);

    void updatePerson(String id, String firstN, String lastN, Date birth, String gender, String phone, String email);

    void updatePassword(String id, String pass);

    void addSkill(String id, String name, int lvl);

    void updateMail(String id, String mail);
}
