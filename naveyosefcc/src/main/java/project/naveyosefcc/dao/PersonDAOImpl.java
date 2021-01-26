package project.naveyosefcc.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import project.naveyosefcc.entity.Person;
import project.naveyosefcc.entity.PreferableDays;

import java.util.List;

@Repository
public abstract class PersonDAOImpl implements PersonDAO {

    private PersonDAO personDAO;
    private SkillDAO skillDAO;

    public List<Person> getAllPersons(){
        return personDAO.findAll();
    }

    @Override
    public void deletePersonById(String id) {
        personDAO.deletePersonById(id);
    }

    @Override
    public Person getPersonById(String id){
        return personDAO.getPersonById(id);
    }

    @Autowired
    public void setPersonDAO(PersonDAO personDAO) {
        this.personDAO = personDAO;
    }

    @Autowired
    public void setSkillDAO(SkillDAO skillDAO) {
        this.skillDAO = skillDAO;
    }
}
