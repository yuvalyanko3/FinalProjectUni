package project.naveyosefcc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SecurityController {

    @GetMapping("/login_page")
    public String getLoginPage() {
        return "login_page";
    }

}
