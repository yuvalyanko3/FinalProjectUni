package project.naveyosefcc.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import project.naveyosefcc.entity.PreferableDays;

import java.util.List;

@Repository
public abstract class PreferableDaysImpl implements PreferableDaysDAO {

    private PreferableDaysDAO preferableDaysDAO;

    @Override
    public List<PreferableDays> findById(String id) {
        return preferableDaysDAO.findById(id);
    }

    @Autowired
    public void setPreferableDaysDAO(PreferableDaysDAO preferableDaysDAO) {
        this.preferableDaysDAO = preferableDaysDAO;
    }
}
