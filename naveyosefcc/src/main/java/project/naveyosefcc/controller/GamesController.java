package project.naveyosefcc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;



@Controller
public class GamesController {

    @GetMapping("/games/sudoku")
    public String getSudoku() {
        return "games/sudoku";
    }

}
