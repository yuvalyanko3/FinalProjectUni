package project.naveyosefcc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.naveyosefcc.dao.PreferableDaysDAO;
import project.naveyosefcc.dao.TeacherDAO;
import project.naveyosefcc.dao.TeacherStudentsDAO;
import project.naveyosefcc.dto.TeacherStudentsDTO;
import project.naveyosefcc.entity.PreferableDays;
import project.naveyosefcc.entity.Teacher;
import project.naveyosefcc.entity.TeacherStudents;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TeacherServiceImpl implements TeacherService {

    private TeacherDAO teacherDAO;
    private PreferableDaysDAO preferableDaysDAO;
    private TeacherStudentsDAO teacherStudentsDAO;

    @Override
    public List<Object[]> getTeachers() {
        return teacherDAO.getTeachers();
    }

//    @Override
//    public List<Teacher> getTeachers() {
//        return teacherDAO.findAll();
//    }

    @Override
    public Teacher findTeacherById(String id) {
        return teacherDAO.findTeacherById(id);
    }

    @Override
    public void addTeacher(Teacher teacher) {
        teacherDAO.save(teacher);
    }

    @Override
    public void addSkillForTeacher(String id, String name, int lvl) {
        teacherDAO.addSkillForTeacher(id, name, lvl);
    }

    @Override
    public boolean isTeacherExists(String id){
        return teacherDAO.existsById(id);
    }

    @Override
    public void deleteTeacher(String id) {
        teacherDAO.deleteTeacherById(id);
    }

    @Override
    public List<PreferableDays> findTeacherPrefDays(String id) {
        return preferableDaysDAO.findById(id);
    }

    @Override
    public void deleteTeacherPrefDays(String id) {
        preferableDaysDAO.deleteByPersonId(id);
    }

    @Override
    public void deleteSkillsForTeacher(String id) {
        teacherDAO.deleteSkillsForTeacher(id);
    }

    @Override
    public Map<String, Object> getTeacher(String id) {
        Map<String, Object> map = new HashMap<>();
        Teacher teacher = findTeacherById(id);
        List<Object[]> pupils = teacherStudentsDAO.getTeacherStudentDTO(teacher.getId());
        List<TeacherStudentsDTO> toAdd = new ArrayList<>();
        pupils.forEach(i -> toAdd.add(new TeacherStudentsDTO(i)));
        map.put("teacher", teacher);
        map.put("pupil", toAdd);

        teacher.getSkills().forEach(skill -> {
            map.put(skill.getSkill().getName(), skill.getLevel());
        });
        map.put("prefdays", findTeacherPrefDays(id));
        return map;
    }

    @Override
    public List<Object[]> getChartData(String idT, String idP) {
        return teacherDAO.setGradesChart(idT, idP);
    }

   /* @Override
    public List<Object[]> getObjects(String id) {
        return teacherDAO.example(id);
    }
    */
   @Override
    public List<Object[]> teacherWeeklySchedule(String id){ return teacherDAO.teacherWeeklySchedule(id);}

    @Autowired
    public void setTeacherDAO(TeacherDAO teacherDAO) {
        this.teacherDAO = teacherDAO;
    }

    @Autowired
    public void setPreferableDaysDAO(PreferableDaysDAO preferableDaysDAO) {
        this.preferableDaysDAO = preferableDaysDAO;
    }

    @Autowired
    public void setTeacherStudentsDAO(TeacherStudentsDAO teacherStudentsDAO) {
        this.teacherStudentsDAO = teacherStudentsDAO;
    }
}
