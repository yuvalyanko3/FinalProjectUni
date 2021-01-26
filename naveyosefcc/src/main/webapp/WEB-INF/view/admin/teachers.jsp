<%@ page import="java.util.ArrayList" %>
<%@ page import="project.naveyosefcc.entity.Skill" %>
<%@ page import="project.naveyosefcc.entity.SkillsForPerson" %><%--
  Created by IntelliJ IDEA.
  User: Yuval
  Date: 8/17/2019
  Time: 20:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
    <link href="/css/menucss.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Heebo:100,300,400,500,700,800,900&subset=hebrew,latin">
    <style>
        .error{
            color: #ff5459;
            font-size: 12px;
        }

        /* width */
        ::-webkit-scrollbar {
            width: 6px;
        }

        /* Track */
        ::-webkit-scrollbar-track {
            background: #f1f1f1;
            opacity: 0%;
        }

        /* Handle */
        ::-webkit-scrollbar-thumb {
            background: #25aaed;
        }

        /* Handle on hover */
        ::-webkit-scrollbar-thumb:hover {
            background: #63bdff;
        }
    </style>
</head>
<body style="background-color: #f7f7f7; margin-top: -50px;" class="mh-100 min-vh-100">
<nav class="navbar navbar-dark bg-dark navbar-expand-md fixed-top" style="display: grid; height: 60px; grid-template-columns: 1fr 1fr 1fr; background-color: #6c757d;">
    <a class="navbar-brand" href="/logout_page" style="font-size: 16px; grid-area: 1 / 1 / 2 / 1; padding-left: 9px;">התנתקות</a>
    <a class="navbar-brand" href="/admin/index" style="font-size: 16px; grid-area: 1 / 1 / 2 / 1; padding-left: 103px;"> חזרה לתפריט הראשי</a>
    <span class="navbar float-left" style="font-size: 30px; grid-area: 1 / 3 / 2 / 4; text-align: right; margin-top: -12px; padding-bottom: -26px; margin-bottom: -12px; margin-left: auto; font-family: Heebo; color: #ffffff;" data-placement="right">מורים ומורות</span>
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
<div class="table-responsive" style="width: auto; margin-left: auto; margin-right: auto; background-color: #32beed; padding-right: 24px; margin-top: 0; padding-top: 25px; padding-bottom: 14px;">
    <form class="form-inline my-2 my-lg-0" style="float: right; color: #ffffff; margin-right: 10px;">
        <a class="btn btn-secondaryAdd" data-target="#addTeacherModal" data-toggle="modal" role="button" style="border-radius: 100px; width: 35px; font-size: 16px; margin-right: 14px; height: 35px;" target="_self"><i class="fa text-light fa-plus fa-2x" style="margin-left:-2px; color: #24292e; font-size: 18px; "></i></a><label>הוספת מורה חדש/ה</label>
    </form>
    <form class="form-inline my-2 my-lg-0" style="float: right; color: #ffffff; margin-right: 25px; padding-right: 20px; border-right: 1px solid #ffffff;">
        <!--<a class="btn btn-secondary" role="button" style="border-radius: 100px; width: 40px; font-size: 16px; margin-right: 14px; height: 40px;" target="_self"><i class="fa text-light fa-search" style="color: #24292e;"></i></a>-->
        <input class="form-control mr-sm-2" id="searchTeacher" type="text" placeholder="&#xF002;&nbsp;&nbsp;חיפוש מורה" aria-label="Search" style="font-family: Segoe UI, FontAwesome; font-size: 16px; text-align: right; height: 35px; width: 227px; margin-left: auto;">
    </form>

</div>
<div class="table-responsive scrollbar scrollbar-primary" style="overflow: auto; width: 1400px; margin-left: auto; margin-right: auto; padding-top: 44px;">
    <table class="table table-sm text-right" id="teachersTable" style="color: #3f3f3f; text-align: right;">
        <thead style="text-align: right; flex-direction: row;">
        <tr style="background-color: #eff1f3; color: #565f66;">
            <th style="text-align: center;">פרטים נוספים</th>
            <th style="text-align: center;">מערכת שעות</th>
            <th>מקצוע</th>
            <th>דוא"ל</th>
            <th>טלפון</th>
            <th style="padding-right: 14px;">שם מלא</th>
        </tr>
        </thead>
        <c:forEach items="${teachers}" var="student">
            <tbody id="myTable">
            <tr>
                <td style="text-align: center;"><a class="btn updateModal" role="button" style="border-radius: 100px; font-size: 16px; padding: 3px 8px;" target="_self" data-target="#teacherInfoModal" data-toggle="modal" name="${student.id}"><i class="fa fa-edit" style="color: #24292e;"></i></a></td>
                <td style="text-align: center;"><a class="btn scheduleModal" role="button" style="border-radius: 100px; font-size: 16px; padding: 3px 8px;" data-target="#scheduleTeacher" data-toggle="modal" value="${student.lastName} ${student.firstName}" name="${student.id}" target="_self"><i class="fa fa-table" style="color: #24292e;"></i></a></td>
                <td>
                    <c:forEach items="${student.skills}" var="skill">
                        <span> ${skill.skill.hebrewName} &nbsp;-</span>
                    </c:forEach>
                </td>
                <td>${student.email}</td>
                <td>${student.phone}</td>
                <td style="padding-right: 14px;">${student.lastName} ${student.firstName}</td>
            </tr>
            </tbody>
        </c:forEach>
    </table>
</div>

