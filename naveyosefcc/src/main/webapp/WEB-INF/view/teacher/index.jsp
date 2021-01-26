<%--
  Created by IntelliJ IDEA.
  User: Yuval
  Date: 8/28/2019
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>מרכז למידה - מתנ"ס נווה יוסף</title>
    <!-- Bootstrap core CSS -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/css/carousel.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="/css/menucss.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Heebo">
    <style>
        .error{
            color: #ff5459;
            font-size: 12px;
        }

        .thDay {
            border: 8px solid white;
        }

        .thDate {
            background: #25aaed;
            color: white;
            font-weight: 300;
            letter-spacing: 1px;
            border: 8px solid white;
            padding: 15px 0 !important;
            font-size: 18px;
        }

        .nextLesson {
            background-color: #fafafa;
            box-shadow: 2px 2px 10px -5px #dedede;
            padding: 50px 0;
        }

        .container {
            position: relative;
            text-align: center;
            cursor: pointer;
            padding: 0 !important;
            margin-bottom: 9px;
        }

        .overlay {
            padding: 0px 15px;
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            height: 100%;
            width: 100%;
            opacity: 0;
            color: white;
            transition: .5s ease;
            background-color: #3f3f3f;
            font-size: 15px;
        }

        .container:hover .overlay {
            opacity: 1;
        }

         .hrNextLesson {
             background: white;
             width: 50%;
         }
    </style>
</head>
<body style="background-image: url('/images/bacg.png'); background-repeat: no-repeat; background-size: 100% auto; margin-top: -50px;" class="mh-100 min-vh-100">
<nav class="navbar navbar-dark bg-dark navbar-expand-md fixed-top" style="display: grid; grid-template-columns: 1fr 1fr 1fr 1fr 1fr 1fr 1fr; background-color: #6c757d; height: 70px;">
    <a class="navbar-brand"  style=" font-size: 16px; grid-area: auto / 8 / auto / auto; padding-right: 20px; border-right: 1px solid #ffffff;" data-toggle="modal" href="#changePassword">שינוי סיסמה </a>
    <a class="navbar-brand scheduleModal" style="font-size: 16px; margin-right: 18px; grid-area: 1 / 7 / auto / 8; text-align: right;" data-toggle="modal" href="#scheduleTeacher"  name="${teacherId}">מערכת שעות</a>
    <a class="navbar-brand" href="/logout_page" style="font-size: 16px; grid-area: 1 / 1 / 2 / 1; padding-left: 9px;">התנתקות</a>
    <span class="navbar float-left" style="color: #ffffff; font-size: 25px; text-align: right; height: -4px; margin-top: -12px; padding-bottom: -26px; margin-bottom: -12px; font-family: Heebo; grid-area: auto / 9 / auto / auto;" data-placement="right">שלום ${teacherName}</span>
</nav>

<!--<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark" style="display: grid; grid-template-columns: 1fr 1fr 1fr; background-color: #6c757d;">
    <a class="navbar-brand" href="/logout_page" style="font-size: 16px; grid-area: 1 / 1 / 2 / 1; padding-left: 9px;">התנתקות</a>
    <a class="navbar-brand" href="#" style="font-size: 16px; grid-area: 1 / 1 / 2 / 1; padding-left: 103px;"> חזרה לתפריט הראשי</a>
    <span class="navbar-brand float-left" style="font-size: 25px; grid-area: 1 / 3 / 2 / 4; text-align: right; height: -4px; margin-top: -12px; padding-bottom: -26px; margin-bottom: -12px;" data-placement="right">מורים</span>
</nav>
<nav class="navbar navbar-dark bg-dark navbar-expand-md fixed-top" style="display: grid; grid-template-columns: 1fr 1fr 1fr; background-color: #6c757d; height: 70px;">
    <a class="navbar-brand" href="/logout_page" style="font-size: 16px; grid-area: 1 / 1 / 2 / 1; padding-left: 9px;">התנתקות</a>
    <span class="navbar-brand float-left" style="font-size: 25px; grid-area: 1 / 3 / 2 / 4; text-align: right; height: -4px; margin-top: -12px; padding-bottom: -26px; margin-bottom: -12px; font-family: Heebo;" data-placement="right">,שלום ${teacherName}</span>-->
</nav>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
</div>
<!-- Marketing messaging and featurettes
================================================== -->
<!-- Wrap the rest of the page in another container to center all the content. -->
<div class="container marketing" style="padding-bottom: -22px; margin-bottom: -16px; margin-top: -14px; bottom: 2px;">
    <!-- Three columns of text below the carousel -->
    <!-- /.row -->
    <!-- START THE FEATURETTES -->
    <!-- /END THE FEATURETTES -->
    <!-- FOOTER -->
