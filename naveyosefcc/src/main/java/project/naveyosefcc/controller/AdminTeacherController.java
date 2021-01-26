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
import project.naveyosefcc.container.SkillLevelContainer;
import project.naveyosefcc.dto.TeacherStudentsDTO;
import project.naveyosefcc.dto.TeachersBySkillDTO;
import project.naveyosefcc.entity.*;
import project.naveyosefcc.service.*;
import utils.*;

import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.util.*;

@Controller
public class AdminTeacherController {

    private PersonController personController;
    private TeacherService teacherService;
    private PersonService personService;
    private UsersService usersService;
    private EmailServiceImpl emailService;
    private PasswordEncoder passwordEncoder;

    @GetMapping("/admin/teachers")
    public String getTeachers(Model model) {
        getTeachers(model, teacherService);
        model.addAttribute("teacher", new Teacher());
        model.addAttribute("skillCon", new SkillLevelContainer());
        return "admin/teachers";
    }

    static void getTeachers(Model model, TeacherService teacherService) {
        List<Teacher> people = new ArrayList<>();
        HashMap<String, Teacher> peoples = new HashMap<>();
        List<Object[]> objects = teacherService.getTeachers();
        if(!objects.isEmpty()) {
            objects.forEach(o -> {
                Teacher t = teacherService.findTeacherById((String) o[0]);
                if(peoples.get((String) o[0])== null)
                    peoples.put((String) o[0], new Teacher(o));
                else {
                    Teacher tr = peoples.get((String) o[0]);
                    tr.addSkill(o[7].toString(), String.valueOf(o[8]));
                }
            });
        }
        for (Teacher t : peoples.values()){
            people.add(t);
        }
        Iterator<Teacher> iterator = people.iterator();
        while(iterator.hasNext()) {
            Set<SkillsForPerson> skills = iterator.next().getSkills();
            if(skills != null)
                Common.setHebrewName(skills);
        }
        model.addAttribute("teachers", people);
    }

    @GetMapping(value = "/admin/getTeacher", produces = "application/json")
    @ResponseBody
    public Map<String, Object> getTeacher(@RequestParam("id")String teacherId){
        return teacherService.getTeacher(teacherId);
    }

    @GetMapping(value = "/admin/deleteTeacher", produces = "application/json")
    public @ResponseBody String deleteTeacher(@RequestParam("id")String id) throws JSONException {
        String toReutrn = "success";
        try{
            personService.deletePersonById(id);
        }catch (Exception e){
            toReutrn = "failure";
        }
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("response", toReutrn);
        return jsonObject.toString();
    }

    @PostMapping(value = "/admin/addTeacher", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(value = HttpStatus.OK)
    @ResponseBody
    public String addTeacher(@RequestBody Map<String, String> map) throws JSONException {
        String toReturn = "success";
        if(!teacherService.isTeacherExists(map.get("id")))
        {
            Teacher teacher = new Teacher(map.get("id"), map.get("firstName"), map.get("lastName"),
                    java.sql.Date.valueOf(map.get("birthDate")), map.get("gender"), map.get("phone"), map.get("email"), null);
            teacherService.addTeacher(teacher);
            Common.addSkills(teacher.getId(), map, personService);
            Common.addPrefDays(teacher.getId(), map, personService);
            Common.setLoginProperties(teacher, E_Roles.ROLE_TEACHER, usersService, passwordEncoder, emailService);
        }
        else
            toReturn = "failure";
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("response", toReturn);
        return jsonObject.toString();
    }

    @PostMapping(value = "/admin/updateTeacher", produces = "application/json")
    @ResponseStatus(value = HttpStatus.OK)
    @ResponseBody
    public String updateTeacher(@RequestBody Map<String, String> map) throws JSONException {
        String toReturn = "success";
        if(teacherService.isTeacherExists(map.get("id")))
        {
            teacherService.deleteTeacherPrefDays(map.get("id"));
            teacherService.deleteSkillsForTeacher(map.get("id"));
            personController.updatePerson(map);
        }
        else
            toReturn = "failure";
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("response", toReturn);
        return jsonObject.toString();
    }

    @Autowired
    public void setTeacherService(TeacherService teacherService) {
        this.teacherService = teacherService;
    }

    @Autowired
    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }

    @Autowired
    public void setEmailService(EmailServiceImpl emailService) {
        this.emailService = emailService;
    }

    @Autowired
    public void setUsersService(UsersService usersService) {
        this.usersService = usersService;
    }

    @Autowired
    public void setPasswordEncoder(PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }

    @Autowired
    public void setPersonController(PersonController personController) {
        this.personController = personController;
    }
}