<%--<----------------------------------------------ADD TEACHER MODAL (add new)------------------------------------------------------------>--%>
<form class="needs-validation" novalidate="" dir="rtl" method="post" action="/admin/addTeacher" id="add" modelAttribute="skillCon">
    <div id="addTeacherModal" class="modal pg-show-modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalPopoversLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
        <div class="modal-dialog text-right modal-dialog-centered modal-lg" role="document">
            <div class="modal-content" style="padding-right: -102px;">
                <div class="modal-header text-right text-xl-right text-lg-right text-md-right text-sm-right" style="text-align: right; background-color: #fafafa;">
                    <h5 class="modal-title" id="exampleModalPopoversLabel" style="text-align: right; padding-right: 5px; margin-right: 7px; margin-left: auto; font-size: 22px; color: #565f66; font-family: Heebo; ">
                        <i class="fa fa-inverse fa-plus" style="color: #bfc8cf; margin-left: 10px; font-size: 18px;"></i>הוספת מורה חדש/ה</h5>
                </div>
                <div class="modal-body" style="padding-right: 28px; padding-left: 20px; font-size: 14px;">
                    <p>
                    <div class="form-row">
                        <div class="col-md-4 mb-3" style="padding-left: 20px;">
                            <label>שם משפחה</label>
                            <span id="lastError" class="error"></span>
                            <input type="text" name="lastName" class="form-control text-right" id="teacherLastName" placeholder="שם משפחה"/>
                        </div>
                        <div class="col-md-4 mb-3" style="padding-left: 20px;">
                            <label>שם פרטי</label>
                            <span id="firstError" class="error"></span>
                            <input type="text" name="firstName" class="form-control text-right" id="teacherFirstName" placeholder="שם פרטי"/>
                        </div>
                        <div class="col-md-4 mb-3" style="padding-left: 20px;">
                            <label>תעודת זהות</label>
                            <span id="idError" class="error"></span>
                            <input type="text" name="id" class="form-control text-right" id="teacherID" placeholder="תעודת זהות" aria-describedby="inputGroupPrepend"/>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-4 mb-3" style="padding-left: 20px;">
                            <label>דוא"ל</label>
                            <span id="emailError" class="error"></span>
                            <input type="text" name="email" class="form-control text-right" id="teacherMail" placeholder="כתובת דואר אלקטרוני"/>
                        </div>
                        <div class="col-md-4 mb-3" style="padding-left: 20px;">
                            <label>טלפון</label>
                            <span id="phoneError" class="error"></span>
                            <input type="text" name="phone" class="form-control text-right" id="teacherPhone" placeholder="מספר טלפון" />
                        </div>
                        <div class="col-md-4 mb-3" style="padding-left: 20px;">
                            <label>תאריך לידה</label>
                            <span id="dateError" class="error"></span>
                            <input type="date" name="birthDate" class="form-control" id="teacherDate" placeholder="Zip" />
                        </div>
                        <div class="col-md-4 mb-3" style="padding-left: 20px; margin-left: auto;">
                            <label>מין</label>
                            <span id="genderError" class="error"></span>
                            <select dir="rtl" name="gender" class="custom-select mr-sm-2 float-left" id="teacherGender">
                                <option selected="" value="def">בחירת מין</option>
                                <option value="F">נקבה</option>
                                <option value="M">זכר</option>
                            </select>
                        </div>
                    </div>
    <%--            </form></p>--%>
                    <hr style="margin-left: 15px;"/>
<%--                    <form:form method="post" action="/admin/addTeacher" modelAttribute="skillCon" dir="rtl" class=" orm-inline">--%>
                        <div class="row">
                            <div class="col-md-4 mb-3" style="padding-left: 20px; font-weight: bold; font-size: 18px;">מקצועות לימוד
                            <span id="subjectError" class="error" style="font-weight: normal;"></span></div>
                        </div>
                        <div class="form-row">
                            <div class="mb-3 col-md-3" style="padding-left: 20px;">
                                <input class="form-check-input" type="checkbox" id="hebCheck" name="skills[]" value="heb"/>
                                <label style="font-size: 17px; line-height: 20px; text-indent: 25px;">שפה</label>
                                <select dir="rtl" class="custom-select" id="hebrewLevel">
                                    <option selected="" value="def">רמת לימוד</option>
                                    <option value="5">5</option>
                                    <option value="4">4</option>
                                    <option value="3">3</option>
                                </select>
                            </div>

                            <div class="mb-3 col-md-3" style="padding-left: 20px;">
                                <input class="form-check-input" type="checkbox" id="mathCheck" name="skills[]" value="math"/>
                                <label style="font-size: 17px; line-height: 20px; text-indent: 25px;">מתמטיקה</label>
                                <select dir="rtl" class="custom-select" id="mathLevel">
                                    <option selected="" value="def">רמת לימוד</option>
                                    <option value="5">5</option>
                                    <option value="4">4</option>
                                    <option value="3">3</option>
                                </select>
                            </div>
                            <div class="mb-3 col-md-3" style="padding-left: 20px;">
                                <input class="form-check-input" type="checkbox" id="engCheck" name="skills[]" value="eng"/>
                                <label style="font-size: 17px; line-height: 20px; text-indent: 25px;">אנגלית</label>
                                <select dir="rtl" class="custom-select" id="engLevel">
                                    <option selected="" value="def">רמת לימוד</option>
                                    <option value="5">5</option>
                                    <option value="4">4</option>
                                    <option value="3">3</option>
                                </select>
                            </div>
                        </div>
