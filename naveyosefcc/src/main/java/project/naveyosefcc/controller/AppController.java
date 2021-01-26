package project.naveyosefcc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.http.MediaType;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import project.naveyosefcc.entity.Person;
import project.naveyosefcc.service.EmailServiceImpl;
import project.naveyosefcc.service.PersonService;
import project.naveyosefcc.service.UsersService;
import project.naveyosefcc.service.UsersServiceImpl;
import utils.Consts;
import utils.E_Roles;
import utils.PasswordGenerator;

import java.util.Map;

@Controller
public class AppController {

    private UsersService usersService;
    private PersonService personService;
    private PasswordEncoder passwordEncoder;
    private EmailServiceImpl emailService;

    @GetMapping("/")
    public String getIndex(){
        String toReturn = "";
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            String auth = authentication.getAuthorities().toString();
            if(auth.equalsIgnoreCase("["+ E_Roles.ROLE_ADMIN.name()+"]"))
                toReturn = "admin/index";
            else if(auth.equalsIgnoreCase("["+ E_Roles.ROLE_STUDENT.name()+"]"))
                toReturn = "student/index";
            else if(auth.equalsIgnoreCase("["+ E_Roles.ROLE_TEACHER.name()+"]"))
                toReturn = "teacher/index";
            else if(auth.equalsIgnoreCase("["+ E_Roles.ROLE_PUPIL.name()+"]"))
                toReturn = "pupil/index";
        }
        return toReturn;
    }

    @GetMapping("/admin/index")
    public String getAdminIndex(){
        return "admin/index";
    }

    @GetMapping("/logout_page")
    public String getLogoutPage() {
        return "logout_page";
    }

    @GetMapping("/error")
    public String getErrorPage() { return "error"; }

    @PostMapping(value = "/reset_password", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public String resetPassword(@RequestBody Map<String, String> data) throws JSONException {
        JSONObject jsonObject = new JSONObject();
        String id = data.get("id");
        if(usersService.isUserExists(id))
        {
            String newPass = PasswordGenerator.getPassword();
            Person person = personService.getPersonById(id);
            String emailBody = Consts.getEmailNewPassTemplate(person.getFirstName() + " " + person.getLastName(), newPass);
            personService.updatePassword(id, passwordEncoder.encode(newPass));
            emailService.sendMail("maayanpolk@gmail.com", "מרכז למידה נווה יוסף: סיסמתך שונתה בהצלחה", emailBody);

        }
        else
            jsonObject.put("response", "failure");

        jsonObject.put("response", "success");
        return jsonObject.toString();
    }

    @Autowired
    public void setUsersService(UsersService usersService) {
        this.usersService = usersService;
    }

    @Autowired
    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }

    @Autowired
    public void setPasswordEncoder(PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }

    @Autowired
    public void setEmailService(EmailServiceImpl emailService) {
        this.emailService = emailService;
    }
}