</div>
<div class="table-responsive" style="width: 1200px; margin-left: auto; margin-right: auto; margin-top: 130px; background-color: #ffffff; padding: 30px; box-shadow: 7px 7px 15px #000000;">
    <form dir="rtl" class="form-inline" style="padding-bottom: 30px;">
        <label style="font-size: 24px; margin-left: 20px; border-left: 1px solid #24292e;">
            <i class="fa fa-lg fa-inverse fa-book" style="color: #ffffff; border: 1px solid; padding: 12px 10px; border-radius: 100px; background: linear-gradient(to bottom, #05c1ed, #04a6ed);"></i>&nbsp;&nbsp;התלמידים שלך&nbsp; &nbsp;
        </label>
        <input class="form-control mr-sm-2" id="searchPupil" type="text" placeholder="&#xF002;&nbsp;&nbsp;חיפוש תלמיד/ה" aria-label="Search" style="font-family: Segoe UI, FontAwesome; font-size: 16px; text-align: right; height: 35px; width: 227px; margin-left: auto;">
    </form>
    <table class="table table-sm text-right" style="color: #3f3f3f; text-align: right; margin-bottom: 5px;">
        <thead style="text-align: right; flex-direction: row;">
        <tr style="background-color: #f6f8fa; color: #565f66;">
            <th style="text-align: center;">נתוני התקדמות</th>
            <th style="text-align: center;">גיליון שיעורים</th>
            <th>פרטי המורה בבי"ס</th>
            <th>בית ספר</th>
            <th>כיתה</th>
            <th>דוא"ל</th>
            <th>טלפון הורה</th>
            <th>טלפון תלמיד</th>
            <th>שם מלא</th>
        </tr>
        </thead>
        <c:forEach items="${students}" var="pupil">
            <tbody>
            <tr>
                <td style="text-align: center;"><a class="btn chartModal" role="button" style="border-radius: 100px; font-size: 16px; padding: 3px 8px;" target="_self" data-target="#openChartModal" data-toggle="modal" name="${pupil.id}" value="${teacherId}"><i class="fa fa-line-chart" style="color: #24292e;" ></i></a></td>
                <td style="text-align: center;"><a class="btn lessonSheet" role="button" style="border-radius: 100px; font-size: 16px; padding: 3px 8px;" target="_self" id="lessonsSheetModal" data-target="#lessonsSheet" data-toggle="modal" name="${pupil.firstName} ${pupil.lastName}" value="${pupil.id}"><i class="fa fa-file-text-o" style="color: #24292e;"></i></a></td>
                <td>${pupil.teacherSchoolName} : ${pupil.teacherPhone}</td>
                <td>${pupil.schoolName}</td>
                <td>${pupil.pupilClass}</td>
                <td>${pupil.email}</td>
                <td>${pupil.parentPhone}</td>
                <td>${pupil.phone}</td>
                <td> ${pupil.firstName} ${pupil.lastName}</td>
            </tr>
            </tbody>
        </c:forEach>
    </table>
