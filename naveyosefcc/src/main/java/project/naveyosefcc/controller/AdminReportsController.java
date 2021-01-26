package project.naveyosefcc.controller;



import com.lowagie.text.*;
import com.lowagie.text.pdf.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import project.naveyosefcc.dto.StudentLessonsReportDTO;
import project.naveyosefcc.dto.TeacherLessonsReportDTO;
import project.naveyosefcc.dto.TeacherWorkHoursDTO;
import project.naveyosefcc.entity.SkillsForPerson;
import project.naveyosefcc.entity.Student;
import project.naveyosefcc.entity.Teacher;
import project.naveyosefcc.service.ReportsService;
import project.naveyosefcc.service.StudentService;
import project.naveyosefcc.service.TeacherService;
import utils.Common;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.LinkOption;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Array;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.List;



@Controller
public class AdminReportsController {
   private TeacherService teacherService;
   private ReportsService reportsService;
   private StudentService studentService;


    @GetMapping("/admin/reports")
    public String getReports(Model model) {
        AdminTeacherController.getTeachers(model, teacherService);
        List<Student> students = studentService.getAllStudents();
        model.addAttribute("students", students);
        return "admin/reports";
    }

    @PostMapping(value = "/admin/teacherLessonsReport", produces = "application/json")
    @ResponseBody
    public List<TeacherLessonsReportDTO> teacherLessonsReport(@RequestBody Map<String, String> rBody) {

        List<TeacherLessonsReportDTO> toReturn =  reportMethod(rBody);

        List<TeacherWorkHoursDTO> hours = new ArrayList<>();
        List<Object[]> objectsh = reportsService.teacherWorkHours(java.sql.Date.valueOf(rBody.get("startDate")),
                java.sql.Date.valueOf(rBody.get("endDate")),rBody.get("id"));
        if(!objectsh.isEmpty())
        {
            objectsh.forEach(o -> {
                hours.add(new TeacherWorkHoursDTO(java.sql.Date.valueOf(rBody.get("startDate")),
                        java.sql.Date.valueOf(rBody.get("endDate")),rBody.get("id"), o));
            });
        }

        //Creating Pdf Report
        try {
            //File name
            String name = String.valueOf(System.currentTimeMillis());

            //File time creation
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
            LocalDateTime now = LocalDateTime.now().plusHours(2);

            TeacherLessonsReportDTO[] array = toReturn.toArray(new TeacherLessonsReportDTO[toReturn.size()]);
            TeacherWorkHoursDTO[] hoursArray = hours.toArray(new TeacherWorkHoursDTO[hours.size()]);
            Teacher te = teacherService.findTeacherById(array[0].getTeacherId());

            //Pdf file creation and directory output
            Document document = new Document();

            //Saves the file in project directory
            String cwd = System.getProperty("user.dir");
            String reportsFolderPath = cwd+"/Reports/";
            String directory = reportsFolderPath+te.getFirstName()+" "+ te.getLastName()+"_"+array[0].getStartDate().toString()+"_"+array[0].getEndDate().toString()+".pdf";

            PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(directory));
            document.open();

            //Adding the content to the file
            document.add(new Paragraph((new Chunk(dtf.format(now)))));
            document.add(new Paragraph("\n"));
            PdfPTable table = new PdfPTable(3);
            table.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);

            //hebrew font
            String windowsPath = System.getenv("windir");
            BaseFont unicode = BaseFont.createFont(windowsPath+"/fonts/arial.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            Font hebrewFont = new Font(unicode, 12, Font.NORMAL);

            //teacher info column
            ColumnText column = new ColumnText(writer.getDirectContent());
            column.setSimpleColumn(36, 770, 569, 36);
            column.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);

            Paragraph teacherName = new Paragraph("שם מורה: "+te.getFirstName()+ " "+ te.getLastName(), hebrewFont);
            Paragraph teacherInfo = new Paragraph("תז מורה: "+ te.getId(), hebrewFont);

