package project.naveyosefcc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.naveyosefcc.config.SecurityConfig;
import project.naveyosefcc.dto.GradesChartDTO;
import project.naveyosefcc.dto.NextLessonsDTO;
import project.naveyosefcc.entity.Pupil;
import project.naveyosefcc.entity.Student;
import project.naveyosefcc.entity.StudentActivities;
import project.naveyosefcc.service.LessonService;
import project.naveyosefcc.service.StudentActivitiesService;
import project.naveyosefcc.service.StudentService;
import project.naveyosefcc.service.TeacherService;
import utils.Common;

import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class StudentController {

    private TeacherService teacherService;
    private StudentService studentService;
    private LessonService lessonService;
    private StudentActivitiesService studentActivitiesService;

    @GetMapping("/student/index")
    public String getStudentIndex(Model model){
        Student student = studentService.getStudentById(SecurityConfig.getCurrentUser());
        model.addAttribute("students", Common.getPupilSet(student.getPupil()));
        model.addAttribute("teacherName", student.getLastName() + " " + student.getFirstName());
        model.addAttribute("teacherId", student.getId());

        List<NextLessonsDTO> toReturn = new ArrayList<>();
        List<Object[]> objects = lessonService.getNextLessons(student.getId());
        if(!objects.isEmpty())
        {
            objects.forEach(o -> {
                toReturn.add(new NextLessonsDTO(o));
            });
        }
        model.addAttribute("nextLessons", toReturn);


        return "/student/index";
    }

    @GetMapping(value = "/student/getChartData", produces = "application/json")
    @ResponseBody
    public List<GradesChartDTO> getChartData(@RequestParam("idT")String teacherId, @RequestParam("idP")String pupilId){
        List<GradesChartDTO> toReturn = new ArrayList<>();
        List<Object[]> objects = teacherService.getChartData(teacherId, pupilId);
        if(!objects.isEmpty())
        {
            objects.forEach(o -> {
                toReturn.add(new GradesChartDTO(teacherId, o));
            });
        }
        return toReturn;
    }

    @PostMapping("/student/monthlyActivities")
    @ResponseBody
    public List<StudentActivities> getMonthlyActivities(@RequestBody Map<String, String> map){
        return studentActivitiesService.getMonthlyActivities(map.get("sId"));
    }

    @PostMapping("/student/addHourReport")
    public @ResponseBody String addHourReport(@RequestBody Map<String, String> map) throws JSONException {
        Date actDate = Date.valueOf(map.get("activDate"));
        Time startTime = Time.valueOf((map.get("startTime") + ":00"));
        Time endTime = Time.valueOf((map.get("endTime") + ":00"));
        String desc = map.get("activDesc");
        studentActivitiesService.addActivity(actDate, SecurityConfig.getCurrentUser(), startTime, endTime, desc);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("response", "success");
        return jsonObject.toString();
    }

    @PostMapping("/student/removeHourReport")
    public @ResponseBody String removeHourReport(@RequestBody Map<String, String> map) throws JSONException {
        studentActivitiesService.removeActivity(Date.valueOf(map.get("date")), SecurityConfig.getCurrentUser());
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("response", "success");
        return jsonObject.toString();
    }

//    public StudentActivities(Date actDate, String studentId, Time startHour,
//                             Time finishHour, String actDesc)
@GetMapping(value = "/student/getTeacher", produces = "application/json")
@ResponseBody
public Map<String, Object> getTeacher(@RequestParam("id")String teacherId){
    return teacherService.getTeacher(teacherId);
}

    @Autowired
    public void setStudentService(StudentService studentService) {
        this.studentService = studentService;
    }

    @Autowired
    public void setTeacherService(TeacherService teacherService) {
        this.teacherService = teacherService;
    }

    @Autowired
    public void setLessonService(LessonService lessonService) {
        this.lessonService = lessonService;
    }

    @Autowired
    public void setStudentActivitiesService(StudentActivitiesService studentActivitiesService) {
        this.studentActivitiesService = studentActivitiesService;
    }
}