</div>
<br>
<br>
<div class="table-responsive" style="width: 1200px; margin-left: auto; margin-right: auto; background-color: #ffffff; padding: 30px; box-shadow: 7px 7px 15px #000000;">
    <form dir="rtl" class="form-inline" style="padding-bottom: 30px;">
        <label style="font-size: 24px; margin-left: 20px; border-left: 1px solid #24292e;">
            <i class="fa fa-inverse fa-group" style="color: #ffffff; border: 1px solid; padding: 12px 11px; border-radius: 100px; background: linear-gradient(to bottom, #05c1ed, #04a6ed);"></i>&nbsp;&nbsp;שיעורי השבוע&nbsp; &nbsp;
        </label>התמקד/י על שיעור מסוים לקבלת תזכורת על השיעור הקודם.
    </form>
    <div id="nextLessons">
        <table class="table table-sm text-center" style="  margin-bottom: 0px;  " id="nextLessonsTable">
            <thead style="flex-direction: row;">
            <tr style="background-color: #f6f8fa; color: #565f66;  ">
                <th class="thDay">חמישי
                    </th>
                <th class="thDay">רביעי
                    </th>
                <th class="thDay">שלישי
                    </th>
                <th class="thDay">שני
                    </th>
                <th class="thDay">ראשון
                    </th>
            </tr>
            <tr>
                <th class="thDate">
                    <div id="date4"></div></th>
                <th class="thDate">
                    <div id="date3"></div></th>
                <th class="thDate">
                    <div id="date2"></div></th>
                <th class="thDate">
                    <div id="date1"></div></th>
                <th class="thDate">
                    <div id="date"></div></th>
            </tr>
            </thead>
            <tbody style="vertical-align: middle;">
            <tr>
                <td style="vertical-align: baseline; max-width: 90px;" id="thTw">
                    <c:forEach items="${nextLessons}" var="nextLesson">
                        <c:if test="${nextLesson.day == 'ה'}">
                            <div class="container">
                                <div class="nextLesson ">
                                    <br> ${nextLesson.startHour}
                                    <br> ${nextLesson.puFirstName} ${nextLesson.puLastName}
                                    <br> ${nextLesson.skill}
                                    <br>
                                    <br>
                                </div>
                                <div class="overlay" style="width: auto; ">
                                    <div>
                                        <br> ${nextLesson.puFirstName} ${nextLesson.puLastName}
                                        <br> ${nextLesson.skill}
                                        <br><hr class="hrNextLesson" style="width: 50%">
                                        ציון שיעור קודם: ${nextLesson.lastGrade}
                                        <br>:הערות
                                        <br> ${nextLesson.notes}
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </td>
                <td style="vertical-align: baseline; max-width: 90px;" id="weTw">
                    <c:forEach items="${nextLessons}" var="nextLesson">
                        <c:if test="${nextLesson.day == 'ד'}">
                            <div class="container">
                            <div class="nextLesson ">
                                <br> ${nextLesson.startHour}
                                <br> ${nextLesson.puFirstName} ${nextLesson.puLastName}
                                <br> ${nextLesson.skill}
                                <br>
                                <br>
                            </div>
                                <div class="overlay" style="width: auto;">
                                    <div>
                                     <br> ${nextLesson.puFirstName} ${nextLesson.puLastName}
                                     <br> ${nextLesson.skill}
                                     <br><hr class="hrNextLesson" style="width: 50%">
                                         ציון שיעור קודם: ${nextLesson.lastGrade}
                                     <br>:הערות
                                     <br> ${nextLesson.notes}
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </td>
                <td style="vertical-align: baseline; max-width: 90px;" id="tuTw">
                    <c:forEach items="${nextLessons}" var="nextLesson">
                        <c:if test="${nextLesson.day == 'ג'}">
                            <div class="container">
                                <div class="nextLesson ">
                                    <br> ${nextLesson.startHour}
                                    <br> ${nextLesson.puFirstName} ${nextLesson.puLastName}
                                    <br> ${nextLesson.skill}
                                    <br>
                                    <br>
                                </div>
                                <div class="overlay" style="width: auto;">
                                    <div>
                                        <br> ${nextLesson.puFirstName} ${nextLesson.puLastName}
                                        <br> ${nextLesson.skill}
                                        <br><hr class="hrNextLesson" style="width: 50%">
                                        ציון שיעור קודם: ${nextLesson.lastGrade}
                                        <br>:הערות
                                        <br> ${nextLesson.notes}
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </td>
                <td style="vertical-align: baseline; max-width: 90px;" id="moTw">
                    <c:forEach items="${nextLessons}" var="nextLesson">
                        <c:if test="${nextLesson.day == 'ב'}">
                            <div class="container">
                                <div class="nextLesson ">
                                    <br> ${nextLesson.startHour}
                                    <br> ${nextLesson.puFirstName} ${nextLesson.puLastName}
                                    <br> ${nextLesson.skill}
                                    <br>
                                    <br>
                                </div>
                                <div class="overlay" style="width: auto;">
                                    <div>
                                        <br> ${nextLesson.puFirstName} ${nextLesson.puLastName}
                                        <br> ${nextLesson.skill}
                                        <br><hr class="hrNextLesson" style="width: 50%">
                                        ציון שיעור קודם: ${nextLesson.lastGrade}
                                        <br>:הערות
                                        <br> ${nextLesson.notes}
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </td>
                <td style="vertical-align: baseline; max-width: 90px;" id="suTw">
                    <c:forEach items="${nextLessons}" var="nextLesson">
                        <c:if test="${nextLesson.day == 'א'}">
                            <div class="container">
                                <div class="nextLesson ">
                                    <br> ${nextLesson.startHour}
                                    <br> ${nextLesson.puFirstName} ${nextLesson.puLastName}
                                    <br> ${nextLesson.skill}
                                    <br>
                                    <br>
                                </div>
                                <div class="overlay" style="width: auto;">
                                    <div>
                                        <br> ${nextLesson.puFirstName} ${nextLesson.puLastName}
                                        <br> ${nextLesson.skill}
                                        <br><hr class="hrNextLesson" style="width: 50%">
                                        ציון שיעור קודם: ${nextLesson.lastGrade}
                                        <br>:הערות
                                        <br> ${nextLesson.notes}
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </td>
            </tr>
            </tbody>
            <script>  // find the dates of the week
                var dt = new Date()
                var currentWeekDay = dt.getDay();
                var lessDays = currentWeekDay == 0 ? 0 : currentWeekDay;
                var wkStart = new Date(new Date(dt).setDate(dt.getDate()-lessDays));
                var wk1 = new Date(new Date(wkStart).setDate(wkStart.getDate()+1));
                var wk2 = new Date(new Date(wkStart).setDate(wkStart.getDate()+2));
                var wk3 = new Date(new Date(wkStart).setDate(wkStart.getDate()+3));
                var wkEnd = new Date(new Date(wkStart).setDate(wkStart.getDate()+4));
                document.getElementById("date").innerHTML = wkStart.getDate() + "." + (wkStart.getMonth() + 1) + "." + wkStart.getFullYear();
                document.getElementById("date1").innerHTML = wk1.getDate() + "." + (wk1.getMonth() + 1) + "." + wk1.getFullYear();
                document.getElementById("date2").innerHTML = wk2.getDate() + "." + (wk2.getMonth() + 1) + "." + wk2.getFullYear();
                document.getElementById("date3").innerHTML = wk3.getDate() + "." + (wk3.getMonth() + 1) + "." + wk3.getFullYear();
                document.getElementById("date4").innerHTML = wkEnd.getDate() + "." + (wkEnd.getMonth() + 1) + "." + wkEnd.getFullYear();
            </script>
        </table>
    </div>
