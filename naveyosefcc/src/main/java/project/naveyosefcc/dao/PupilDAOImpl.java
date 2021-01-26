package project.naveyosefcc.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import project.naveyosefcc.entity.Pupil;


import java.util.Date;
import java.util.List;
import java.util.Map;

@Repository
public abstract class PupilDAOImpl implements PupilDAO {

    private PupilDAO pupilDAO;

    public List<Pupil> getAllPupils() {return pupilDAO.findAll();}

    public Map<String, Map<Date,String>> pupilGradesChart(String id) {return pupilDAO.pupilGradesChart(id); }

    public List<Object[]> getPupilSchedule(String id) { return pupilDAO.getPupilSchedule(id); }

    @Autowired
    public void setPupilDAO(PupilDAO pupilDAO) {
        this.pupilDAO = pupilDAO;
    }
}