<%--                    </form:form>--%>
                    <hr style="margin-left: 15px;"/>
    <%--                <form dir="rtl" class=" orm-inline">--%>
                        <div class="row">
                            <div class="col-md-4 mb-3" style="padding-left: 20px; font-weight: bold; font-size: 18px;">ימי עבודה
                            <span id="daysError" class="error" style="font-weight: normal;"></span></div>
                        </div>
                        <div class="form-row">
                            <div class="mb-3 col-md-3" style="padding-left: 20px;">
                                <input class="form-check-input" type="checkbox" id="sundayCheck" name="days" value="sunday">
                                <label style="font-size: 17px; line-height: 20px; text-indent: 25px;">ראשון</label>
                                <span id="suError" class="error"></span>
                                <br>
                                <div class="input-group-prepend">
                                    <div class="input-group-prepend">
                                        <div class="input-group-prepend" style="margin-top: 8px;">
                                            <label style="padding-left: 13px; padding-top: 9px; font-size: 16px;">משעה:</label>
                                            <input type="time" class="form-control" id="suStart" placeholder="" min="14:00:00" max="19:00:00">
                                        </div>
                                    </div>
                                </div>
                                <div class="input-group-prepend">
                                    <div class="input-group-prepend" style="margin-top: 8px;">
                                        <label style="padding-left: 39px; padding-top: 9px; font-size: 16px;">עד:</label>
                                        <input type="time" class="form-control" id="suFinish" placeholder=""  style="margin-left: auto;" min="14:00:00" max="19:00:00">
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3 col-md-3" style="padding-left: 20px;">
                                <input class="form-check-input" type="checkbox" id="mondayCheck" name="days" value="monday">
                                <label style="font-size: 17px; line-height: 20px; text-indent: 25px;">שני</label>
                                <span id="moError" class="error"></span>
                                <br>
                                <div class="input-group-prepend">
                                    <div class="input-group-prepend">
                                        <div class="input-group-prepend" style="margin-top: 8px;">
                                            <label style="padding-left: 13px; padding-top: 9px; font-size: 16px;">משעה:</label>
                                            <input type="time" class="form-control" id="moStart" placeholder="" min="14:00:00" max="19:00:00">
                                        </div>
                                    </div>
                                </div>
                                <div class="input-group-prepend">
                                    <div class="input-group-prepend" style="margin-top: 8px;">
                                        <label style="padding-left: 39px; padding-top: 9px; font-size: 16px;">עד:</label>
                                        <input type="time" class="form-control" id="moFinish" placeholder=""  style="margin-left: auto;" min="14:00:00" max="19:00:00">
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3 col-md-3" style="padding-left: 20px; margin-left: 4px;">
                                <input class="form-check-input" type="checkbox" id="tuesdayCheck" name="days" value="tuesday">
                                <label style="font-size: 17px; line-height: 20px; text-indent: 25px;">שלישי</label>
                                <span id="tuError" class="error"></span>
                                <br>
                                <div class="input-group-prepend">
                                    <div class="input-group-prepend">
                                        <div class="input-group-prepend" style="margin-top: 8px;">
                                            <label style="padding-left: 13px; padding-top: 9px; font-size: 16px;">משעה:</label>
                                            <input type="time" class="form-control" id="tuStart" placeholder="" min="14:00:00" max="19:00:00">
                                        </div>
                                    </div>
                                </div>
                                <div class="input-group-prepend">
                                    <div class="input-group-prepend" style="margin-top: 8px;">
                                        <label style="padding-left: 39px; padding-top: 9px; font-size: 16px;">עד:</label>
                                        <input type="time" class="form-control" id="tuFinish" placeholder="" rstyle="margin-left: auto;" min="14:00:00" max="19:00:00">
                                    </div>
                                </div>
                                <br>
                            </div>
                            <div class="mb-3 col-md-3" style="padding-left: 20px;">
                                <input class="form-check-input" type="checkbox" id="wednesdayCheck" name="days" value="wednesday">
                                <label style="font-size: 17px; line-height: 20px; text-indent: 25px;">רביעי</label>
                                <span id="weError" class="error"></span>
                                <br>
                                <div class="input-group-prepend">
                                    <div class="input-group-prepend">
                                        <div class="input-group-prepend" style="margin-top: 8px;">
                                            <label style="padding-left: 13px; padding-top: 9px; font-size: 16px;">משעה:</label>
                                            <input type="time" class="form-control" id="weStart" placeholder="" min="14:00:00" max="19:00:00">
                                        </div>
                                    </div>
                                </div>
                                <div class="input-group-prepend">
                                    <div class="input-group-prepend" style="margin-top: 8px;">
                                        <label style="padding-left: 39px; padding-top: 9px; font-size: 16px;">עד:</label>
                                        <input type="time" class="form-control" id="weFinish" placeholder=""  style="margin-left: auto;" min="14:00:00" max="19:00:00">
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3 col-md-3" style="padding-left: 20px;">
                                <input class="form-check-input" type="checkbox" id="thursdayCheck" name="days" value="thursday">
                                <label style="font-size: 17px; line-height: 20px; text-indent: 25px;">חמישי</label>
                                <span id="thError" class="error"></span>
                                <br>
                                <div class="input-group-prepend">
                                    <div class="input-group-prepend">
                                        <div class="input-group-prepend" style="margin-top: 8px;">
                                            <label style="padding-left: 13px; padding-top: 9px; font-size: 16px;">משעה:</label>
                                            <input type="time" class="form-control" id="thStart" placeholder="" min="14:00:00" max="19:00:00">
                                        </div>
                                    </div>
                                </div>
                                <div class="input-group-prepend">
                                    <div class="input-group-prepend" style="margin-top: 8px;">
                                        <label style="padding-left: 39px; padding-top: 9px; font-size: 16px;">עד:</label>
                                        <input type="time" class="form-control" id="thFinish" placeholder=""  style="margin-left: auto;" min="14:00:00" max="19:00:00">
                                    </div>
                                </div>
                            </div>
                        </div>

                </div>
                <div dir="rtl" class="modal-footer" style="background-color: #3f3f3f; ">
                    <button type="button" data-dismiss="modal" class="close" style="margin-left: auto; color: #ffffff; font-size: 16px; font-weight: lighter; opacity: 100%;">  סגירה ללא שמירה</button>
                    <input type="submit" class="btn btn-secondary" style="border-radius: 100px; width: 90px;" value="שמירה"/>
                </div>
            </div>
        </div>
    </div>
    </div>
</form>
    <%--<----------------------------------------------TEACHER INFO MODAL (update / delete)------------------------------------------------------------>--%>
