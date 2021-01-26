
<%@ page import="java.util.ArrayList" %>
<%@ page import="project.naveyosefcc.entity.Skill" %>
<%@ page import="project.naveyosefcc.entity.SkillsForPerson" %>
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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Heebo">
    <style>
        .table-responsive{
            box-shadow: 1px 1.5px 5px 0px #dcdcdcad;
        }
    </style>
</head>
<body style="background-color: #f7f7f7; margin-top: -50px;" class="mh-100 min-vh-100">
<nav class="navbar navbar-dark bg-dark navbar-expand-md fixed-top" style="display: grid; height: 60px; grid-template-columns: 1fr 1fr 1fr; background-color: #6c757d;">
    <a class="navbar-brand" href="/admin/index" style="font-size: 16px; grid-area: 1 / 1 / 2 / 1; padding-left: 9px;">חזרה לתפריט הראשי</a>
    <span class="navbar float-left" style="font-size: 30px; grid-area: 1 / 3 / 2 / 4; text-align: right; margin-top: -12px; padding-bottom: -26px; margin-bottom: -12px; margin-left: auto; font-family: Heebo; color: #ffffff;" data-placement="right">הפקת דו"חות תקופתיים</span>
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
        <label style="font-size:22px;">בחירת תאריכי תקופה&nbsp&nbsp<i class="fa fa-md fa-calendar" style="color: #ffffff;"></i></label>

    </form>
    <form class="form-inline my-2 my-lg-0" style="float: right; color: #ffffff; margin-right: 25px; padding-right: 20px; border-right: 1px solid #ffffff;">
        <input class="form-control mr-sm-2" id="endDate" type="date"  style="font-size: 16px; text-align: right; height: 35px; width: 200px; ">
        <label style="font-size:18px;">עד תאריך</label>
        <input class="form-control mr-sm-2" id="startDate" type="date"  style="font-size: 16px; text-align: right; height: 35px; width: 200px; margin-left:20px;">
        <label style="font-size:18px;">מתאריך</label>

    </form>

</div>
<div class="table-responsive" style="width: 1200px; margin-left: auto; margin-right: auto; margin-top: 40px; background-color: #ffffff; padding: 30px; ">
    <form id="search" dir="rtl" class="form-inline" style="padding-bottom: 30px;">
        <label style="font-size: 24px; margin-left: 20px; border-left: 1px solid #24292e;">
            מורים ומורות&nbsp; &nbsp;
        </label>
        <input class="form-control mr-sm-2" id="searchTeacher" type="text" placeholder="חיפוש מורה&nbsp;&nbsp;&#xF002;" aria-label="Search" style="font-family: Segoe UI, FontAwesome; font-size: 16px; text-align: right; height: 35px; width: 227px; margin-left: auto;">
    </form>
    <form id="sub" dir="rtl" class="form-inline" style="padding-bottom: 10px;" method="post" action="/admin/teacherLessonsReport"></form>
    <table class="table table-sm text-right" id="teachersTable" style="color: #3f3f3f; text-align: right;">
        <thead style="text-align: right; flex-direction: row;">
        <tr style="background-color: #eff1f3; color: #565f66;">
            <th style="text-align: center;">הפקת דו"ח שעות תקופתי</th>
            <th style="text-align: center;">פרטי שיעורים לתקופה</th>
            <th>שם מלא</th>
            <th style="padding-right: 14px;">תעודת זהות</th>
        </tr>
        </thead>
        <c:forEach items="${teachers}" var="teacher">
            <tbody id="myTableT">
            <tr>
                <td style="text-align: center;"><a class="btn updateModal" role="button" id="tId" style="border-radius: 100px; font-size: 16px; padding: 3px 8px;" target="_self" name="${teacher.id}"><i class="fa fa-file-pdf-o" style="color: #24292e;"></i></a></td>
                <td style="text-align: center;"><a class="btn scheduleModal" role="button" style="border-radius: 100px; font-size: 16px; padding: 3px 8px;" onclick="openModal(true)" name="${teacher.id}" target="_self"><i class="fa fa-bars" style="color: #24292e;"></i></a></td>
                <td>${teacher.lastName} ${teacher.firstName}</td>
                <td style="padding-right: 14px;">${teacher.id}</td>
            </tr>
            </tbody>
        </c:forEach>
    </table>
</div>