</div>
<%--<div class="table-responsive" style="width: 1200px; margin-left: auto; margin-right: auto; background-color: #ffffff; padding: 30px; box-shadow: 7px 7px 15px #000000;">--%>
<%--    <form dir="rtl" class="form-inline" style="padding-bottom: 30px;">--%>
<%--        <label style="font-size: 24px; margin-left: 20px; border-left: 1px solid #24292e;">--%>
<%--            <i class="fa fa-inverse fa-group" style="color: #ffffff; border: 1px solid; padding: 12px 11px; border-radius: 100px; background: linear-gradient(to bottom, #05c1ed, #04a6ed);"></i>&nbsp;&nbsp;שיעורים בשבוע הנוכחי&nbsp; &nbsp;--%>
<%--        </label>--%>

<%--    </form>--%>
<%--    <table class="table table-sm text-right" style="color: #3f3f3f; text-align: right; margin-bottom: 5px;">--%>
<%--        <thead style="text-align: right;">--%>
<%--        <tr style="background-color: #f6f8fa; color: #565f66;">--%>
<%--            <th>שעת מפגש</th>--%>
<%--            <th>שם התלמיד</th>--%>
<%--            <th>תאריך</th>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--        <c:forEach items="${TeacherSchedule}" var="weeklySchedule">--%>
<%--            <tbody>--%>
<%--            <tr>--%>
<%--                <td style="padding-right: 14px;">${weeklySchedule.lessonHour}</td>--%>
<%--                <td style="padding-right: 14px;">${weeklySchedule.pupilName}</td>--%>
<%--                <td style="padding-right: 14px;">${weeklySchedule.lessonDate}</td>--%>
<%--            </tr>--%>
<%--            </tbody>--%>
<%--        </c:forEach>--%>
<%--    </table>--%>
<%--</div>--%>
<!-- /.container -->
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->

<!-------------------------------------------------- CHART MODAL --------------------------------------------------------->
<div id="openChartModal" class="modal pg-show-modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLiveLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered carousel-fade modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header text-right text-xl-right text-lg-right text-md-right text-sm-right" style="text-align: right; background-color: #fafafa;">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"  style="padding-right: 14px; margin-left: -16px;">
                    <span aria-hidden="true">×</span>
                </button>
                <h5 class="modal-title" style="text-align: right; padding-right: 5px; margin-right: 7px; margin-left: auto; font-size: 22px; color: #565f66; font-family: Heebo; ">נתוני התקדמות
                    <i class="fa fa-line-chart" style="color: #bfc8cf; margin-left: 10px; font-size: 18px;"></i></h5>
            </div>
            <div dir="rtl" class="modal-body" style="padding-top: 2px; ">
                <h5 class="modal-title" id="exampleModalLiveLabel" style="margin-top: 10px; font-size: 12px; text-align: right;">&nbsp; הנתונים המוצגים מתייחסים אל ציוני התלמיד במקצועות הנלמדים.</h5>
                <canvas class="my-4 w-100 chartjs-render-monitor" id="myChart" style="display: block; height: 100px;"></canvas>
                <canvas class="my-4 w-100 chartjs-render-monitor" id="myChart2" style="display: block; height: 100px;"></canvas>
            </div>
        </div>
    </div>
</div>

<!-------------------------------------------------- CHANGE PASSWORD MODAL --------------------------------------------------------->
<form method="post" action="/changePassword" class="needs-validation" id="passForm" novalidate="">
<div id="changePassword" class="modal pg-show-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalPopoversLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
    <div class="text-right modal-dialog modal-dialog-centered carousel-fade" role="document">
        <div class="modal-content" style="padding-right: -102px;">
            <div class="modal-header text-right text-xl-right text-lg-right text-md-right text-sm-right" style="text-align: right; background-color: #fafafa;">
                <h5 class="modal-title" style="text-align: right; padding-right: 5px; margin-right: 7px; margin-left: auto; font-size: 22px; color: #565f66; font-family: Heebo; "> שינוי סיסמה<i class="fa fa-inverse fa-lock" style="color: #bfc8cf; margin-left: 10px; font-size: 18px;"></i></h5>
            </div>
            <div dir="rtl" class="modal-body" style="font-size: 14px; padding: 35px 30px 40px 20px;">
                <div class="form-row">
                    <div style="padding-left: 20px;" class="col-xl-8 text-right float-right">
                        <label>תעודת זהות</label>
                        <span id="idError" class="error"></span>
                        <input name="id" type="text" class="form-control text-right" id="teacherId" placeholder="תעודת זהות" required=""/>
                    </div>
                    <div style="padding-left: 20px; margin-top: 15px;" class="col-xl-8 text-right float-right">
                        <label>סיסמה חדשה</label>
                        <span id="passError" class="error"></span>
                        <input name="newPass" type="password" class="form-control text-right" id="newPassword" placeholder="הקלד/י סיסמה חדשה" required=""/>
                    </div>
                    <div style="padding-left: 20px; margin-top: 15px;" class="col-xl-8">
                        <label>אימות סיסמה</label>
                        <input name="reapetPass" type="password" class="form-control text-right" id="checkPassword" placeholder="אימות סיסמה" required=""/>
                    </div>
                </div>
                <span id="checkPassError" class="error"></span>
            </div>
            <div dir="rtl" class="modal-footer" style="background-color: #3f3f3f;">
                <button type="button" data-dismiss="modal" class="close" style="margin-left: auto; color: #ffffff; font-size: 16px; font-weight: lighter; opacity: 100%;">  סגירה ללא שמירה</button>
                <input type="submit"  class="btn btn-secondary" value="שמירה" style="border-radius: 100px; width: 90px;"/>
        </div>
    </div>
    </div>
