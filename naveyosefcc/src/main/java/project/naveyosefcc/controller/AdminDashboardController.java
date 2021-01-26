package project.naveyosefcc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import project.naveyosefcc.dto.*;
import project.naveyosefcc.service.DashboardService;

import java.util.ArrayList;
import java.util.List;

@Controller
public class AdminDashboardController {
    private DashboardService dashboardService;

    @GetMapping("/admin/dashboard")
    public String geDashboard() {
        return "/admin/dashboard";
    }

    @PostMapping(value = "/admin/processDashboard1", produces = "application/json")
    @ResponseBody
    public List<TeachersBySkillDTO> getNumOfTeachersBySkill() {
        List<TeachersBySkillDTO> toReturn = new ArrayList<>();
        List<Object[]> objects = dashboardService.getNumOfTeachersBySkill();
        if(!objects.isEmpty())
        {
            objects.forEach(o -> {
                toReturn.add(new TeachersBySkillDTO(o));
            });
        }
        return toReturn;
    }

    @PostMapping(value = "/admin/processDashboard2", produces = "application/json")
    @ResponseBody
    public List<StudentsByProgramDTO> getNumOfStudentsByProgram() {
        List<StudentsByProgramDTO> toReturn = new ArrayList<>();
        List<Object[]> objects = dashboardService.getNumOfStudentsByProgram();
        if(!objects.isEmpty())
        {
            objects.forEach(o -> {
                toReturn.add(new StudentsByProgramDTO(o));
            });
        }
        //System.out.println(toReturn);
        return toReturn;
    }

    @PostMapping(value = "/admin/processDashboard3", produces = "application/json")
    @ResponseBody
    public List<GradesByYearAndMonthDTO> getAVGradesByYearAndMonth() {
        List<GradesByYearAndMonthDTO> toReturn = new ArrayList<>();
        List<Object[]> objects = dashboardService.getAVGradesByYearAndMonth();
        if(!objects.isEmpty())
        {
            objects.forEach(o -> {
                toReturn.add(new GradesByYearAndMonthDTO(o));
            });
        }
        //System.out.println(toReturn);
        return toReturn;
    }

    @PostMapping(value = "/admin/processDashboard4", produces = "application/json")
    @ResponseBody
    public List<GradesByTeachersDTO> getAVGradesByTeachers() {
        List<GradesByTeachersDTO> toReturn = new ArrayList<>();
        List<Object[]> objects = dashboardService.getAVGradesByTeachers();
        if(!objects.isEmpty())
        {
            objects.forEach(o -> {
                toReturn.add(new GradesByTeachersDTO(o));
            });
        }
        return toReturn;
    }

    @PostMapping(value = "/admin/processDashboard5", produces = "application/json")
    @ResponseBody
    public List<PupilsBySkillsDTO> getNumOfPupilsBySkills() {
        List<PupilsBySkillsDTO> toReturn = new ArrayList<>();
        List<Object[]> objects = dashboardService.getNumOfPupilsBySkills();
        if(!objects.isEmpty())
        {
            objects.forEach(o -> {
                toReturn.add(new PupilsBySkillsDTO(o));
            });
        }
        return toReturn;
    }

    @PostMapping(value = "/admin/processDashboard6", produces = "application/json")
    @ResponseBody
    public List<PupilsByAgeGroupDTO> getNumOfPupilsByAgeGroup() {
        List<PupilsByAgeGroupDTO> toReturn = new ArrayList<>();
        List<Object[]> objects = dashboardService.getNumOfPupilsByAgeGroup();
        if(!objects.isEmpty())
        {
            objects.forEach(o -> {
                toReturn.add(new PupilsByAgeGroupDTO(o));
            });
        }
        return toReturn;
    }

    @PostMapping(value = "/admin/processDashboard7", produces = "application/json")
    @ResponseBody
    public List<PupilsByAttendanceDTO> getNumOfPupilsByAttendance() {
        List<PupilsByAttendanceDTO> toReturn = new ArrayList<>();
        List<Object[]> objects = dashboardService.getNumOfPupilsByAttendance();
        if(!objects.isEmpty())
        {
            objects.forEach(o -> {
                toReturn.add(new PupilsByAttendanceDTO(o));
            });
        }
        return toReturn;
    }

    @PostMapping(value = "/admin/processDashboard8", produces = "application/json")
    @ResponseBody
    public List<PupilsByNumOfClassesDTO> getNumOfPupilsByNumOfClasses() {
        List<PupilsByNumOfClassesDTO> toReturn = new ArrayList<>();
        List<Object[]> objects = dashboardService.getNumOfPupilsByNumOfClasses();
        if(!objects.isEmpty())
        {
            objects.forEach(o -> {
                toReturn.add(new PupilsByNumOfClassesDTO(o));
            });
        }
        return toReturn;
    }

    @PostMapping(value = "/admin/processDashboard9", produces = "application/json")
    @ResponseBody
    public List<PupilsByGradesDTO> getTOP3ofPupilsByAVG(@RequestBody Integer rBody) {
        List<PupilsByGradesDTO> toReturn = new ArrayList<>();
        if(rBody == 1) {
            List<Object[]> objects = dashboardService.getTOP3ofPupilsByAVG();
            if (!objects.isEmpty()) {
                objects.forEach(o -> {
                    toReturn.add(new PupilsByGradesDTO(o));
                });
            }
        }
        else {
            List<Object[]> objects = dashboardService.getLAST3ofPupilsByAVG();
            if (!objects.isEmpty()) {
                objects.forEach(o -> {
                    toReturn.add(new PupilsByGradesDTO(o));
                });
            }
        }
        return toReturn;
    }

    @PostMapping(value = "/admin/processDashboard10", produces = "application/json")
    @ResponseBody
    public List<PupilsByGradesDTO> getNumOfPupilsByGrades() {
        List<PupilsByGradesDTO> toReturn = new ArrayList<>();
        List<Object[]> objects = dashboardService.getNumOfPupilsByGrades();
        if(!objects.isEmpty())
        {
            objects.forEach(o -> {
                toReturn.add(new PupilsByGradesDTO(o));
            });
        }
        return toReturn;
    }
    @Autowired
    public void setDashboardService(DashboardService dashboardService) {
       this.dashboardService = dashboardService;
   }





}