<div class="table-responsive" style="width: 1200px; margin-left: auto; margin-right: auto; margin-top: 40px; background-color: #ffffff; padding: 30px; ">
    <form dir="rtl" class="form-inline" style="padding-bottom: 30px;">
        <label style="font-size: 24px; margin-left: 20px; border-left: 1px solid #24292e;">
            סטודנטים וסטודנטיות&nbsp; &nbsp;
        </label>
        <input class="form-control mr-sm-2" id="searchStudent" type="text" placeholder="חיפוש סטודנט/ית&nbsp;&nbsp;&#xF002;" aria-label="Search" style="font-size: 16px; text-align: right; height: 35px; width: 227px; margin-left: auto; font-family: Segoe UI, FontAwesome;">
    </form>
    <form id="studentform" dir="rtl" class="form-inline" style="padding-bottom: 10px;" method="post" action="/admin/StudentLessonsReport"></form>
    <table class="table table-sm text-right" id="studentTable" style="color: #3f3f3f; text-align: right;">
        <thead style="text-align: right; flex-direction: row;">
        <tr style="background-color: #eff1f3; color: #565f66;">
            <th style="text-align: center;">הפקת דו"ח שעות תקופתי</th>
            <th style="text-align: center;">פרטי פעילות לתקופה</th>
            <th>שם מלא</th>
            <th style="padding-right: 14px;">תעודת זהות</th>
        </tr>
        </thead>
        <c:forEach items="${students}" var="student">
            <tbody id="myTableS">
            <tr>
                <td style="text-align: center;"><a class="btn updateModalstu" role="button" id="sId" style="border-radius: 100px; font-size: 16px; padding: 3px 8px;" target="_self" name="${student.id}"><i class="fa fa-file-pdf-o" style="color: #24292e;"></i></a></td>
                <td style="text-align: center;"><a class="btn scheduleModalstu" role="button" style="border-radius: 100px; font-size: 16px; padding: 3px 8px;" onclick="openModal(false)" name="${student.id}" target="_self"><i class="fa fa-bars" style="color: #24292e;"></i></a></td>
                <td>${student.lastName} ${student.firstName}</td>
                <td style="padding-right: 14px;">${student.id}</td>
            </tr>
            </tbody>
        </c:forEach>
    </table>
</div>
<%--<----------------------------------------------צפייה בשיעורי מורה------------------------------------------------------------>--%>
<div id="viewTDataModal" class="modal pg-show-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalPopoversLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
    <div class="text-right modal-lg modal-dialog modal-dialog-centered carousel-fade" role="document">
        <div class="modal-content">
            <div class="modal-header text-right text-xl-right text-lg-right text-md-right text-sm-right" style="text-align: right; background-color: #fafafa;">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="padding-right: 14px; margin-left: -16px;">
                    <span aria-hidden="true">×</span>
                </button>
                <h5 class="modal-title" id="exampleModalPopoversLabel" style="text-align: right; padding-right: 5px; margin-right: 7px; margin-left: auto; font-size: 22px; color: #565f66; font-family: Heebo; ">פרטי שיעורים לתקופה
                    <i class="fa fa-bars" style="color: #bfc8cf; margin-left: 10px; font-size: 18px;"></i></h5>
            </div>
            <form id="formSchedual" method="post" action="/admin/teacherSchedule">
            <div class="modal-body" style="font-size: 14px; padding: 30px;" id="scheduleDiv">
                <span class="Tmassege" aria-hidden="true"></span>
                <table class="table text-center" style=" border: 1.5px solid #dee2e6; margin-bottom: 0px; background-color: #f7f7f7; " id="tscheduleTable" >
                </table>
            </div>
            </form>
        </div>
    </div>
</div>
<%--<----------------------------------------------צפייה בפעילות סטודנטים------------------------------------------------------------>--%>
<div id="viewSDataModal" class="modal pg-show-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalPopoversLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
    <div class="text-right modal-lg modal-dialog modal-dialog-centered carousel-fade" role="document">
        <div class="modal-content">
            <div class="modal-header text-right text-xl-right text-lg-right text-md-right text-sm-right" style="text-align: right; background-color: #fafafa;">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="padding-right: 14px; margin-left: -16px;">
                    <span aria-hidden="true">×</span>
                </button>
                <h5 class="modal-title"  style="text-align: right; padding-right: 5px; margin-right: 7px; margin-left: auto; font-size: 22px; color: #565f66; font-family: Heebo; ">פרטי פעילות לתקופה
                    <i class="fa fa-bars" style="color: #bfc8cf; margin-left: 10px; font-size: 18px;"></i></h5>
            </div>
            <div class="modal-body" style="font-size: 14px; padding: 30px;" >
                <form id="studentformSchedual" method="post" action="/admin/studentSchedule">
                <table class="table text-center" style="border: 1.5px solid #dee2e6; margin-bottom: 0px; background-color: #f7f7f7; " id="studentScheduleTable">

                </table>
            </div>
        </div>
    </div>
</div>