</div>
</form>
<!-------------------------------------------------- MESSAGE MODAL --------------------------------------------------------------->
<div id="successMessage" class="modal pg-show-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalPopoversLabel"  data-keyboard="false" data-backdrop="static">
    <div class="text-right modal-lg modal-dialog modal-dialog-centered carousel-fade" role="document">
        <div class="modal-content">
            <div class="modal-header text-right text-xl-right text-lg-right text-md-right text-sm-right" style="text-align: right; background-color: #24292e;">
                <button type="button" class="close" onclick="closeSuccessMessage();" aria-label="Close" style="padding-right: 14px; margin-left: -16px;">
                    <span aria-hidden="true" style="color: #ffffff;" >×</span>
                </button>
                <h5 class="modal-title" id="massageLabel" style="text-align: right; padding-right: 2px; margin-right: 10px; margin-left: auto; font-size: 20px; color: #ffffff; font-family: Heebo;">! שינוי הסיסמה בוצע בהצלחה&nbsp;&nbsp;<i class="fa fa-check" style="color: #25aaed;"></i></h5>
            </div>
        </div>
    </div>
</div>
<!-------------------------------------------------- SCHEDULE MODAL --------------------------------------------------------------->
<div id="scheduleTeacher" class="modal pg-show-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalPopoversLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
    <div class="text-right modal-lg modal-dialog modal-dialog-centered carousel-fade" role="document">
        <div class="modal-content">
            <div class="modal-header text-right text-xl-right text-lg-right text-md-right text-sm-right" style="text-align: right; background-color: #fafafa;">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="padding-right: 14px; margin-left: -16px;">
                    <span aria-hidden="true">×</span>
                </button>
                <h5 class="modal-title" style="text-align: right; padding-right: 5px; margin-right: 7px; margin-left: auto; font-size: 22px; color: #565f66; font-family: Heebo; ">מערכת שעות
                    <i class="fa fa-inverse fa-table" style="color: #bfc8cf; margin-left: 10px; font-size: 18px;"></i></h5>
            </div>
            <div class="modal-body" style="font-size: 14px; padding: 30px;" id="scheduleDiv">
                <table class="table text-center" style="height: 350px; border: 2px solid #dee2e6; margin-bottom: 0px; background-color: #f7f7f7; box-shadow: 2px 2px 10px -5px #dedede;" id="scheduleTable">
                    <thead>
                    <tr>
                        <th style="border-left: 2px solid #dee2e6;">יום חמישי</th>
                        <th style="border-left: 2px solid #dee2e6;">יום רביעי</th>
                        <th style="border-left: 2px solid #dee2e6;">יום שלישי</th>
                        <th style="border-left: 2px solid #dee2e6;">יום שני</th>
                        <th style="border-left: 2px solid #dee2e6;">יום ראשון</th>
                        <th class="text-center" style="border-left: 2px solid #dee2e6;">שעה</th>
                    </tr>
                    </thead>
                    <tbody style="vertical-align: middle;">
                    <tr>
                        <td style="vertical-align: middle;" id="thTwo"></td>
                        <td style="vertical-align: middle; border-left: 2px solid #dee2e6;" id="weTwo"></td>
                        <td style="vertical-align: middle; border-left: 2px solid #dee2e6;" id="tuTwo"></td>
                        <td style="vertical-align: middle; border-left: 2px solid #dee2e6;" id="moTwo"></td>
                        <td style="vertical-align: middle; border-left: 2px solid #dee2e6;" id="suTwo"></td>
                        <td class="text-center font-weight-bold not-removed" style="vertical-align: middle; border-left: 2px solid #dee2e6;">14:00</td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle;" id="thThree"></td>
                        <td style="vertical-align: middle; border-left: 2px solid #dee2e6;" id="weThree"></td>
                        <td style="vertical-align: middle; border-left: 2px solid #dee2e6;" id="tuThree"></td>
                        <td style="vertical-align: middle; border-left: 2px solid #dee2e6;" id="moThree"></td>
                        <td style="vertical-align: middle; border-left: 2px solid #dee2e6;" id="suThree"></td>
                        <td class="text-center font-weight-bold not-removed" style="vertical-align: middle; border-left: 2px solid #dee2e6;">15:00</td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle;" id="thFour"></td>
                        <td style="vertical-align: middle; border-left: 2px solid #dee2e6;" id="weFour"></td>
                        <td style="vertical-align: middle; border-left: 2px solid #dee2e6;" id="tuFour"></td>
                        <td style="vertical-align: middle; border-left: 2px solid #dee2e6;" id="moFour"></td>
                        <td style="vertical-align: middle; border-left: 2px solid #dee2e6;" id="suFour"></td>
                        <td class="text-center font-weight-bold not-removed" style="vertical-align: middle; border-left: 2px solid #dee2e6;">16:00</td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle;" id="thFive"></td>
                        <td style="vertical-align: middle; border-left: 2px solid #dee2e6;" id="weFive"></td>
                        <td style="vertical-align: middle; border-left: 2px solid #dee2e6;" id="tuFive"></td>
                        <td style="vertical-align: middle; border-left: 2px solid #dee2e6;" id="moFive"></td>
                        <td style="vertical-align: middle; border-left: 2px solid #dee2e6;" id="suFive"></td>
                        <td class="text-center font-weight-bold not-removed" style="vertical-align: middle; border-left: 2px solid #dee2e6;">17:00</td>
                    <tr>
                        <td style="vertical-align: middle;" id="thSix"></td>
                        <td style="vertical-align: middle; border-left: 2px solid #dee2e6;" id="weSix"></td>
                        <td style="vertical-align: middle; border-left: 2px solid #dee2e6;" id="tuSix"></td>
                        <td style="vertical-align: middle; border-left: 2px solid #dee2e6;" id="moSix"></td>
                        <td style="vertical-align: middle; border-left: 2px solid #dee2e6;" id="suSix"></td>
                        <td class="text-center font-weight-bold not-removed" style="vertical-align: middle; border-left: 2px solid #dee2e6;">18:00</td>
