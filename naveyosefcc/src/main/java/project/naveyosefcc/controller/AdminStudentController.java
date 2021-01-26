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
import project.naveyosefcc.entity.SkillsForPerson;
import project.naveyosefcc.entity.Student;
import project.naveyosefcc.service.EmailServiceImpl;
import project.naveyosefcc.service.PersonService;
import project.naveyosefcc.service.StudentService;
import project.naveyosefcc.service.UsersService;
import utils.Common;
import utils.Consts;
import utils.E_Programs;
import utils.E_Roles;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class AdminStudentController {

    private PersonController personController;
    private PersonService personService;
    private StudentService studentService;
    private UsersService usersService;
    private EmailServiceImpl emailService;
    private PasswordEncoder passwordEncoder;

    @GetMapping("/admin/students")
    public String getStudents(Model model) {
        List<Student> students = studentService.getAllStudents();
        model.addAttribute("students", students);
        Iterator<Student> iterator = students.iterator();

        while(iterator.hasNext())
        {
            Set<SkillsForPerson> skills = iterator.next().getSkills();
            if(skills != null)
                Common.setHebrewName(skills);
        }

        return "admin/students";
    }

    @GetMapping("/admin/getStudent")
    @ResponseBody
    public Map<String, Object> getStudent(@RequestParam("id")String studentId) {
        return studentService.getStudent(studentId);
    }

    @PostMapping(value = "/admin/addStudent", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(value = HttpStatus.OK)
    @ResponseBody
    public String addStudent(@RequestBody Map<String, String> map) throws JSONException {
        String toReturn = "success";
        if(!personService.isPersonExists(map.get("id")))
        {
            Student student = new Student(map.get("id"), map.get("firstName"), map.get("lastName"), java.sql.Date.valueOf(map.get("birthDate")),
                    map.get("gender"), map.get("phone"), map.get("email"), null,
                    map.get("insitute"), map.get("degree"), map.get("program"), map.get("coordinator"));
            studentService.addStudent(student);
            Common.addSkills(student.getId(), map, personService);
            Common.addPrefDays(student.getId(), map, personService);
            Common.setLoginProperties(student, E_Roles.ROLE_STUDENT, usersService, passwordEncoder, emailService);
        }
        else
            toReturn = "failure";
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("response", toReturn);
        return jsonObject.toString();
    }

    @PostMapping(value = "/admin/updateStudent", produces = "application/json")
    @ResponseStatus(value = HttpStatus.OK)
    @ResponseBody
    public String updateStudent(@RequestBody Map<String, String> map) throws JSONException {
        String toReturn = "success";
        if(map.containsKey("id") && personService.isPersonExists(map.get("id")))
        {
            studentService.deletePrefDaysForStudent(map.get("id"));
            studentService.deleteSkillsForStudent(map.get("id"));
            personController.updatePerson(map);
            studentService.updateStudent(map.get("id"),map.get("institution"),map.get("degree"),
                    map.get("program"), map.get("coordinator"));
        }
        else
            toReturn = "failure";
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("response", toReturn);
        return jsonObject.toString();
    }

    private String getProgram(String ps) {
        String toReturn = "";
        for(E_Programs p : E_Programs.values())
        {
            if(p.name().equals(ps))
            {
                toReturn = p.getName();
            }
        }
        return toReturn;
    }

    @GetMapping(value = "/admin/deleteStudent", produces = "application/json")
    public @ResponseBody String deleteStudent(@RequestParam("id")String id) throws JSONException {
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

    @Autowired
    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }

    @Autowired
    public void setStudentService(StudentService studentService) {
        this.studentService = studentService;
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
