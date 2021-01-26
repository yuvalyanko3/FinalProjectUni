package project.naveyosefcc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.naveyosefcc.dao.PreferableDaysDAO;
import project.naveyosefcc.dao.PupilDAO;
import project.naveyosefcc.dto.TeacherStudentsDTO;
import project.naveyosefcc.entity.PreferableDays;
import project.naveyosefcc.entity.Pupil;
import project.naveyosefcc.entity.Teacher;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class PupilServiceImpl implements PupilService {

    private PupilDAO pupilDAO;
    private PreferableDaysDAO preferableDaysDAO;



    @Override
    public List<Pupil> getAllPupils()  {
        return pupilDAO.findAll();
    }

    @Override
    public Map<String, Map<Date,String>> pupilGradesChart(String id){return pupilDAO.pupilGradesChart(id); }

    @Override
    public List<Object[]> amountOfLessonsPerPupil(){return pupilDAO.amountOfLessonsPerPupil(); }

    @Override
    public List<Object[]> getPupilSchedule(String id){return pupilDAO.getPupilSchedule(id); }

    @Override
    public boolean isPupilExists(String id){ return pupilDAO.existsById(id);}

    @Override
    public void addPupil(Pupil pupil) {
        pupilDAO.save(pupil);
    }

    @Override
    public void deletePupilPrefDays(String id) {
        preferableDaysDAO.deleteByPersonId(id);
    }

    @Override
    public void deleteSkillsForPupil(String id) { pupilDAO.deleteSkillsForPupil(id); }

    @Override
    public void addHours(String id, int hours) {pupilDAO.addHours(id,hours);}

    @Override
    public void updatePupil(String id, String parentPhone, String pupilClass, String school, String schoolTeacher, String phoneTeacher)
    {
        pupilDAO.updatePupil(id,parentPhone,pupilClass,school,schoolTeacher,phoneTeacher);
    }

    @Override
    public Map<String, Object> getPupil(String id) {
        Map<String, Object> map = new HashMap<>();
        Pupil pupil = findPupilById(id);
        map.put("pupil", pupil);

//        ArrayList<TeacherStudentsDTO> pupilDTO = new ArrayList<>();
//        teacher.getPupil().forEach(i -> pupilDTO.add(new TeacherStudentsDTO(i)));
//        map.put("pupil", pupilDTO);

       // map.put("pupil", TeacherStudentsDTO.getDTOs(teacher.getPupil()));

        pupil.getSkills().forEach(skill -> {
            map.put(skill.getSkill().getName(), skill.getLevel());
        });
        map.put("prefdays", findPupilPrefDays(id));
        return map;
    }

    @Override
    public Pupil findPupilById(String id) {
        return pupilDAO.findPupilById(id);
    }

    @Override
    public List<PreferableDays> findPupilPrefDays(String id) {
        return preferableDaysDAO.findById(id);
    }

    @Autowired
    public void setPupilDAO(PupilDAO pupilDAO) {
        this.pupilDAO = pupilDAO;
    }

    @Autowired
    public void setPreferableDaysDAO(PreferableDaysDAO preferableDaysDAO) { this.preferableDaysDAO = preferableDaysDAO; }
}