<form class="needs-validation" novalidate="" dir="rtl" method="post" action="/admin/updateTeacher" id="update" modelAttribute="skillCon">
    <div id="teacherInfoModal" class="modal pg-show-modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalPopoversLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
        <div class="modal-dialog text-right modal-dialog-centered modal-lg" role="document">
            <div class="modal-content" style="padding-right: -102px;">
            <div class="modal-header text-right text-xl-right text-lg-right text-md-right text-sm-right" style="text-align: right; background-color: #fafafa;">
                <h5 class="modal-title" style="text-align: right; padding-right: 5px; margin-right: 7px; margin-left: auto; font-size: 22px; color: #565f66; font-family: Heebo; ">
                    <i class="fa fa-inverse fa-edit" style="color: #bfc8cf; margin-left: 10px; font-size: 18px;"></i>פרטי מורה</h5>
            </div>
            <div class="modal-body" style="padding-right: 28px; padding-left: 20px; font-size: 14px;">
                <p>
                <div class="form-row">
                    <div class="col-md-4 mb-3" style="padding-left: 20px;">
                        <label>שם משפחה</label>
                        <span id="uplastError" class="error"></span>
                        <input type="text" name="lastName" class="form-control text-right" id="upteacherLastName" placeholder="שם משפחה"/>
                    </div>
                    <div class="col-md-4 mb-3" style="padding-left: 20px;">
                        <label>שם פרטי</label>
                        <span id="upfirstError" class="error"></span>
                        <input type="text" name="firstName" class="form-control text-right" id="upteacherFirstName" placeholder="שם פרטי"/>
                    </div>
                    <div class="col-md-4 mb-3" style="padding-left: 20px;">
                        <label>תעודת זהות</label>
                        <span id="upidError" class="error"></span>
                        <input type="text" name="id" class="form-control text-right" id="upteacherID" placeholder="תעודת זהות" aria-describedby="inputGroupPrepend" readonly/>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-4 mb-3" style="padding-left: 20px;">
                        <label>דוא"ל</label>
                        <span id="upemailError" class="error"></span>
                        <input type="text" name="email" class="form-control text-right" id="upteacherMail" placeholder="כתובת דואר אלקטרוני"/>
                    </div>
                    <div class="col-md-4 mb-3" style="padding-left: 20px;">
                        <label>טלפון</label>
                        <span id="upphoneError" class="error"></span>
                        <input type="text" name="phone" class="form-control text-right" id="upteacherPhone" placeholder="מספר טלפון" />
                    </div>
                    <div class="col-md-4 mb-3" style="padding-left: 20px;">
                        <label>תאריך לידה</label>
                        <span id="updateError" class="error"></span>
                        <input type="date" name="birthDate" class="form-control" id="upteacherDate" placeholder="Zip" />
                    </div>
                    <div class="col-md-4 mb-3" style="padding-left: 20px; margin-left: auto;">
                        <label>מין</label>
                        <span id="upgenderError" class="error"></span>
                        <select dir="rtl" name="gender" class="custom-select mr-sm-2 float-left" id="upteacherGender">
                            <option selected="">בחירת מין</option>
                            <option value="F">נקבה</option>
                            <option value="M">זכר</option>
                        </select>
                    </div>
                </div>
                <%--            </form></p>--%>
                <hr style="margin-left: 15px;"/>
                <%--                    <form:form method="post" action="/admin/addTeacher" modelAttribute="skillCon" dir="rtl" class=" orm-inline">--%>
                <div class="row">
                    <div class="col-md-4 mb-3" style="padding-left: 20px; font-weight: bold; font-size: 18px;">מקצועות לימוד
                        <span id="upsubjectError" class="error" style="font-weight: normal;"></span></div>
                </div>
                <div class="form-row">
                    <div class="mb-3 col-md-3" style="padding-left: 20px;">
                        <input class="form-check-input" type="checkbox" id="uphebCheck" name="skills[]" value="heb"/>
                        <label style="font-size: 17px; line-height: 20px; text-indent: 25px;">שפה</label>
                        <select dir="rtl" class="custom-select" id="uphebrewLevel">
                            <option selected=""  value="def">רמת לימוד</option>
                            <option value="5">5</option>
                            <option value="4">4</option>
                            <option value="3">3</option>
                        </select>
                    </div>

                    <div class="mb-3 col-md-3" style="padding-left: 20px;">
                        <input class="form-check-input" type="checkbox" id="upmathCheck" name="skills[]" value="math"/>
                        <label style="font-size: 17px; line-height: 20px; text-indent: 25px;">מתמטיקה</label>
                        <select dir="rtl" class="custom-select" id="upmathLevel">
                            <option selected=""  value="def">רמת לימוד</option>
                            <option value="5">5</option>
                            <option value="4">4</option>
                            <option value="3">3</option>
                        </select>
                    </div>
                    <div class="mb-3 col-md-3" style="padding-left: 20px;">
                        <input class="form-check-input" type="checkbox" id="upengCheck" name="skills[]" value="eng"/>
                        <label style="font-size: 17px; line-height: 20px; text-indent: 25px;">אנגלית</label>
                        <select dir="rtl" class="custom-select" id="upengLevel">
                            <option selected=""  value="def">רמת לימוד</option>
                            <option value="5">5</option>
                            <option value="4">4</option>
                            <option value="3">3</option>
                        </select>
                    </div>
                </div>
                <%--                    </form:form>--%>
                <hr style="margin-left: 15px;"/>
                <%--                <form dir="rtl" class=" orm-inline">--%>
                <div class="row">
                    <div class="col-md-4 mb-3" style="padding-left: 20px; font-weight: bold; font-size: 18px;">ימי עבודה
                        <span id="updaysError" class="error" style="font-weight: normal;"></span></div>
                    <!--<div class="col-md-4 mb-3" style="padding-left: 20px; font-weight: bold; font-size: 18px;">ימי עבודה</div>
                    <span id="updaysError" class="error"></span>-->
                </div>
                <div class="form-row">
                    <div class="mb-3 col-md-3" style="padding-left: 20px;">
                        <input class="form-check-input" type="checkbox" id="upsundayCheck" name="days" value="sunday">
                        <label style="font-size: 17px; line-height: 20px; text-indent: 25px;">ראשון</label>
                        <span id="upsuError" class="error"></span>
                        <br>
                        <div class="input-group-prepend">
                            <div class="input-group-prepend">
                                <div class="input-group-prepend" style="margin-top: 8px;">
                                    <label style="padding-left: 13px; padding-top: 9px; font-size: 16px;">משעה:</label>
                                    <input type="time" class="form-control" id="upsuStart" placeholder="" min="14:00:00" max="19:00:00" >
                                </div>
                            </div>
                        </div>
                        <div class="input-group-prepend">
                            <div class="input-group-prepend" style="margin-top: 8px;">
                                <label style="padding-left: 39px; padding-top: 9px; font-size: 16px;">עד:</label>
                                <input type="time" class="form-control" id="upsuFinish" placeholder=""  style="margin-left: auto;" min="14:00:00" max="19:00:00">
                            </div>
                        </div>
                    </div>
                    <div class="mb-3 col-md-3" style="padding-left: 20px;">
                        <input class="form-check-input" type="checkbox" id="upmondayCheck" name="days" value="monday">
                        <label style="font-size: 17px; line-height: 20px; text-indent: 25px;">שני</label>
                        <span id="upmoError" class="error"></span>
                        <br>
                        <div class="input-group-prepend">
                            <div class="input-group-prepend">
                                <div class="input-group-prepend" style="margin-top: 8px;">
                                    <label style="padding-left: 13px; padding-top: 9px; font-size: 16px;">משעה:</label>
                                    <input type="time" class="form-control" id="upmoStart" placeholder="" min="14:00:00" max="19:00:00">
                                </div>
                            </div>
                        </div>
                        <div class="input-group-prepend">
                            <div class="input-group-prepend" style="margin-top: 8px;">
                                <label style="padding-left: 39px; padding-top: 9px; font-size: 16px;">עד:</label>
                                <input type="time" class="form-control" id="upmoFinish" placeholder=""  style="margin-left: auto;" min="14:00:00" max="19:00:00">
                            </div>
                        </div>
                    </div>
                    <div class="mb-3 col-md-3" style="padding-left: 20px; margin-left: 4px;">
                        <input class="form-check-input" type="checkbox" id="uptuesdayCheck" name="days" value="tuesday">
                        <label style="font-size: 17px; line-height: 20px; text-indent: 25px;">שלישי</label>
                        <span id="uptuError" class="error"></span>
                        <br>
                        <div class="input-group-prepend">
                            <div class="input-group-prepend">
                                <div class="input-group-prepend" style="margin-top: 8px;">
                                    <label style="padding-left: 13px; padding-top: 9px; font-size: 16px;">משעה:</label>
                                    <input type="time" class="form-control" id="uptuStart" placeholder="" min="14:00:00" max="19:00:00">
                                </div>
                            </div>
                        </div>
                        <div class="input-group-prepend">
                            <div class="input-group-prepend" style="margin-top: 8px;">
                                <label style="padding-left: 39px; padding-top: 9px; font-size: 16px;">עד:</label>
                                <input type="time" class="form-control" id="uptuFinish" placeholder="" rstyle="margin-left: auto;" min="14:00:00" max="19:00:00">
                            </div>
                        </div>
                        <br>
                    </div>
                    <div class="mb-3 col-md-3" style="padding-left: 20px;">
                        <input class="form-check-input" type="checkbox" id="upwednesdayCheck" name="days" value="wednesday">
                        <label style="font-size: 17px; line-height: 20px; text-indent: 25px;">רביעי</label>
                        <span id="upweError" class="error"></span>
                        <br>
                        <div class="input-group-prepend">
                            <div class="input-group-prepend">
                                <div class="input-group-prepend" style="margin-top: 8px;">
                                    <label style="padding-left: 13px; padding-top: 9px; font-size: 16px;">משעה:</label>
                                    <input type="time" class="form-control" id="upweStart" placeholder="" min="14:00:00" max="19:00:00">
                                </div>
                            </div>
                        </div>
                        <div class="input-group-prepend">
                            <div class="input-group-prepend" style="margin-top: 8px;">
                                <label style="padding-left: 39px; padding-top: 9px; font-size: 16px;">עד:</label>
                                <input type="time" class="form-control" id="upweFinish" placeholder=""  style="margin-left: auto;" min="14:00:00" max="19:00:00">
                            </div>
                        </div>
                    </div>
                    <div class="mb-3 col-md-3" style="padding-left: 20px;">
                        <input class="form-check-input" type="checkbox" id="upthursdayCheck" name="days" value="thursday">
                        <label style="font-size: 17px; line-height: 20px; text-indent: 25px;">חמישי</label>
                        <span id="upthError" class="error"></span>
                        <br>
                        <div class="input-group-prepend">
                            <div class="input-group-prepend">
                                <div class="input-group-prepend" style="margin-top: 8px;">
                                    <label style="padding-left: 13px; padding-top: 9px; font-size: 16px;">משעה:</label>
                                    <input type="time" class="form-control" id="upthStart" placeholder="" min="14:00:00" max="19:00:00">
                                </div>
                            </div>
                        </div>
                        <div class="input-group-prepend">
                            <div class="input-group-prepend" style="margin-top: 8px;">
                                <label style="padding-left: 39px; padding-top: 9px; font-size: 16px;">עד:</label>
                                <input type="time" class="form-control" id="upthFinish" placeholder="" style="margin-left: auto;" min="14:00:00" max="19:00:00">
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div dir="rtl" class="modal-footer" style="background-color: #3f3f3f; margin-right: -1px;">
                <button type="button" data-dismiss="modal" class="close" style="margin-left: auto; color: #ffffff; font-size: 16px; font-weight: lighter; opacity: 100%;" id="closeTeacherInfo">  סגירה ללא שמירה</button>
                <input type="submit" value="מחיקת מורה" name="delete" class="btn btn-outline-danger" id="deleteTeacher"
                       data-toggle="tooltip" title="זהירות! פעולת המחיקה תוביל למחיקת כל נתוני המורה מהמערכת ולא תתאפשר לו גישת התחברות לאחריה" data-placement="top" style="margin-left: 15px; border-radius: 100px; width: 133px;"/>
                <input type="submit" value="עדכון פרטים" name="update" class="btn btn-secondary" id="updateTeacher" style="width: 124px; border-radius: 100px;"/>
            </div>
        </div>
    </div>
