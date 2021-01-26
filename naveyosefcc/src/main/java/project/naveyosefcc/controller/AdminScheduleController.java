package project.naveyosefcc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.naveyosefcc.dto.AssignedTeacherStudent;
import project.naveyosefcc.dto.TeacherScheduleDTO;
import project.naveyosefcc.dto.UnassignedPupilsDTO;
import project.naveyosefcc.entity.SkillsForPerson;
import project.naveyosefcc.entity.Student;
import project.naveyosefcc.entity.TeacherStudentKey;
import project.naveyosefcc.entity.TeacherStudents;
import project.naveyosefcc.service.*;
import utils.Common;
import utils.Consts;
import utils.E_Programs;
import utils.E_Roles;

import java.sql.Time;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.TimeUnit;


@Controller
public class AdminScheduleController {

    private ScheduleService scheduleService;

    @GetMapping("/admin/schedule")
    public String getScheduleController() {
        return "admin/schedule";
    }

    @PostMapping(value = "/admin/getUnassignedPupils", produces = "application/json")
    @ResponseBody
    public Set<UnassignedPupilsDTO> getUnassignedPupils(@RequestBody Map<String, String> map) {
        return scheduleService.getUnassignedPupils(map.get("subject"));
    }

    @PostMapping(value = "/admin/getTeachersForSchedule", produces = "application/json")
    @ResponseBody
    public List<TeacherScheduleDTO> getTeachersForSchedule(@RequestBody Map<String, String> map) {
        return scheduleService.getTeachersForSchedule(map.get("subject"), map.get("days"));
    }

    @PostMapping(value = "/admin/getAssignedTeacherStudent", produces = "application/json")
    @ResponseBody
    public List<AssignedTeacherStudent> getAssignedTeacherStudent(@RequestBody Map<String, String> map) {
        return scheduleService.getAssignedTeacherStudent(map.get("subject"));
    }

    @PostMapping(value = "/admin/getPupilsForScheduleBuilder", produces = "application/json")
    @ResponseBody
    public List<UnassignedPupilsDTO> getPupilsForScheduleBuilder(@RequestBody Map<String, String> map) {
        return scheduleService.getPupilsForScheduleBuilder(map.get("subject"));
    }

    @PostMapping(value = "/admin/addTeacherStudentRelation", produces = "application/json")
    @ResponseBody
    public String addTeacherStudentRelation(@RequestBody Map<String, String> map) throws JSONException {
        Time hour= new Time(TimeUnit.HOURS.toMillis(Integer.parseInt(map.get("hour"))));
        scheduleService.addTeacherStudentRelation(map.get("teacherId"), map.get("pupilId"), map.get("day"),
                                                        hour, map.get("skill"));
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("response", "success");
        return jsonObject.toString();
    }

    @PostMapping(value = "/admin/removeTeacherStudentRelation", produces = "application/json")
    @ResponseBody
    public String removeTeacherStudentRelation(@RequestBody Map<String, String> map) throws JSONException {
        scheduleService.removeTeacherStudentRelation(map.get("teacherId"), map.get("pupilId"),
                                                        map.get("skill"), map.get("day"));
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("response", "success");
        return jsonObject.toString();
    }

    @Autowired
    public void setScheduleService(ScheduleService scheduleService) {
        this.scheduleService = scheduleService;
    }
}
