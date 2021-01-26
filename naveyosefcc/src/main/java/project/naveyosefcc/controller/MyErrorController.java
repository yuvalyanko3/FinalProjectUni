package project.naveyosefcc.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.web.bind.annotation.GetMapping;

public class MyErrorController implements ErrorController {

    @GetMapping("/error")
    public String getErrorPage() {
        return "error";
    }

    @Override
    public String getErrorPath() {
        return "/error";
    }
}
