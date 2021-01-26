package utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.RequestBody;
import project.naveyosefcc.entity.*;
import project.naveyosefcc.service.EmailServiceImpl;
import project.naveyosefcc.service.PersonService;
import project.naveyosefcc.service.UsersService;

import java.sql.Time;
import java.time.Duration;
import java.util.*;

public class Common {

    private PersonService personService;
    private PasswordEncoder passwordEncoder;

    /**
     * Helper method that sets the hebrew name of each skill.
     * @param skills
     */
    public static void setHebrewName(Set<SkillsForPerson> skills){
        Iterator<SkillsForPerson> iterator = skills.iterator();
        while(iterator.hasNext())
        {
            Skill s = iterator.next().getSkill();
            if(s.getName().equalsIgnoreCase("english"))
                s.setHebrewName(E_Skills.ENGLISH.getName());
            else if(s.getName().equalsIgnoreCase("mathematics"))
                s.setHebrewName(E_Skills.MATHEMATICS.getName());
            else if(s.getName().equalsIgnoreCase("hebrew"))
                s.setHebrewName(E_Skills.HEBREW.getName());
        }
    }

    public static void addSkills(String id, Map<String, String> map, PersonService personService){
        if(map.containsKey("heb"))
            personService.addSkill(id, E_Skills.HEBREW.name(), Integer.parseInt(map.get("heb")));
        if(map.containsKey("eng"))
            personService.addSkill(id, E_Skills.ENGLISH.name(), Integer.parseInt(map.get("eng")));
        if(map.containsKey("math"))
            personService.addSkill(id, E_Skills.MATHEMATICS.name(), Integer.parseInt(map.get("math")));

    }

    public static void addPrefDays(String id, Map<String, String> map, PersonService personService) {

        Arrays.asList(E_Days.values()).forEach(day -> {
            String d = day.name().toLowerCase();
            if(map.containsKey(d))
            {
                String[] time = map.get(d).split(",");
                personService.addPrefDay(id, day.getDay(), convertTime(time[0].split(":")),
                        convertTime(time[1].split(":")));
            }
        });
    }

    public static void setLoginProperties(Person person, E_Roles role, UsersService usersService, PasswordEncoder passwordEncoder,
                                          EmailServiceImpl emailService) {
        String pass = PasswordGenerator.getPassword();
        usersService.addUser(person.getId(), passwordEncoder.encode(pass));
        usersService.addAuthorities(person.getId(), role.name());
        emailService.sendMail("granovsky2424@gmail.com", "הרשמה למרכז קהילתי נווה יוסף",
                Consts.getEmailTemplate(person.getLastName() + " " + person.getFirstName(), pass));
    }

    public static Time convertTime(String[] time){
        Duration duration = Duration.ofMinutes((Integer.parseInt(time[0]) * 60) + Integer.parseInt(time[1]));
        return new Time(duration.toMillis());
    }

    /**
     * Helper method. Returns a list of students for a specific teacher.
     * @param list
     * @return List of students
     */
    public static List<Pupil> getPupilList(List<TeacherStudents> list){
        List<Pupil> toReturn = new ArrayList<>();
        Iterator<TeacherStudents> iterator = list.iterator();
        while(iterator.hasNext())
            toReturn.add(iterator.next().getPupil());
        return toReturn;
    }

    public static Set<Pupil> getPupilSet(List<TeacherStudents> list) {
        Set<Pupil> toReturn = new HashSet<>();
        list.forEach(i -> toReturn.add(i.getPupil()));
        return toReturn;
    }
}
