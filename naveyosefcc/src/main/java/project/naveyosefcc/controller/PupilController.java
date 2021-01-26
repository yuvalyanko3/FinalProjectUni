package project.naveyosefcc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import project.naveyosefcc.config.SecurityConfig;
import project.naveyosefcc.dto.TeacherPupilSheetDTO;
import project.naveyosefcc.service.LessonService;
import project.naveyosefcc.service.PupilService;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class PupilController {

    private LessonService lessonService;
    private PupilService pupilService;

    @PostMapping(value = "/common/lessonSheet", produces = "application/json")
    @ResponseStatus(value = HttpStatus.OK)
    @ResponseBody
    public List<TeacherPupilSheetDTO> getLessonSheet(@RequestBody Map<String, String> map) {
        List<TeacherPupilSheetDTO> toReturn = new ArrayList<>();
        String teacherId = SecurityConfig.getCurrentUser();
        List<Object[]> objects = lessonService.getTeacherPupilLessons(teacherId, map.get("pId"));
        objects.forEach(o -> {
            toReturn.add(new TeacherPupilSheetDTO(o));
        });
        return toReturn;
    }

    @PostMapping(value = "/common/addLesson", produces = "application/json")
    @ResponseStatus(value = HttpStatus.OK)
    @ResponseBody
    public String addLesson(@RequestBody Map<String, String> map) throws JSONException {
        String toReutrn = "success";
        String teacherId = SecurityConfig.getCurrentUser();
        String pupilId = map.get("pId");
        Integer lessonId = lessonService.getLastLessonId(teacherId, pupilId) + 1;
        lessonService.addLesson(lessonId, teacherId, pupilId, map.get("subject"),
                                Date.valueOf(map.get("lessonDate")), Integer.parseInt(map.get("lessonAtten")), map.get("lessonDesc"),
                                Integer.parseInt(map.get("lessonGrade")), map.get("lessonNotes"));
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("response", toReutrn);
        return jsonObject.toString();
    }


    public void updatePupil(Map<String, String> map) {
        pupilService.updatePupil(map.get("id"), map.get("parentPhone"), map.get("pupilClass"), map.get("school"),
                map.get("schoolTeacher"), map.get("phoneTeacher"));
    }

    @Autowired
    public void setLessonService(LessonService lessonService) {
        this.lessonService = lessonService;
    }


    @Autowired
    public void setPupilService(PupilService pupilService) {
        this.pupilService = pupilService;
    }
}
