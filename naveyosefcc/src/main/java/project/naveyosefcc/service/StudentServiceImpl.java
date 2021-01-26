package project.naveyosefcc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.naveyosefcc.dao.PersonDAO;
import project.naveyosefcc.dao.PreferableDaysDAO;
import project.naveyosefcc.dao.StudentDAO;
import project.naveyosefcc.dto.TeacherStudentsDTO;
import project.naveyosefcc.entity.PreferableDays;
import project.naveyosefcc.entity.Student;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class StudentServiceImpl implements StudentService {

    private StudentDAO studentDAO;
    private PersonDAO personDAO;
    private TeacherStudentsService teacherStudentsService;
    private PreferableDaysDAO preferableDaysDAO;

    @Override
    public List<Student> getAllStudents() {
        return studentDAO.findAll();
    }

    @Override
    public void addStudent(Student student) {
        studentDAO.save(student);
    }

    List<PreferableDays> findPrefDays(String id) {
        return preferableDaysDAO.findById(id);
    }

    @Override
    public Map<String, Object> getStudent(String id) {
        Map<String, Object> toReturn = new HashMap<>();
        Student student =  (Student) personDAO.getPersonById(id);
        List<Object[]> pupils = teacherStudentsService.getTeacherStudentDTO(student.getId());
        List<TeacherStudentsDTO> toAdd = new ArrayList<>();
        pupils.forEach(i -> toAdd.add(new TeacherStudentsDTO(i)));
        toReturn.put("student", student);
        toReturn.put("pupil", toAdd);
        student.getSkills().forEach(skill -> toReturn.put(skill.getSkill().getName(), skill.getLevel()));
        toReturn.put("prefdays", findPrefDays(id));
        return toReturn;
    }

    @Override
    public void updateStudent(String id ,String institution, String degree, String program, String coordinator) {
        studentDAO.updateStudent(id, institution,  degree,  program, coordinator);
    }

    @Override
    public void deleteSkillsForStudent(String id) {
        studentDAO.deleteSkillsForStudent(id);
    }

    @Override
    public void deletePrefDaysForStudent(String id) {
        preferableDaysDAO.deleteByPersonId(id);
    }

    @Override
    public Student getStudentById(String id) {
        return (Student) personDAO.getPersonById(id);
    }

    @Autowired
    public void setStudentDAO(StudentDAO studentDAO) {
        this.studentDAO = studentDAO;
    }

    @Autowired
    public void setPersonDAO(PersonDAO personDAO) {
        this.personDAO = personDAO;
    }

    @Autowired
    public void setPreferableDaysDAO(PreferableDaysDAO preferableDaysDAO) {
        this.preferableDaysDAO = preferableDaysDAO;
    }

    @Autowired
    public void setTeacherStudentsService(TeacherStudentsService teacherStudentsService) {
        this.teacherStudentsService = teacherStudentsService;
    }
}
