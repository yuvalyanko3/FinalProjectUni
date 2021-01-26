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
import project.naveyosefcc.config.SecurityConfig;
import project.naveyosefcc.dto.AttendanceSumDTO;
import project.naveyosefcc.dto.LessonSheetDTO;
import project.naveyosefcc.dto.AmountOfLessonsDTO;
import project.naveyosefcc.dto.PupilScheduleDTO;
import project.naveyosefcc.entity.*;
import project.naveyosefcc.service.*;
import utils.*;

import java.util.*;

@Controller
public class AdminPupilController {

    private PupilService pupilService;
    private LessonService lessonService;
    private PersonService personService;
    private PersonController personController;
    private UsersService usersService;
    private EmailServiceImpl emailService;
    private PasswordEncoder passwordEncoder;
    private PupilController pupilController;

    @GetMapping("/admin/pupils")
    public String getPupils(Model model) {
        List<Pupil> pupils = pupilService.getAllPupils();
        List<AmountOfLessonsDTO> toReturn = new ArrayList<>();
        List<Object[]> objects = pupilService.amountOfLessonsPerPupil();
        if(!objects.isEmpty())
        {
            objects.forEach(o -> {
                toReturn.add(new AmountOfLessonsDTO(o));
            });
        }
        Map <String, String> lessonsPerPupil = new HashMap<>();
        model.addAttribute("pupils", pupils);
        for (Pupil p : pupils) {
            for (AmountOfLessonsDTO ald : toReturn) {
                if (p.getId().equals(ald.getPupilId())) {
                    lessonsPerPupil.put(p.getId(), ald.getAmount());
                }
            }
        }
        model.addAttribute("lessonsPerPupil", lessonsPerPupil);

        Iterator<Pupil> iterator = pupils.iterator();
        while (iterator.hasNext()) {
            Set<SkillsForPerson> skills = iterator.next().getSkills();
            if (skills != null)
                Common.setHebrewName(skills);
        }
        return "admin/pupils";
    }

    @PostMapping(value = "/admin/addPupil", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(value = HttpStatus.OK)
    @ResponseBody
    public String addPupil(@RequestBody Map<String, String> map) throws JSONException {
        String toReturn = "success";
        if(!personService.isPersonExists(map.get("id")))
        {
            Pupil pupil = new Pupil(map.get("id"), map.get("firstName"), map.get("lastName"), java.sql.Date.valueOf(map.get("birthDate"))
                   ,map.get("gender"), map.get("phone"), map.get("email"), null, map.get("pupilClass"),
                    map.get("school"), map.get("schoolTeacher"), map.get("phoneTeacher"),map.get("parentPhone"));
            pupilService.addPupil(pupil);
            Common.addSkills(pupil.getId(), map, personService);
            Common.addPrefDays(pupil.getId(), map, personService);
        }
        else
            toReturn = "failure";
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("response", toReturn);
        return jsonObject.toString();
    }

    @PostMapping(value = "/admin/updatePupil", produces = "application/json")
    @ResponseStatus(value = HttpStatus.OK)
    @ResponseBody
    public String updatePupil(@RequestBody Map<String, String> map) throws JSONException {
        String toReturn = "success";
        if(personService.isPersonExists(map.get("id")))
        {
            pupilService.deletePupilPrefDays(map.get("id"));
            pupilService.deleteSkillsForPupil(map.get("id"));
            personController.updatePerson(map);
            pupilController.updatePupil(map);
            try{ pupilService.addHours(map.get("id"),Integer.valueOf(map.get("hoursToAdd"))); } catch(NumberFormatException ex){ }
        }
        else
            toReturn = "failure";
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("response", toReturn);
        return jsonObject.toString();
    }

    @GetMapping(value = "/admin/deletePupil", produces = "application/json")
    public @ResponseBody String deletePupil(@RequestParam("id")String id) throws JSONException {
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


    @GetMapping(value = "/admin/getPupil", produces = "application/json")
    @ResponseBody
    public Map<String, Object> getPupil(@RequestParam("id")String pupilId){
        return pupilService.getPupil(pupilId);
    }


    @PostMapping(value = "/admin/getLessonData", produces = "application/json")
    @ResponseStatus(value = HttpStatus.OK)
    public @ResponseBody List<LessonSheetDTO> getLessonData(@RequestBody Map<String, String> map) {
        List<LessonSheetDTO> toReturn = new ArrayList<>();
        List<Object[]> objects = lessonService.getPupilLessons(map.get("id"));
        List<Object[]> objects2 = lessonService.getAttendanceSum(map.get("id"));
        if(!objects.isEmpty() && !objects2.isEmpty())
        {
            objects.forEach(o -> {
                    toReturn.add(new LessonSheetDTO(o,objects2.get(0)));
            });
        }
        return toReturn;
    }

    @GetMapping(value = "/admin/getPupilSchedule", produces = "application/json")
    @ResponseStatus(value = HttpStatus.OK)
    public @ResponseBody List<PupilScheduleDTO> getPupilSchedule(@RequestParam("id") String pupilId) {
        List<PupilScheduleDTO> toReturn = new ArrayList<>();
        List<Object[]> objects = pupilService.getPupilSchedule(pupilId);
        if(!objects.isEmpty())
        {
            objects.forEach(o -> {
                toReturn.add(new PupilScheduleDTO(o));
            });
        }
        return toReturn;
    }

    @Autowired
    public void setPupilService(PupilService pupilService) {
        this.pupilService = pupilService;
    }

    @Autowired
    public void setLessonService(LessonService lessonService) {
        this.lessonService = lessonService;
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

    @Autowired
    public void setPupilController(PupilController pupilController) {
        this.pupilController = pupilController;
    }
}