</div>
</form>
<!-------------------------------------------------- MESSAGE MODAL --------------------------------------------------------------->
<div id="successMessage" class="modal pg-show-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalPopoversLabel"  data-keyboard="false" data-backdrop="static">
    <div class="text-right modal-lg modal-dialog modal-dialog-centered carousel-fade" role="document">
        <div class="modal-content">
            <div class="modal-header text-right text-xl-right text-lg-right text-md-right text-sm-right" style="padding: 20px; text-align: right; background-color: #24292e;">
                <button type="button" class="close" onclick="closeSuccessMessage();" aria-label="Close" style="padding-right: 14px; margin-left: -16px;">
                    <span aria-hidden="true" style="color: #ffffff;" >×</span>
                </button>
                <h5 class="modal-title" id="massageLabel" style="text-align: right; padding-right: 2px; margin-right: 10px; margin-left: auto; font-size: 20px; color: #ffffff; font-family: Heebo;">! ההוספה בוצעה בהצלחה&nbsp;&nbsp;<i class="fa fa-check" style="color: #25aaed;"></i></h5>
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
                <h5 class="modal-title" style="text-align: right; padding-right: 5px; margin-right: 7px; margin-left: auto; font-size: 22px; color: #565f66; font-family: Heebo; "><label id="NameLabel" style="font-size:16px; font-weight:initial;">שם מורה</label>מערכת שעות
                    <i class="fa fa-inverse fa-table" style="color: #bfc8cf; margin-left: 10px; font-size: 18px;"></i></h5>
            </div>
            <div class="modal-body" style="font-size: 14px; padding: 30px;" id="scheduleDiv">
                <table class="table schedule text-center" style="height: 350px; border: 2px solid #dee2e6; margin-bottom: 0px; background-color: #f7f7f7; " id="scheduleTable">
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

