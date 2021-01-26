package project.naveyosefcc.service;

import project.naveyosefcc.dto.AssignedTeacherStudent;
import project.naveyosefcc.dto.TeacherScheduleDTO;
import project.naveyosefcc.dto.UnassignedPupilsDTO;

import java.sql.Time;
import java.util.List;
import java.util.Set;

public interface ScheduleService {

    Set<UnassignedPupilsDTO> getUnassignedPupils(String subject);
    List<TeacherScheduleDTO> getTeachersForSchedule(String subject, String day);
    List<AssignedTeacherStudent> getAssignedTeacherStudent(String subject);
    List<UnassignedPupilsDTO> getPupilsForScheduleBuilder(String subject);
    void addTeacherStudentRelation(String tId, String pId, String day, Time hour, String skill);
    void removeTeacherStudentRelation(String tId, String pId, String skill, String day);
}