<%--                    <tr>--%>
<%--                        <td style="vertical-align: middle;" id="thSeven"></td>--%>
<%--                        <td style="vertical-align: middle; border-left: 2px solid #dee2e6;" id="weSeven"></td>--%>
<%--                        <td style="vertical-align: middle; border-left: 2px solid #dee2e6;" id="tuSeven"></td>--%>
<%--                        <td style="vertical-align: middle; border-left: 2px solid #dee2e6;" id="moSeven"></td>--%>
<%--                        <td style="vertical-align: middle; border-left: 2px solid #dee2e6;" id="suSeven"></td>--%>
<%--                        <td class="text-center font-weight-bold not-removed" style="vertical-align: middle; border-left: 2px solid #dee2e6;">19:00</td>--%>
<%--                    </tr>--%>
                    </tr>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-------------------------------------------------- LESSON SHEET MODAL --------------------------------------------------------------->
<div id="lessonsSheet" class="modal pg-show-modal" dir="rtl" tabindex="-1" role="dialog" aria-labelledby="exampleModalPopoversLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
    <div class="text-right modal-lg modal-dialog modal-dialog-centered carousel-fade" role="document" style="max-width: 1200px!important;">
        <div class="modal-content">
            <div class="modal-header text-right text-xl-right text-lg-right text-md-right text-sm-right" dir="ltr" style="text-align: right; background-color: #fafafa;">
                <h5 class="modal-title" id="exampleModalPopoversLabel" style="text-align: right; padding-right: 5px; margin-right: 7px; margin-left: auto; font-size: 22px; color: #565f66; font-family: Heebo; "><label id="schPupilNameLabel" style="font-size:14px">שם תלמיד &nbsp&nbsp&nbsp</label>גיליון שיעורים
                    <i class="fa fa-file-text-o" style="color: #bfc8cf; margin-left: 10px; font-size: 18px;"></i></h5>
            </div>
            <div class="modal-body" style="font-size: 14px; padding: 30px;" id="lessonsDiv">
                <div class="scrollbar scrollbar-primary" dir="rtl" style=" height: 350px; overflow: auto; display: block;">
                <table class="table text-center" dir="ltr" style=" border: 2px solid #dee2e6; margin-bottom: 0px; background-color: #FCFCFC; " id="lessonsTable">
                    <thead>
                    <tr>
                        <th style="width: 350px; border-left: 2px solid #dee2e6;">הערות</th>
                        <th style="border-left: 2px solid #dee2e6;">ציון</th>
                        <th style="width: 350px; border-left: 2px solid #dee2e6;">תכני השיעור</th>
                        <th style="border-left: 2px solid #dee2e6;">נוכחות</th>
                        <th style="border-left: 2px solid #dee2e6;">תאריך</th>
                        <th style="border-left: 2px solid #dee2e6;">מקצוע</th>
                        <th class="text-center" style="border-left: 2px solid #dee2e6;">שיעור</th>
                    </tr>
                    </thead>
                    <tbody style="vertical-align: middle;" id="lessonBody">
                        </tbody>
                </table>
                </div>
                <br>
                <hr style="margin-left: 15px;"/>
                <div class="row">
                    <div class="col-md-4 mb-3" style="padding-left: 20px; font-weight: bold; font-size: 18px;">פרטי שיעור חדש
                    </div>
                </div>
                <form method="post" action="/common/addLesson" id="addLesson" style="max-width: 800px!important;">
                    <div class="form-row">
                        <div class="col-md-4 mb-3" style="padding-left: 20px; margin-left: auto;">
                            <label>מקצוע</label>
                            <span id="subjectError" class="error"></span>
                            <select dir="rtl" name="subject" class="custom-select mr-sm-2 float-left" id="lessonSubject">
                                <option selected="" value="def">בחירת מקצוע</option>
                                <option value="HEBREW">שפה</option>
                                <option value="MATHEMATICS">מתמטיקה</option>
                                <option value="ENGLISH">אנגלית</option>
                            </select>
                        </div>
                        <div class="col-md-4 mb-3" style="padding-left: 20px;">
                            <label>תאריך</label>
                            <span id="lessonDateError" class="error"></span>
                            <input type="date" name="lessonDate" class="form-control text-right" id="lessonDate"  />
                        </div>
                        <div class="col-md-4" style="padding-left: 20px;">
                            <label>נוכחות</label>
                            <select dir="rtl" name="lessonAtten" class="custom-select mr-sm-2 float-left" id="lessonAtten">
                                <option value="1">1 - נוכח</option>
                                <option value="2">2 - העדרות מוצדקת</option>
                                <option value="3">3 - העדרות לא מוצדקת</option>
                                <option value="4">4 - העדרות מורה</option>
                                <option value="5">5 - חג</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-2" style="padding-left: 20px;">
                            <label>ציון השיעור</label>
                            <select dir="rtl" name="lessonGrade" class="custom-select mr-sm-2 float-left" id="lessonGrade">
                                <option selected="" value="0">ציון</option>
                                <option value="10">10</option>
                                <option value="9">9</option>
                                <option value="8">8</option>
                                <option value="7">7</option>
                                <option value="6">6</option>
                                <option value="5">5</option>
                            </select>
                            <span id="lessonGradeError" class="error"></span>
                        </div>
                        <div class="col-md-10" style="padding-left: 20px; margin-left: auto;">
                            <label>תכני השיעור</label>
                            <span id="lessonDescError" class="error"></span>
                            <input type="text" name="lessonDesc" class="form-control text-right" id="lessonDesc" placeholder='נושאי לימוד, שימוש בעזרים, דגשים' />
                        </div>
                    </div>
                    <div class="form-row" style="margin-top:15px;">
                        <div class="col-md-12" style="padding-left: 20px; margin-left: auto;">
                            <label>הערות נוספות</label>
                            <span id="lessonNotesError" class="error"></span>
                            <input type="text" name="lessonNotes" class="form-control text-right" id="lessonNotes" placeholder='הערות נוספות בנוגע לשיעור' />
                        </div>
                    </div><br>
                </div>
                <div dir="rtl" class="modal-footer" style="background-color: #3b3f44; ">
                    <button type="button" data-dismiss="modal" class="close" style="margin-left: auto; color: #ffffff; font-size: 16px; font-weight: lighter; opacity: 100%;" onclick="clearForm()">  סגירה ללא שמירה</button>
                    <input type="submit" class="btn btn-secondary" style="border-radius: 100px; width: 90px;" value="שמירה"/>
                </div>
            </form>
        </div>
    </div>
