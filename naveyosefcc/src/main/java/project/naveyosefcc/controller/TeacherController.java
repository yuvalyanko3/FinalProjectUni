package project.naveyosefcc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import project.naveyosefcc.dto.*;
import project.naveyosefcc.entity.Pupil;
import project.naveyosefcc.entity.Teacher;
import project.naveyosefcc.entity.TeacherStudents;
import project.naveyosefcc.service.EmailServiceImpl;
import project.naveyosefcc.service.LessonService;
import project.naveyosefcc.service.TeacherService;
import utils.Common;
import utils.PasswordGenerator;

import java.time.LocalDate;
import java.util.*;

@Controller
public class TeacherController {
    private LessonService lessonService;
    private TeacherService teacherService;

    @GetMapping("/teacher/index")
    public String getTeacherIndex(Model model, Authentication authentication){
        Teacher teacher = teacherService.findTeacherById(authentication.getName());
        model.addAttribute("students", Common.getPupilSet(teacher.getPupil()));
        model.addAttribute("teacherName", teacher.getLastName() + " " + teacher.getFirstName());
        model.addAttribute("teacherId", teacher.getId());
        List<NextLessonsDTO> toReturn = new ArrayList<>();
        List<Object[]> objects = lessonService.getNextLessons(teacher.getId());
        if(!objects.isEmpty())
        {
            objects.forEach(o -> {
                toReturn.add(new NextLessonsDTO(o));
            });
        }
        model.addAttribute("nextLessons", toReturn);
        return "/teacher/index";
    }

    @GetMapping(value = "/teacher/getTeacher", produces = "application/json")
    @ResponseBody
    public Map<String, Object> getTeacher(@RequestParam("id")String teacherId){
        return teacherService.getTeacher(teacherId);
    }

    @GetMapping(value = "/teacher/getChartData", produces = "application/json")
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

    @Autowired
    public void setTeacherService(TeacherService teacherService) {
        this.teacherService = teacherService;
    }

    @Autowired
    public void setLessonService(LessonService lessonService) {
        this.lessonService = lessonService;
    }
}