<div id="errorMessage" class="modal pg-show-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalPopoversLabel"  data-keyboard="false" data-backdrop="static">
    <div class="text-right modal-lg modal-dialog modal-dialog-centered carousel-fade" role="document">
        <div class="modal-content">
            <div class="modal-header text-right text-xl-right text-lg-right text-md-right text-sm-right" style="padding: 20px; text-align: right; background-color: #24292e;">
                <button type="button" class="close" onclick="closeErrorMessage();" aria-label="Close" style="padding-right: 14px; margin-left: -16px;">
                    <span aria-hidden="true" style="color: #ffffff;" >×</span>
                </button>
                <h5 class="modal-title" id="massageLabel" style="text-align: right; padding-right: 2px; margin-right: 10px; margin-left: auto; font-size: 20px; color: #ffffff; font-family: Heebo;">&nbsp;! טווח תאריכים אינו תקין, אנא בחר/י שוב&nbsp;&nbsp;<i class="	fa fa-exclamation-triangle" style="color: #25aaed;"></i></h5>
            </div>
        </div>
    </div>
</div>

<div id="createMessage" class="modal pg-show-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalPopoversLabel"  data-keyboard="false" data-backdrop="static">
    <div class="text-right modal-lg modal-dialog modal-dialog-centered carousel-fade" role="document">
        <div class="modal-content">
            <div class="modal-header text-right text-xl-right text-lg-right text-md-right text-sm-right" style="padding: 20px; text-align: right; background-color: #24292e;">
                <button type="button" class="close" onclick="closeErrorMessage();" aria-label="Close" style="padding-right: 14px; margin-left: -16px;">
                    <span aria-hidden="true" style="color: #ffffff;" >×</span>
                </button>
                <h5 class="modal-title" style="text-align: right; padding-right: 2px; margin-right: 10px; margin-left: auto; font-size: 20px; color: #ffffff; font-family: Heebo;">&nbsp;! הדו"ח נוצר ונשמר בהצלחה&nbsp;&nbsp;<i class="	fa fa-download" style="color: #25aaed;"></i></h5>
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