</div>



<script src="//www.google-analytics.com/analytics.js"></script>
<script src="/js/jquery.min.js"></script>
<script src="/js/popper.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
<script src="/js/holder.min.js"></script>
<script src="/js/functions.js"></script>
<script>

    $("#addLesson").on('submit', function (e) {
        let form = $(this);
        let formData = {};
        if(!isValid())
        {
            e.preventDefault();
            return;
        }
        $.each(this, function (k, v) {
            let value = $(v);
            formData[value.attr("name")] = value.val();
        });
        formData["pId"] = window.pId;
        console.log(formData);
        e.preventDefault();
        $.ajax({
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            url: form.attr("action"),
            type: form.attr("method"),
            dataType: 'json',
            data: JSON.stringify(formData),
            success: function (response) {
                let formData = {};
                formData["pId"] = window.pId;
                populateLessonSheet(formData);
                clearForm();
            },
            error: function(jqXHR, textStatus, errorThrown){
            }
        });
    });

    function isValid() {
        let toReturn = true;
        if($("#lessonSubject").val() == "def")
        {
            toReturn = false;
            $("#subjectError").html("יש לבחור מקצוע");
        }
        if(!validateDate($("#lessonDate").val()))
        {
            toReturn = false;
            $("#lessonDateError").html("ערך לא תקין");
        }
        // if($("#lessonGrade").val() == "0")
        // {
        //     toReturn = false;
        //
        // }
        // if($("#lessonDesc").val() == "")
        //     toReturn = false;
        // if($("#lessonNotes").val() == "")
        //     toReturn = false;
        return toReturn;
    }

    function clearForm() {
            $("#lessonSubject").val("def");
            $("#lessonGrade").val("0");
            $("#lessonDate").val("");
            $("#lessonDateError").html("");
            $("#subjectError").html("");
            $("#lessonAtten").val("1");
            $("#lessonDesc").val("");
            $("#lessonNotes").val("");
        }

    $(".lessonSheet").on('click', function (e) {
       let teacherId = $("#teacherId").val();
        $("#schPupilNameLabel").html($(this).attr('name')+"&nbsp&nbsp&nbsp");
       let pupilId = $(this).attr("value");
       let formData = {};
       window.pId = pupilId;
       formData["pId"] = pupilId;
       e.preventDefault();
       populateLessonSheet(formData)
    });

    $("#passForm").on('submit', function (e) {
        var form = $(this);
        var formData = {};
        var id = $("#teacherId").val();
        var newPass = $("#newPassword").val();
        var repeatPass = $("#checkPassword").val();

        if(!changePass(id, newPass, repeatPass, true))
        {
            e.preventDefault();
            return false;
        }
        $.each(this, function (k, v) {
            var value = $(v);
            formData[value.attr("name")] = value.val();
        });
        e.preventDefault();
        $.ajax({
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            url: form.attr("action"),
            type: form.attr("method"),
            dataType: 'json',
            data: JSON.stringify(formData),
            success: function (response) {
                callBack(response);
            },
            error: function(jqXHR, textStatus, errorThrown){
            }
        });

    });

    function callBack(response) {
        if(response["response"] == "success")
        {
            $('#changePassword').modal('hide');
            $('#successMessage').modal('show');
        }
        else
        {
            alert("Something went wrong, please try again.");
        }
    }

    function closeSuccessMessage() {
        $('#successMessage').modal('hide');
    }

    function changePass(id, newPass, repeatPass, idRequired) {
        return isPassFormValid(id, newPass, repeatPass, idRequired)
    }

    $("#changePassword").on('hidden.bs.modal', function (e) {
        $("#idError").text("");
        $("#passError").text("");
        $("#checkPassError").text("");
        $("#teacherId").val("");
        $("#newPassword").val("");
        $("#checkPassword").val("");
    });

    $(".scheduleModal").on('click', function () {
        populateSchedule($(this).attr("name"));
    });

    function populateSchedule(id) {
        $.ajax({
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            url: "/teacher/getTeacher?id=" + id,
            type: 'GET',
            success: function (response) {
                setTeacherSchedule(response);
            },
            error: function(jqXHR, textStatus, errorThrown){
            }
        });
    }

    $(".chartModal").on('click', function () {
        populateChart($(this).attr("value"), $(this).attr("name"));
    });


    function populateChart(idTeacher, idPupil) {
        $.ajax({
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            url: "/teacher/getChartData?idT=" + idTeacher + "&idP=" + idPupil,
            type: 'GET',
            success: function (response) {

                setChart(response);
            },
            error: function(jqXHR, textStatus, errorThrown){
            }
        });
    }

    function setChart(response) {
        var ctx = document.getElementById("myChart");
        var ctx2 = document.getElementById("myChart2");
        var skills = new  Array();
        $.each(response, function (key, val) {
            if(!skills.includes(val['lessonType'])) {
                skills.push(val['lessonType']);
            }
        });
        if(skills.length!=0) {
        var dates1 = new Array();
        var grades1 = new Array();
        var dates2 = new Array();
        var grades2 = new Array();
        $.each(response, function (key, val) {
            if(val['lessonType']==skills[0]) {
                dates1.push(val['lessonDate']);
                grades1.push(val['score']);
            }
            else if (val['lessonType']==skills[1] && skills.length > 1) {
                dates2.push(val['lessonDate']);
                grades2.push(val['score']);
            }
        });
            ctx.style.display = "block";
        var myChart = new Chart(ctx, {
            type: 'line',

            data: {
                labels: dates1,
                datasets: [{
                    fill: true,
                    label: skills[0],
                    lineTension: 0,
                    backgroundColor: 'rgba(136,72,237,0.2)',
                    borderColor: 'rgb(136,72,237)',
                    borderWidth: 1,
                    pointBackgroundColor: 'rgb(136,72,237)',
                    data: grades1,

                }]
            },
            options: {
                responsive: true,
                scales: {
                    xAxes: [{
                        display: true,
                        scaleLabel: {
                            display: true,
                            labelString: 'תאריך שיעור'
                        }
                    }],
                    yAxes: [{
                        display: true,
                        ticks: {
                            max: 10,
                            min: 5,
                            stepSize: 1
                        },
                        scaleLabel: {
                            display: true,
                            labelString: 'ציון'
                        }
                    }]
                }
            }
        });
        }
        else {
           ctx.style.display = "none";
        }
        if (skills.length!=0 && dates2.length!=0 && grades2.length!=0) {
            ctx2.style.display = "block";
            var myChart2 = new Chart(ctx2, {
                type: 'line',
                data: {
                    labels: dates2,
                    datasets: [{
                        fill: true,
                        label: skills[1],
                        lineTension: 0,
                        backgroundColor: 'rgb(62,237,101,0.2)',
                        borderColor: 'rgb(62,237,101)',
                        borderWidth: 1,
                        pointBackgroundColor: 'rgb(62,237,101)',
                        data: grades2,
                    }]
                },
                options: {
                    responsive: true,
                    scales: {
                        xAxes: [{
                            display: true,
                            scaleLabel: {
                                labelString: 'תאריך שיעור'
                            }
                        }],
                        yAxes: [{
                            display: true,
                            ticks: {
                                max: 10,
                                min: 5,
                                stepSize: 1
                            },
                            scaleLabel: {
                                labelString: 'ציון'
                            }
                        }]
                    }
                }

            });
        }
        else {
            ctx2.style.display = "none";
        }
    }






    $('#searchPupil').keyup(function(){
        // Search Text
        var search = $(this).val();

        // Hide all table tbody rows
        $('table tbody tr').hide();

        // Count total search result
        var len = $('table tbody tr:not(.notfound) td:contains("'+search+'")').length;

        if(len > 0){
            // Searching text in columns and show match row
            $('table tbody tr:not(.notfound) td:contains("'+search+'")').each(function(){
                $(this).closest('tr').show();
            });
        }else{
            $('.notfound').show();
        }

    });
    // Case-insensitive searching (Note - remove the below script for Case sensitive search )
    $.expr[":"].contains = $.expr.createPseudo(function(arg) {
        return function( elem ) {
            return $(elem).text().toUpperCase().indexOf(arg.toUpperCase()) >= 0;
        };
    });

</script>
</body>
</html>
