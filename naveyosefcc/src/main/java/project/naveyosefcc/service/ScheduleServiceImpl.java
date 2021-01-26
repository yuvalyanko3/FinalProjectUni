package project.naveyosefcc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.naveyosefcc.dao.PupilDAO;
import project.naveyosefcc.dao.TeacherDAO;
import project.naveyosefcc.dao.TeacherStudentsDAO;
import project.naveyosefcc.dto.AssignedTeacherStudent;
import project.naveyosefcc.dto.TeacherScheduleDTO;
import project.naveyosefcc.dto.UnassignedPupilsDTO;

import java.sql.Time;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class ScheduleServiceImpl implements ScheduleService {

    private TeacherDAO teacherDAO;
    private PupilDAO pupilDAO;
    private TeacherStudentsDAO teacherStudentsDAO;

    @Override
    public Set<UnassignedPupilsDTO> getUnassignedPupils(String subject) {
        List<Object[]> unassigned = pupilDAO.getUnassignedPupils(subject);
        Set<UnassignedPupilsDTO> toReturn = new HashSet<>();
        unassigned.forEach(i ->
            toReturn.add(new UnassignedPupilsDTO(i))
        );
        return toReturn;
    }

    @Override
    public List<TeacherScheduleDTO> getTeachersForSchedule(String subject, String day) {
        List<Object[]> teachers = teacherDAO.getTeachersForScheduleBuilder(subject, day);
        List<TeacherScheduleDTO> toReturn = new ArrayList<>();
        teachers.forEach(i ->
            toReturn.add(new TeacherScheduleDTO(i))
        );
        return toReturn;
    }

    @Override
    public List<AssignedTeacherStudent> getAssignedTeacherStudent(String subject) {
        List<Object[]> assigned = teacherStudentsDAO.getTeacherStudentAssigning(subject);
        List<AssignedTeacherStudent> toReturn = new ArrayList<>();
        assigned.forEach(i ->
            toReturn.add(new AssignedTeacherStudent(i))
        );
        return toReturn;
    }

    @Override
    public List<UnassignedPupilsDTO> getPupilsForScheduleBuilder(String subject) {
        List<Object[]> unassigned = pupilDAO.getPupilsForScheduleBuilder(subject);
        List<UnassignedPupilsDTO> toReturn = new ArrayList<>();
        unassigned.forEach(i ->
                toReturn.add(new UnassignedPupilsDTO(i))
        );
        return toReturn;
    }

    @Override
    public void removeTeacherStudentRelation(String tId, String pId, String skill, String day) {
        this.teacherStudentsDAO.removeTeacherStudentRelation(tId, pId, skill, day);
    }

    @Override
    public void addTeacherStudentRelation(String tId, String pId, String day, Time hour, String skill) {
        teacherStudentsDAO.addTeacherStudentRelation(tId, pId, day, hour, skill);
    }

    @Autowired
    public void setTeacherDAO(TeacherDAO teacherDAO) {
        this.teacherDAO = teacherDAO;
    }

    @Autowired
    public void setPupilDAO(PupilDAO pupilDAO) {
        this.pupilDAO = pupilDAO;
    }

    @Autowired
    public void setTeacherStudentsDAO(TeacherStudentsDAO teacherStudentsDAO) {
        this.teacherStudentsDAO = teacherStudentsDAO;
    }
}