            teacherInfo.setAlignment(Element.ALIGN_CENTER);
            teacherName.setAlignment(Element.ALIGN_CENTER);
            column.addElement(teacherName);
            column.addElement(teacherInfo);
            column.go();

            document.add(new Paragraph("\n\n\n"));

            int k=0;
            while (k<array.length)
            {
                table.addCell(new PdfPCell(new Phrase("תאריך השיעור",hebrewFont)));
                table.addCell(new PdfPCell(new Phrase("שם תלמיד",hebrewFont)));
                table.addCell(new PdfPCell(new Phrase("שעת שיעור",hebrewFont)));

                for (int j=0;j<array.length;j++)
                {
                    table.addCell(new PdfPCell(new Phrase(array[j].getLessonDate())));
                    table.addCell(new PdfPCell(new Phrase(array[j].getPupilName(),hebrewFont)));
                    String sDate1=array[j].getLessonDate();
                    Date date1=new SimpleDateFormat("dd/MM/yyyy").parse(sDate1);
                    Time tst = fixTimeZone(date1,array[j].getLessonHour().toString());
                    table.addCell(new PdfPCell(new Phrase(tst.toString())));
                    k++;
                }

            }

            document.add(table);

            //total teached hours
            PdfPTable tableH = new PdfPTable(1);
            tableH.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);

            String startDateString = dateConverter(array[0].getStartDate());
            String endDateString = dateConverter(array[0].getEndDate());

            tableH.addCell(new PdfPCell(new Phrase("סך הכל שעות עבודה: "+hoursArray[0].getTotalHours()+"\n" +"בטווח התאריכים בין "+startDateString+" ל- "+endDateString ,hebrewFont)));
            document.add(tableH);

            document.close();
        }
        catch (Exception ArrayIndexOutOfBoundsException) {
           //System.out.println(ArrayIndexOutOfBoundsException.fillInStackTrace());
           // System.out.println("PDF CREATION FAILED");
        }
        //System.out.println("PDF CREATED!");

        return toReturn;
    }



    @PostMapping(value = "/admin/teacherSchedule", produces = "application/json")
    @ResponseBody
    public List<TeacherLessonsReportDTO> teacherSchedule(@RequestBody Map<String, String> rBody) {
        List<TeacherLessonsReportDTO> schedule =  reportMethod(rBody);
      //  System.out.println("SCHEDULE CREATED!");
        return schedule;
    }


    //Student Report
    @PostMapping(value = "/admin/StudentLessonsReport", produces = "application/json")
    @ResponseBody
    public List<StudentLessonsReportDTO> StudentLessonsReport(@RequestBody Map<String, String> rBody) {

        List<StudentLessonsReportDTO> toReturnList = studentReportMethod(rBody);

        //Creating Pdf Report
        try {
            //File name
            String name = String.valueOf(System.currentTimeMillis());

            //File time creation
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
            LocalDateTime now = LocalDateTime.now().plusHours(2);

            //Pdf file creation and directory output
            Document document = new Document();
            StudentLessonsReportDTO[] arrayst = toReturnList.toArray(new StudentLessonsReportDTO[toReturnList.size()]);

            //Saves the file in project directory
            // Path ProjectDirectory = Paths.get(""); old directoryPath
            String cwd = System.getProperty("user.dir");
            String reportsFolderPath = cwd+"/Reports/";
            String directory = reportsFolderPath+arrayst[0].getStudentName()+"_"+arrayst[0].getStartDate().toString()+"_"+arrayst[0].getEndDate().toString()+".pdf";

            PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(directory));
            document.open();

            //Adding the content to the file
            document.add(new Paragraph((new Chunk(dtf.format(now)))));
            document.add(new Paragraph("\n"));
            PdfPTable table = new PdfPTable(4);
            table.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);

            //hebrew font
            String windowsPath = System.getenv("windir");
            BaseFont unicode = BaseFont.createFont(windowsPath+"/fonts/arial.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            Font hebrewFont = new Font(unicode, 12, Font.NORMAL);

            //student info column
            ColumnText column = new ColumnText(writer.getDirectContent());
            column.setSimpleColumn(36, 770, 569, 36);
            column.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);

            Paragraph studentname = new Paragraph("שם הסטודנט: "+arrayst[0].getStudentName(), hebrewFont);
            Paragraph studentInfo = new Paragraph("תז הסטודנט: "+ arrayst[0].getStudentId(), hebrewFont);

            String program = arrayst[0].getProgram();
            if (program.equalsIgnoreCase("SAHAK"))
                program="שחק";
            else
                program="פרח";

            Paragraph studentprogram = new Paragraph("תוכנית התנדבות: "+ program, hebrewFont);

            studentInfo.setAlignment(Element.ALIGN_CENTER);
            studentname.setAlignment(Element.ALIGN_CENTER);
            studentprogram.setAlignment(Element.ALIGN_CENTER);
            column.addElement(studentname);
            column.addElement(studentInfo);
            column.addElement(studentprogram);
            column.go();

            document.add(new Paragraph("\n\n\n\n"));

            int k=0;
            while (k<arrayst.length)
            {
                table.addCell(new PdfPCell(new Phrase("תאריך השיעור",hebrewFont)));
                table.addCell(new PdfPCell(new Phrase("שעת התחלה",hebrewFont)));
                table.addCell(new PdfPCell(new Phrase("שעת סיום",hebrewFont)));
                table.addCell(new PdfPCell(new Phrase("סך שעות",hebrewFont)));

                for (int j=0;j<arrayst.length;j++)
                {
                    table.addCell(new PdfPCell(new Phrase(arrayst[j].getLessonDate())));
                    String sDate2=arrayst[j].getLessonDate();
                    Date date2=new SimpleDateFormat("dd/MM/yyyy").parse(sDate2);
                    Time ts = fixTimeZone(date2,arrayst[j].getStartHour().toString());
                    table.addCell(new PdfPCell(new Phrase(ts.toString())));
                    Time ts2 = fixTimeZone(date2,arrayst[j].getFinishHour().toString());
                    table.addCell(new PdfPCell(new Phrase(ts2.toString())));
                    table.addCell(new PdfPCell(new Phrase(arrayst[j].getTotalLessonTime().toString())));
                    k++;
                }

            }

            //Sum of total work time for student
            ArrayList<String> timestampsList  = new ArrayList<String>();
            for (int j=0;j<arrayst.length;j++)
            {
                String sDate2=arrayst[j].getLessonDate();
                Date date2=new SimpleDateFormat("dd/MM/yyyy").parse(sDate2);
               Time ts3 = fixTimeZone(date2,arrayst[j].getTotalLessonTime().toString());
                timestampsList.add(ts3.toString());
            }

            long tm = 0;
            for (String tmp : timestampsList){
                String[] arr = tmp.split(":");
                tm += Integer.parseInt(arr[2]);
                tm += 60 * Integer.parseInt(arr[1]);
                tm += 3600 * Integer.parseInt(arr[0]);
            }

            long hh = tm / 3600;
            tm %= 3600;
            long mm = tm / 60;
            tm %= 60;
            long ss = tm;

            PdfPTable tableHs = new PdfPTable(1);
            tableHs.setRunDirection(PdfWriter.RUN_DIRECTION_RTL);
            String startDateStringStudent = dateConverter(arrayst[0].getStartDate());
            String endDateStringStudent = dateConverter(arrayst[0].getEndDate());
            tableHs.addCell(new PdfPCell(new Phrase("סך הכל שעות התנדבות: "+(hh) + ":" + (mm) + ":" + (ss)+"\n" +"בטווח התאריכים בין "+startDateStringStudent+" ל- "+endDateStringStudent ,hebrewFont)));

            document.add(table);
            document.add(tableHs);

            document.close();
        }
        catch (Exception ArrayIndexOutOfBoundsException) {
         // System.out.println(ArrayIndexOutOfBoundsException.fillInStackTrace());
           // System.out.println("STUDENT PDF CREATION FAILED");
        }

      //  System.out.println("STUDENT PDF CREATED!");

            return toReturnList;
    }

    private List<StudentLessonsReportDTO> studentReportMethod(@RequestBody Map<String, String> rBody) {
        List<StudentLessonsReportDTO> toReturnList = new ArrayList<>();
        List<Object[]> objects = reportsService.StudentLessonsReport(java.sql.Date.valueOf(rBody.get("startDate")),
                 java.sql.Date.valueOf(rBody.get("endDate")), rBody.get("id"));
        if (!objects.isEmpty()) {
          objects.forEach(o -> {
               toReturnList.add(new StudentLessonsReportDTO(java.sql.Date.valueOf(rBody.get("startDate")),
                       java.sql.Date.valueOf(rBody.get("endDate")), rBody.get("id"), o));
           });
        }
        return toReturnList;
    }


    @Autowired
    public void setTeacherService(TeacherService teacherService) {
        this.teacherService = teacherService;
    }

    @Autowired
    public void setreportsService(ReportsService reportsService) {
        this.reportsService = reportsService;
    }

    @Autowired
    public void setStudentService(StudentService studentService) {
        this.studentService = studentService;
    }

    //fixing the timezone by -2 hours
    private static Time fixTimeZone(Date date,String hours) {
        Timestamp timestamp =
                Timestamp.valueOf(
                        new SimpleDateFormat("yyyy-MM-dd ")
                                .format(date) // get the current date as String
                                .concat(hours)        // and append the time
                );

//        System.out.println("Before change");
//        System.out.println(timestamp);

        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(timestamp.getTime());
        cal.setTimeInMillis(timestamp.getTime());
        cal.add(Calendar.HOUR, 0);
        timestamp = new Timestamp(cal.getTime().getTime());

        Time newTime = new Time(cal.getTime().getTime());

//        System.out.println("After change");
//        System.out.println(newTime);

        return newTime;
    }

    @PostMapping(value = "/admin/studentSchedule", produces = "application/json")
    @ResponseBody
    public List<StudentLessonsReportDTO> studentSchedule(@RequestBody Map<String, String> rBody) {
        List<StudentLessonsReportDTO> toReturnList = studentReportMethod(rBody);
     //   System.out.println("STUDENT SCHEDULE CREATED!");
        return toReturnList;
    }




    // Converting the date from yyyy-MM-dd to dd/MM/yyyy pattern
    public static String dateConverter(Date date) throws ParseException {
        final String OLD_FORMAT = "yyyy-MM-dd";
        final String NEW_FORMAT = "dd/MM/yyyy";

        String oldDateString = date.toString();
        String newDateString;

        SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
        Date d = sdf.parse(oldDateString);
        sdf.applyPattern(NEW_FORMAT);
        newDateString = sdf.format(d);

        return newDateString;
    }

    private List<TeacherLessonsReportDTO> reportMethod(@RequestBody Map<String, String> rBody) {
        List<TeacherLessonsReportDTO> toReturn = new ArrayList<>();
        List<Object[]> objects = reportsService.teacherLessonsReport(java.sql.Date.valueOf(rBody.get("startDate")),
                java.sql.Date.valueOf(rBody.get("endDate")),rBody.get("id"));
        if(!objects.isEmpty())
        {
            objects.forEach(o -> {
                toReturn.add(new TeacherLessonsReportDTO(java.sql.Date.valueOf(rBody.get("startDate")),
                        java.sql.Date.valueOf(rBody.get("endDate")),rBody.get("id"), o));
            });
        }
        return toReturn;
    }

}
