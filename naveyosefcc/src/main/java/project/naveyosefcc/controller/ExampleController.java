/*package project.naveyosefcc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import project.naveyosefcc.dto.ExampleDTO;
import project.naveyosefcc.entity.TeacherStudents;
import project.naveyosefcc.service.ExampleService;
import project.naveyosefcc.service.TeacherStudentsService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ExampleController {

    private ExampleService exampleService;
    private TeacherStudentsService teacherStudentsService;

    @GetMapping("/admin/example")
    public String getExample(Model model) {
        HashMap<String, List<ExampleDTO>> map = buildDTOs(teacherStudentsService.getAll());
        model.addAttribute("map", map);
        return "admin/example";
    }

    private HashMap<String, List<ExampleDTO>> buildDTOs(List<TeacherStudents> teacherStudents){
        HashMap<String, List<ExampleDTO>> toReturn = new HashMap<>();
        teacherStudents.forEach(i -> {
            List<ExampleDTO> dtos = new ArrayList<>();
            List<Object[]> objects = exampleService.getObjects(i.getTeacher().getId(), i.getTeacher().getId());
            objects.forEach(o -> {
                dtos.add(new ExampleDTO(i.getTeacher().getId(), o));
            });
            if(!dtos.isEmpty())
                toReturn.put(i.getTeacher().getId(), new ArrayList<>(dtos));
        });
        return toReturn;
    }




  /*  @PostMapping(value = "/admin/processExample", produces = "application/json")
    @ResponseBody
    public List<ExampleDTO> postExample() {
        List<ExampleDTO> toReturn = new ArrayList<>();
        List<TeacherStudents> teacherStudents = teacherStudentsService.getAll();
        teacherStudents.forEach(i -> {
            List<ExampleDTO> dtos = new ArrayList<>();
            List<Object[]> objects = exampleService.getObjects(i.getTeacher().getId());
            if (!objects.isEmpty()) {
                objects.forEach(o -> {
                    toReturn.add(new ExampleDTO(i.getTeacher().getId(), o));
                });
            }
        });
                return toReturn;
            }

            @Autowired
            public void setExampleService (ExampleService exampleService){
                this.exampleService = exampleService;
            }

            @Autowired
            public void setTeacherStudentsService (TeacherStudentsService teacherStudentsService){
                this.teacherStudentsService = teacherStudentsService;
            }
        }*/