<!-- /.container -->
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="/js/jquery.min.js"></script>
<script src="/js/popper.js"></script>
<script src="/js/bootstrap.js"></script>
<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
<script src="/js/holder.min.js"></script>
<script src="/js/functions.js"></script>
<script>
    $(function(){
        $('[type="date"]').prop('max', function(){
            return new Date().toJSON().split('T')[0];
        });
    });

    $("#add").on('submit', function (event) {
        var self = this;
        var form = $(this);
        var formData = {};
        clearAlerts(false);
        if(!isFormValid(false))
        {
            event.preventDefault();
            return false;
        }

        $.each(this, function (k, v) {
            var value = $(v);
            formData[value.attr("name")] = value.val();
        });
        getSkills(formData, false);
        getDays(formData, false);
        // console.log(formData)
        event.preventDefault();
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

    $("#update").on('submit', function (event) {
        var self = this;
        var form = $(this);
        var formData = {};
        var operation = $("input[type='submit']:focus").attr("name");
        clearAlerts(true);
        if(operation == "update")
        {
            if (!isFormValid(true)) {
                event.preventDefault();
                return false;
            }

            $.each(this, function (k, v) {
                var value = $(v);
                formData[value.attr("name")] = value.val();
            });
            console.log(formData)
            getSkills(formData, true);
            getDays(formData, true);
            // console.log(formData)
        }
        else
            formData = "";
        event.preventDefault();
        var action  = (operation == "delete") ? "/admin/deleteTeacher" : "/admin/updateTeacher";
        var method  = (operation == "delete") ? "GET" : "POST";
        var id = (operation == "delete") ? "?id=" + $("#upteacherID").val() : "";
        alterTeacher(method, action, operation, formData, id);
    });

    function alterTeacher(method, action, operation, formData, id) {
        $.ajax({
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            url: action + id,
            type: method,
            dataType: 'json',
            data: JSON.stringify(formData),
            success: function (response) {
                upCallBack(operation);
              <!--  console.log(response); -->
            },
            error: function(jqXHR, textStatus, errorThrown){
            }
        });
    }

    $(".updateModal").on('click', function () {
        populateForm($(this).attr("name"), "update")
    });

    $(".scheduleModal").on('click', function () {
        $("#NameLabel").html($(this).attr('value')+"&nbsp&nbsp&nbsp");
        populateForm($(this).attr("name"), "schedule")
    });

    function populateForm(id, type) {
        $.ajax({
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            url: "/admin/getTeacher?id=" + id,
            type: 'GET',
            success: function (response) {
                if(type == "update")
                    setTeacherData(response);
                else if(type == "schedule") {
                    console.log(response)
                    setSchedule(response);
                }

            },
            error: function(jqXHR, textStatus, errorThrown){
            }
        });
    }

    function setTeacherData(response) {
        console.log(response);
        $("#upteacherLastName").val(response["teacher"]["lastName"]);
        $("#upteacherFirstName").val(response["teacher"]["firstName"]);
        $("#upteacherID").val(response["teacher"]["id"]);
        $("#upteacherMail").val(response["teacher"]["email"]);
        $("#upteacherPhone").val(response["teacher"]["phone"]);
        $("#upteacherDate").val(response["teacher"]["birthDate"]);
        $("#upteacherGender").val(response["teacher"]["gender"]);
        if(response["HEBREW"] != null)
        {
            $("#uphebCheck").prop('checked', true);
            $("#uphebrewLevel").val(response["HEBREW"]);
        }
        if(response["ENGLISH"] != null)
        {
            $("#upengCheck").prop('checked', true);
            $("#upengLevel").val(response["ENGLISH"]);
        }
        if(response["MATHEMATICS"] != null)
        {
            $("#upmathCheck").prop('checked', true);
            $("#upmathLevel").val(response["MATHEMATICS"]);
        }
        var prefDays = response["prefdays"];
        $(prefDays).each(function (ind, val) {
            var day = val["day"]
            if(day == "א")
                setPrefDay("upsundayCheck", "su", val["startHour"], val["finishHour"]);
            if(day == "ב")
                setPrefDay("upmondayCheck", "mo", val["startHour"], val["finishHour"]);
            if(day == "ג")
                setPrefDay("uptuesdayCheck", "tu", val["startHour"], val["finishHour"]);
            if(day == "ד")
                setPrefDay("upwednesdayCheck", "we", val["startHour"], val["finishHour"]);
            if(day == "ה")
                setPrefDay("upthursdayCheck", "th", val["startHour"], val["finishHour"]);

        });
    }

    function callBack(response) {
        if(response["response"] == "success")
        {
            $('#addTeacherModal').modal('hide');
            $('#successMessage').modal('show');
           <!-- alert("Teacher added successfully."); -->
        }
        else
        {
            alert("Teacher already exists");
        }
    }

    function upCallBack(action) {
        if(action == "update")
            $("#massageLabel").html(" ! עדכון פרטי המורה בוצע בהצלחה" + "&nbsp&nbsp<i class='fa fa-check' style='color: #25aaed;'></i>");
        else
            $("#massageLabel").html(" ! מחיקת המורה בוצעה בהצלחה" + "&nbsp&nbsp<i class='fa fa-check' style='color: #25aaed;'></i>");
        $('#teacherInfoModal').modal('hide');
        $('#successMessage').modal('show');
        <!-- alert("Teacher added successfully."); -->

    }

    function closeSuccessMessage() {
        $('#successMessage').modal('hide');
        window.location.reload();
    }

    function isFormValid(isUpdate) {
        var isValid = true;
        var prefix = isUpdate ? "up" : "";
        if($("#" + prefix + "teacherID").val().length != 9)
        {
            document.getElementById(prefix + "teacherID").style.borderColor="red";
            $("#" + prefix + "idError").html("ערך לא תקין<br>");
            isValid = false;
        }
        else {
            document.getElementById(prefix + "teacherID").style.borderColor="#ced4da";
        }
        if($.trim($("#" + prefix + "teacherLastName").val()) == "")
        {
            document.getElementById(prefix + "teacherLastName").style.borderColor="red";
            $("#" + prefix + "lastError").html("שדה חובה<br>");
            isValid = false;
        }
        else {
            document.getElementById(prefix + "teacherLastName").style.borderColor="#ced4da";
        }
        if($.trim($("#" + prefix + "teacherFirstName").val()) == "")
        {
            document.getElementById(prefix + "teacherFirstName").style.borderColor="red";
            $("#" + prefix + "firstError").html("שדה חובה<br>");
            isValid = false;
        }
        else {
            document.getElementById(prefix + "teacherFirstName").style.borderColor="#ced4da";
        }
        if(!validateEmail($("#" + prefix + "teacherMail").val()))
        {
            document.getElementById(prefix + "teacherMail").style.borderColor="red";
            $("#" + prefix + "emailError").html("ערך לא תקין<br>");
            isValid = false;
        }
        else {
            document.getElementById(prefix + "teacherMail").style.borderColor="#ced4da";
        }
        if(!validatePhone($("#" + prefix + "teacherPhone").val()))
        {
            document.getElementById(prefix + "teacherPhone").style.borderColor="red";
            $("#" + prefix + "phoneError").html("ערך לא תקין<br>");
            isValid = false;
        }
        else {
            document.getElementById(prefix + "teacherPhone").style.borderColor="#ced4da";
        }
        if($("#" + prefix + "teacherDate").val() == "" ||
            !validateDate($("#" + prefix + "teacherDate").val()))
        {
            document.getElementById(prefix + "teacherDate").style.borderColor="red";
            $("#" + prefix + "dateError").html("ערך לא תקין<br>");
            isValid = false;
        }
        else {
            document.getElementById(prefix + "teacherDate").style.borderColor="#ced4da";
        }
        if($("#" + prefix + "teacherGender").val() != "M" && $("#" + prefix + "teacherGender").val() != "F")
        {
            document.getElementById(prefix + "teacherGender").style.borderColor="red";
            $("#" + prefix + "genderError").html("שדה חובה<br>");
            isValid = false;
        }
        else {
            document.getElementById(prefix + "teacherGender").style.borderColor="#ced4da";
        }

        //Skills validation

        if($('input[name = "skills[]"]:checked').length == 0)
        {
            $("#" + prefix + "subjectError").html("<br>" + "יש לבחור מקצוע אחד לפחות");
            isValid = false;
        }
        else
        {
            if(isValid)
            {
                if($("#" + prefix + "mathCheck").is(":checked"))
                {
                    if(!validateSubjectLevel($("#" + prefix + "mathLevel").val()))
                        isValid = false;
                }
                if($("#" + prefix + "hebCheck").is(":checked"))
                {
                    if(!validateSubjectLevel($("#" + prefix + "hebrewLevel").val()))
                        isValid = false;
                }
                if($("#" + prefix + "engCheck").is(":checked"))
                {
                    if(!validateSubjectLevel($("#" + prefix + "engLevel").val()))
                        isValid = false;
                }
                if(!isValid)
                    $("#" + prefix + "subjectError").html("<br>" + "חסרה בחירת רמה" );
            }
        }

        //Pref days validation

        if( $('input[type="checkbox"][name="days"]:checked').length == 0)
        {
            $("#" + prefix + "daysError").html("<br>" + "יש לבחור יום אחד לפחות")
            isValid = false
        }
        else
        {
            $('input[type="checkbox"][name="days"]:checked').each(function () {
                var day = $(this).val();
                var start = $("#" + prefix + day.substr(0, 2) + "Start").val();
                var finish = $("#" + prefix + day.substr(0, 2) + "Finish").val();
                if(!validateDayTime(start, finish))
                {
                    $("#" + prefix + day.substr(0, 2) + "Error").html("&nbspזמן לא תקין");
                    isValid = false;
                }
            });
        }
        return isValid;
    }

    function validateEmail(mail)
    {
        var toReturn = false;
        if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail))
            toReturn = true;
        return toReturn;
    }

    function validatePhone(phone)
    {
        var toReturn = false;
        if (/^[(]{0,1}[0-9]{2,3}[)]{0,1}[-\s\.]{0,1}[0-9]{7}$/.test(phone))
            toReturn = true;
        return toReturn;
    }

    function validateDate(date)
    {
        if(date == "")
            return false;
        return new Date().toISOString().slice(0, 10) > date;
    }

    function getSkills(arr, isUpdate) {
        var prefix = isUpdate ? "up" : "";
        if($("#" + prefix + "mathCheck").is(":checked"))
        {
            //if(!validateSubjectLevel($("#mathLevel").val()))
            arr["math"] = $("#" + prefix + "mathLevel").val();
        }
        if($("#" + prefix + "hebCheck").is(":checked"))
        {
            // if(!validateSubjectLevel($("#hebrewLevel").val()))
            arr["heb"] = $("#" + prefix + "hebrewLevel").val();
        }
        if($("#" + prefix + "engCheck").is(":checked"))
        {
            // if(!validateSubjectLevel($("#engLevel").val()))
            arr["eng"] = $("#" + prefix + "engLevel").val();
        }
    }

    function getDays(arr, isUpdate) {
        var prefix = isUpdate ? "up" : "";
        $('input[type="checkbox"][name="days"]:checked').each(function () {
            var day = $(this).val();
            console.log(day);
            var start = $("#" + prefix + day.substr(0, 2) + "Start").val();
            var finish = $("#" + prefix + day.substr(0, 2) + "Finish").val();
            arr[day] = start + "," + finish;
        });
    }

    function validateDayTime(start, finish) {
        return start != "" && finish != "" && start < finish;
    }

    function validateSubjectLevel(level) {
        return level == "3" || level == "4" || level == "5";
    }

    function clearAlerts(isUpdate) {
        var prefix = isUpdate? "up" : "";
        $("#" + prefix + "lastError").text("");
        $("#" + prefix + "firstError").text("");
        $("#" + prefix + "idError").text("");
        $("#" + prefix + "emailError").text("");
        $("#" + prefix + "phoneError").text("");
        $("#" + prefix + "dateError").text("");
        $("#" + prefix + "genderError").text("");
        $("#" + prefix + "subjectError").text("");
        $("#" + prefix + "daysError").text("");
        $("#" + prefix + "suError").text("");
        $("#" + prefix + "moError").text("");
        $("#" + prefix + "tuError").text("");
        $("#" + prefix + "weError").text("");
        $("#" + prefix + "thError").text("");
    }

    $("#searchTeacher").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#myTable tr").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
    });

    // $('#searchTeacher').on('keyup', function(){
    //     // Search Text
    //     var search = $(this).val();
    //
    //     // Hide all table tbody rows
    //     $('table tbody tr').hide();
    //
    //     // Count total search result
    //     var len = $('table:not(.schedule) tbody tr:not(.notfound) td:contains("'+search+'")').length;
    //
    //     if(len > 0){
    //         // Searching text in columns and show match row
    //         $('table tbody tr:not(.notfound) td:contains("'+search+'")').each(function(){
    //             $(this).closest('tr').show();
    //         });
    //     }else{
    //         $('.notfound').show();
    //     }
    //
    // });
    // Case-insensitive searching (Note - remove the below script for Case sensitive search )
    $.expr[":"].contains = $.expr.createPseudo(function(arg) {
        return function( elem ) {
            return $(elem).text().toUpperCase().indexOf(arg.toUpperCase()) >= 0;
        };
    });

    $("#add").on('hidden.bs.modal', function (e) {
        
        clearForm(false);
    });

    $("#update").on('hidden.bs.modal', function (e) {
        clearForm(true);
    });

    function clearForm(isUpdate) {
        var prefix = "up";
        if(!isUpdate)
        {
            prefix = "";
            $("#teacherLastName").val("");
            $("#teacherFirstName").val("");
            $("#teacherID").val("");
            $("#teacherLastName").val("");
            $("#teacherMail").val("");
            $("#teacherPhone").val("");
            $("#teacherDate").val("");
            $("#teacherGender").val("def");

        }
        $("#" + prefix + "hebCheck").prop('checked', false);
        $("#" + prefix + "hebrewLevel").val("def");
        $("#" + prefix + "engCheck").prop('checked', false);
        $("#" + prefix + "engLevel").val("def");
        $("#" + prefix + "mathCheck").prop('checked', false);
        $("#" + prefix + "mathLevel").val("def");
        $("#" + prefix + "sundayCheck").prop('checked', false);
        $("#" + prefix + "suStart").val("");
        $("#" + prefix + "suFinish").val("");
        $("#" + prefix + "mondayCheck").prop('checked', false);
        $("#" + prefix + "moStart").val("");
        $("#" + prefix + "moFinish").val("");
        $("#" + prefix + "tuesdayCheck").prop('checked', false);
        $("#" + prefix + "tuStart").val("");
        $("#" + prefix + "tuFinish").val("");
        $("#" + prefix + "wednesdayCheck").prop('checked', false);
        $("#" + prefix + "weStart").val("");
        $("#" + prefix + "weFinish").val("");
        $("#" + prefix + "thursdayCheck").prop('checked', false);
        $("#" + prefix + "thStart").val("");
        $("#" + prefix + "thFinish").val("");
        document.getElementById(prefix + "teacherID").style.borderColor="#ced4da";
        document.getElementById(prefix + "teacherLastName").style.borderColor="#ced4da";
        document.getElementById(prefix + "teacherLastName").style.borderColor="#ced4da";
        document.getElementById(prefix + "teacherFirstName").style.borderColor="#ced4da";
        document.getElementById(prefix + "teacherMail").style.borderColor="#ced4da";
        document.getElementById(prefix + "teacherDate").style.borderColor="#ced4da";
        document.getElementById(prefix + "teacherGender").style.borderColor="#ced4da";
        $("#" + prefix + "lastError").text("");
        $("#" + prefix + "firstError").text("");
        $("#" + prefix + "idError").text("");
        $("#" + prefix + "emailError").text("");
        $("#" + prefix + "dateError").text("");
        $("#" + prefix + "genderError").text("");
        $("#" + prefix + "subjectError").text("");
        $("#" + prefix + "daysError").text("");
        $("#" + prefix + "suError").text("");
        $("#" + prefix + "moError").text("");
        $("#" + prefix + "tuError").text("");
        $("#" + prefix + "weError").text("");
        $("#" + prefix + "thError").text("");
    }

    $(function() {
        $('[data-toggle="tooltip"]').tooltip();
    })
</script>

</body>
</html>
