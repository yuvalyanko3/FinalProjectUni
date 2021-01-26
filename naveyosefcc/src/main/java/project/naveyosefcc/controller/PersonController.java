package project.naveyosefcc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import project.naveyosefcc.entity.Person;
import project.naveyosefcc.entity.Skill;
import project.naveyosefcc.entity.SkillsForPerson;
import project.naveyosefcc.service.PersonService;
import utils.Common;
import utils.E_Skills;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
public class PersonController {

    private PersonService personService;
    private PasswordEncoder passwordEncoder;

    @GetMapping("/list_people")
    public String listPeople(Model model){
        model.addAttribute("personList", personService.getAllPersons());
        return "list_people";
    }

    @GetMapping("/view_person")
    public String viewPerson(){
        return "view_person";
    }

    @GetMapping("/view_person_res")
    public ModelAndView getPersonById(@RequestParam("id") String id){
        Person p = personService.getPersonById(id);
        ModelAndView toReturn = new ModelAndView("view_person");
        toReturn.addObject("reqPerson", personService.getPersonById(id));
        return toReturn;
    }

    @PostMapping(value = "/changePassword", produces = "application/json")
    @ResponseStatus(value = HttpStatus.OK)
    @ResponseBody
    public String changePassword(@RequestBody Map<String, String> map, Authentication authentication) throws JSONException {
        String toReturn = "success";
        if(map.get("id").equals(authentication.getName()))
        {
            personService.updatePassword(map.get("id"), passwordEncoder.encode(map.get("newPass")));
        }
        else
            toReturn = "failure";
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("response", toReturn);
        return jsonObject.toString();
    }

    @PostMapping("/changeMail")
    @ResponseStatus(value = HttpStatus.OK)
    @ResponseBody
    public String changeMail(@RequestBody Map<String, String> map, Authentication authentication) throws JSONException {
        String toReturn = "success";
        if(map.get("id").equals(authentication.getName()))
        {
            personService.updateMail(map.get("id"), map.get("newMail"));
        }
        else
            toReturn = "failure";
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("response", toReturn);
        return jsonObject.toString();
    }

    public void updatePerson(Map<String, String> map) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date parsed = new Date();
        try {
            parsed = sdf.parse(map.get("birthDate"));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        personService.updatePerson(map.get("id"), map.get("firstName"), map.get("lastName"), new java.sql.Date(parsed.getTime()),
                map.get("gender"), map.get("phone"), map.get("email"));
        Common.addSkills(map.get("id"), map, personService);
        Common.addPrefDays(map.get("id"), map, personService);
    }

    @Autowired
    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }

    @Autowired
    public void setPasswordEncoder(PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }
}