<script>
    $("#sub").on('submit', function (event) {
        event.preventDefault();
        var form = $(this);
        var formData = {};
        formData['id'] = $("#tId").val();
        formData['startDate'] = $("#startDate").val();
        formData['endDate'] = $("#endDate").val();

        if(!isFormValid(false))
        {
            $('#errorMessage').modal('show');
            event.preventDefault();
            return false;
        }
        // alert("Teacher Report");
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
                if (!$.trim(response)){
                    $("#massageLabel").html(" ! לא קיימים נתונים בטווח התאריכים הנבחר" + "&nbsp&nbsp<i class='fa fa-exclamation-triangle' style='color: #25aaed;'></i>");
                    $('#errorMessage').modal('show');
                }
                else{
                    callBack(response);
                    $('#createMessage').modal('show');
                }
            },
            error: function(jqXHR, textStatus, errorThrown){
            }
        });
    });

    $("#formSchedual").on('submit', function (event) {
        event.preventDefault();
        var form = $(this);
        var formData = {};
        formData['id'] = $("#tId").val();
        formData['startDate'] = $("#startDate").val();
        formData['endDate'] = $("#endDate").val();

        if(!isFormValid(false))
        {
            event.preventDefault();
            return false;
        }

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

    $("#studentformSchedual").on('submit', function (event) {
        event.preventDefault();
        var form = $(this);
        var formData = {};
        formData['id'] = $("#sId").val();
        formData['startDate'] = $("#startDate").val();
        formData['endDate'] = $("#endDate").val();

        if(!isFormValid(false))
        {
            event.preventDefault();
            return false;
        }

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
                callBackStudent(response);
            },
            error: function(jqXHR, textStatus, errorThrown){
            }
        });
    });


    $("#studentform").on('submit', function (event) {
        event.preventDefault();
        var form = $(this);
        var formData = {};
        formData['id'] = $("#sId").val();
        formData['startDate'] = $("#startDate").val();
        formData['endDate'] = $("#endDate").val();

        if(!isFormValid(false))
        {
            $('#errorMessage').modal('show');
            event.preventDefault();
            return false;
        }
        // alert("Student report created");
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
                if (!$.trim(response)){
                    $("#massageLabel").html(" ! לא קיימים נתונים בטווח התאריכים הנבחר" + "&nbsp&nbsp<i class='fa fa-exclamation-triangle' style='color: #25aaed;'></i>");
                    $('#errorMessage').modal('show');
                }
                else
                    $('#createMessage').modal('show');
            },
            error: function(jqXHR, textStatus, errorThrown){
            }
        });
    });



    $(".updateModal").on('click', function () {

        populateForm($(this).attr("name"), "createReport")
    });

    $(".scheduleModal").on('click', function () {
        populateForm($(this).attr("name"), "schedule")
    });

    $(".updateModalstu").on('click', function () {

        populateFormStudent($(this).attr("name"), "createReportstu")
    });

    $(".scheduleModalstu").on('click', function () {
        populateFormStudent($(this).attr("name"), "schedule")
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
                if(type == "createReport")
                    setTeacherData(response);
                else if(type == "schedule") {
                    setSchedule(response);
                }


            },
            error: function(jqXHR, textStatus, errorThrown){
            }
        });
    }

    function populateFormStudent(id, type) {
        $.ajax({
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            url: "/admin/getStudent?id=" + id,
            type: 'GET',
            success: function (response) {
                if(type == "createReportstu")
                    setStudentData(response);
                else if(type == "schedule") {
                   setSchedulestudent(response);
                }
            },
            error: function(jqXHR, textStatus, errorThrown){
            }
        });
    }


    function setTeacherData(response) {
        console.log(response);
        $("#tId").val(response["teacher"]["id"]);
        $("#sub").submit();
    }

    function setSchedule(response) {
        console.log(response);
        $("#tId").val(response["teacher"]["id"]);
        $("#formSchedual").submit();
    }

    function setStudentData(response) {
        console.log(response);
        $("#sId").val(response["student"]["id"]);
        $("#studentform").submit();
    }

    function setSchedulestudent(response) {
        console.log(response);
        $("#sId").val(response["student"]["id"]);
        $("#studentformSchedual").submit();
    }


    function callBack(response) {
        console.log(response);
        $("#tscheduleTable").html("");
        var content = "<tr>\n" +
            "<th class=\"text-center\" style=\"border-left: 2px solid #dee2e6;\">שם תלמיד</th>\n" +
            "<th style=\"border-left: 2px solid #dee2e6;\">ת.ז תלמיד</th>\n" +
            "<th style=\"border-left: 2px solid #dee2e6;\">תאריך</th>\n" +
            "</tr>";

        $.each(response, function (key, val) {
            content += "<tr>"
            content += "<td style='vertical-align: middle; border-right: 2px solid #dee2e6;'>";
            content += val['pupilName'];
            content += "</td>";
            content += "<td style='vertical-align: middle; border-right: 2px solid #dee2e6;'>";
            content += val['pupilId'];
            content += "</td>";
            content += "<td>";
            content += val['lessonDate'];
            content += "</td>";
            content+= "</tr>";
        });
        $("#tscheduleTable").append(content);
    }

    function callBackStudent(response) {
        console.log(response);
        $("#studentScheduleTable").html("");
        var content = "<tr>\n" +
            "<th class=\"text-center\" style=\"border-left: 2px solid #dee2e6;\">שעת סיום</th>\n" +
            "<th style=\"border-left: 2px solid #dee2e6;\">שעת התחלה</th>\n" +
            "<th style=\"border-left: 2px solid #dee2e6;\">תאריך</th>\n" +
            "</tr>";

        $.each(response, function (key, val) {
            content += "<tr>"
            content += "<td style='vertical-align: middle; border-right: 2px solid #dee2e6;'>";
            content += val["finishHour"]; //removed fixTime
            content += "</td>";
            content += "<td style='vertical-align: middle; border-right: 2px solid #dee2e6;'>";
            content += val["startHour"]; //removed fixTime
            content += "</td>";
            content += "<td>";
            content += val['lessonDate'].toString("dd/MM/yyyy");
            content += "</td>";
            content+= "</tr>";
        });
        $("#studentScheduleTable").append(content);
    }

    function fixTime(time) {
        var date = new Date();
        var timeArr = time.split(":");
        date.setHours(parseInt(timeArr[0]) - 2);
        date.setMinutes(timeArr[1]);
        return date.toTimeString().split(' ')[0].substring(0, 5);
    }

    function isFormValid(isUpdate) {
        var isValid = true;
        var startDateValue = document.getElementById('startDate').value;
        var endDateValue = document.getElementById('endDate').value;

        if(!Date.parse(startDateValue) || !Date.parse(endDateValue) || (Date.parse(startDateValue)>=Date.parse(endDateValue)) ){
            // alert("invalid date");
            isValid = false;
        }
        return isValid;
    }

    function openModal(isTeacher) {
        if(!isFormValid(null)) {
            $("#massageLabel").html(" ! טווח תאריכים אינו תקין, אנא בחר/י שוב" + "&nbsp&nbsp<i class='fa fa-exclamation-triangle' style='color: #25aaed;'></i>");
            $('#errorMessage').modal('show');
        }
        else {
            if(isTeacher) {
                $('#viewTDataModal').modal('show');
            }
            else
                $('#viewSDataModal').modal('show');
        }
    }

    function closeErrorMessage() {
        $('#errorMessage').modal('hide');
        $('#createMessage').modal('hide');
    }

    $("#searchTeacher").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $("#myTableT tr").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
    });

    $("#searchStudent").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $("#myTableS tr").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
    });

</script>

</body>
</html>
