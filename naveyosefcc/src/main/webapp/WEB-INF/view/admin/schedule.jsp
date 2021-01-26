<%@ page import="java.util.ArrayList" %>
<%@ page import="project.naveyosefcc.entity.Skill" %>
<%@ page import="project.naveyosefcc.entity.SkillsForPerson" %><%--
  Created by IntelliJ IDEA.
  User: maaya
  Date: 21/09/2019
  Time: 10:48
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

        .dayLetter {
          font-style: unset;
            font-family: 'Heebo ExtraBold';
            ont-family:Heebo;
            font-size: 30px;
            color: #ffffff;
            border: 1px solid;
            padding: 5px 14px;
            border-radius: 100px;
            background: linear-gradient(to bottom, #05c1ed, #04a6ed);
        }

        .dayName {
           font-size: 24px;
            margin-right: 20px;
            padding-right: 20px;
            border-right: 1px solid #24292e;
        }
        /* width */
        ::-webkit-scrollbar {
            width: 6px;

        }

        .table-responsive{
            box-shadow: 1px 1.5px 5px 0px #dcdcdcad;
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
        .sidenav {
            height: 100%;
            width: 0;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #eff1f3;
            overflow-x: hidden;
            transition: 0.5s;
            padding-top: 60px;
        }

        .sidenav a {
            text-decoration: none;
            font-size: 12px;
            color: #818181;
            display: block;
            transition: 0.1s;
        }


        .sidenav .closebtn {
            position: absolute;
            top: 0;
            right: 25px;
            font-size: 15px;
            margin-left: 10px;
        }

        #main {
            transition: margin-left .5s;

        }

        @media screen and (max-height: 450px) {
            .sidenav {padding-top: 15px;}
            .sidenav a {font-size: 18px;}
        }
    </style>
</head>
<body style="background-color: #f7f7f7; margin-top: -50px;" class="mh-100 min-vh-100">
<nav class="navbar navbar-dark bg-dark navbar-expand-md fixed-top" style="display: grid; height: 60px; grid-template-columns: 1fr 1fr 1fr; background-color: #6c757d;">
    <a class="navbar-brand" href="/admin/index" style="font-size: 16px; grid-area: 1 / 1 / 2 / 1; padding-left: 9px;">חזרה לתפריט הראשי</a>
    <span class="navbar float-left" style="font-size: 30px; grid-area: 1 / 3 / 2 / 4; text-align: right; margin-top: -12px; padding-bottom: -26px; margin-bottom: -12px; margin-left: auto; font-family: Heebo; color: #ffffff;" data-placement="right">שיבוץ שיעורים</span>
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
<div id="main">
    <div class="table-responsive" style="width: auto; margin-left: auto; margin-right: auto; background-color: #32beed; padding-right: 24px; margin-top: 0; padding-top: 25px; padding-bottom: 14px;">
        <span style="font-size:20px; color: #ffffff;margin-left: 15px;  " onclick="openNav()">&#9776; &nbsp;רשימת תלמידים</span>

            <form class="form-inline my-2 my-lg-0" style="float: right; color: #ffffff; margin-right: 10px;">
                <label style="font-size:22px;">בחירת מקצוע לשיבוץ שיעורים&nbsp&nbsp<i class="fa fa-md fa-book" style="color: #ffffff;"></i></label>

            </form>
        <form class="form-inline my-2 my-lg-0" style="float: right; color: #ffffff; margin-right: 20px; padding-right: 20px;  border-right: 1px solid #ffffff;">
            <select id="subjCombo" onchange="displayDays()" dir="rtl" name="skill" class="custom-select mr-sm-2 float-left" style="font-size: 16px; text-align: right; height: 35px; width: 200px; margin-left:20px ">
                <option selected="" value="def">בחירת מקצוע</option>
                <option value="Mathematics">מתמטיקה</option>
                <option value="English">אנגלית</option>
                <option value="Hebrew">שפה</option>
            </select>
            <label style="font-size:18px;">מקצוע</label>
        </form>
    </div>
    <div id="divFirst" style="text-align: center; margin-top: 3%; color:#5e6467;">.יש לבחור מקצוע לצורך הצגת נתונים&nbsp&nbsp<i class='fa fa-exclamation-triangle'></i></div>
<div id="divSec" style="display: none;">
    <div class="table-responsive" style="width: 1310px; margin-left: auto; margin-right: auto; margin-top: 40px; background-color: #ffffff; padding: 30px; ">
        <form dir="rtl" class="form-inline" style="padding-bottom: 30px;">
            <i class="dayLetter">א'</i>
            <label class="dayName" >
                יום ראשון&nbsp; &nbsp;
            </label>
        </form>
        <table class="table table-sm text-right" style="color: #3f3f3f; text-align: right;">
            <thead style="text-align: right; flex-direction: row;">
            <tr style="background-color: #eff1f366; color: #565f66;">
                <th  style="width: 5%; text-align: center;">איפוס</th>
                <th  style="width: 5%; text-align: center;">שמירה</th>
                <th  style="width: 10%; text-align: center;">18:00</th>
                <th  style="width: 10%; text-align: center;">17:00</th>
                <th  style="width: 10%;text-align: center;">16:00</th>
                <th style="width: 10%;text-align: center;">15:00</th>
                <th style="width: 10%;text-align: center;">14:00</th>
                <th style="width: 10%;text-align: center;">רמת לימוד</th>
                <th style="width: 10%; padding-right: 14px; ">שם מורה</th>
            </tr>
            </thead>
            <tbody id="teachersScheduleBodySun" style="text-align: center;">

            </tbody>
        </table>
    </div>
    <div class="table-responsive" style="width: 1310px; margin-left: auto; margin-right: auto; margin-top: 40px; background-color: #ffffff; padding: 30px; ">
        <form dir="rtl" class="form-inline" style="padding-bottom: 30px;">
        <i class="dayLetter" style="padding: 5px 16px;">ב'</i>
        <label class="dayName" >
                יום שני&nbsp; &nbsp;
            </label>
        </form>
        <table class="table table-sm text-right" style="color: #3f3f3f; text-align: right;">
            <thead style="text-align: right; flex-direction: row;">
            <tr style="background-color: #eff1f366; color: #565f66;">
                <th  style="width: 5%; text-align: center;">איפוס</th>
                <th  style="width: 5%; text-align: center;">שמירה</th>
                <th  style="width: 10%; text-align: center;">18:00</th>
                <th  style="width: 10%; text-align: center;">17:00</th>
                <th  style="width: 10%;text-align: center;">16:00</th>
                <th style="width: 10%;text-align: center;">15:00</th>
                <th style="width: 10%;text-align: center;">14:00</th>
                <th style="width: 10%;text-align: center;">רמת לימוד</th>
                <th style="width: 10%; padding-right: 14px;">שם מורה</th>
            </tr>
            </thead>
            <tbody id="teachersScheduleBodyMon" style="text-align: center;">

            </tbody>
        </table>
    </div>
    <div class="table-responsive" style="width: 1310px; margin-left: auto; margin-right: auto; margin-top: 40px; background-color: #ffffff; padding: 30px; ">
        <form dir="rtl" class="form-inline" style="padding-bottom: 30px;">
                <i class="dayLetter" style="padding: 5px 18px;">ג'</i>
                <label class="dayName" >
                יום שלישי&nbsp; &nbsp;
            </label>
        </form>
        <table class="table table-sm text-right"  style="color: #3f3f3f; text-align: right;">
            <thead style="text-align: right; flex-direction: row;">
            <tr style="background-color: #eff1f366; color: #565f66;">
                <th  style="width: 5%; text-align: center;">איפוס</th>
                <th  style="width: 5%; text-align: center;">שמירה</th>
                <th  style="width: 10%; text-align: center;">18:00</th>
                <th  style="width: 10%; text-align: center;">17:00</th>
                <th  style="width: 10%;text-align: center;">16:00</th>
                <th style="width: 10%;text-align: center;">15:00</th>
                <th style="width: 10%;text-align: center;">14:00</th>
                <th style="width: 10%;text-align: center;">רמת לימוד</th>
                <th style="width: 10%; padding-right: 14px;">שם מורה</th>
            </tr>
            </thead>
            <tbody id="teachersScheduleBodyTue" style="text-align: center;">

            </tbody>
        </table>
    </div>
    <div class="table-responsive" style="width: 1310px; margin-left: auto; margin-right: auto; margin-top: 40px; background-color: #ffffff; padding: 30px; ">
        <form dir="rtl" class="form-inline" style="padding-bottom: 30px;">
            <i class="dayLetter" style="padding: 5px 16px;">ד'</i>
            <label class="dayName" >
                יום רביעי&nbsp; &nbsp;
            </label>
        </form>
        <table class="table table-sm text-right"  style="color: #3f3f3f; text-align: right;">
            <thead style="text-align: right; flex-direction: row;">
            <tr style="background-color: #eff1f366; color: #565f66;">
                <th  style="width: 5%; text-align: center;">איפוס</th>
                <th  style="width: 5%; text-align: center;">שמירה</th>
                <th  style="width: 10%; text-align: center;">18:00</th>
                <th  style="width: 10%; text-align: center;">17:00</th>
                <th  style="width: 10%;text-align: center;">16:00</th>
                <th style="width: 10%;text-align: center;">15:00</th>
                <th style="width: 10%;text-align: center;">14:00</th>
                <th style="width: 10%;text-align: center;">רמת לימוד</th>
                <th style="width: 10%; padding-right: 14px;">שם מורה</th>
            </tr>
            </thead>
            <tbody id="teachersScheduleBodyWen" style="text-align: center;">

            </tbody>
        </table>
    </div>
    <div class="table-responsive" style="width: 1310px; margin-left: auto; margin-right: auto; margin-top: 40px; background-color: #ffffff; padding: 30px; ">
        <form dir="rtl" class="form-inline" style="padding-bottom: 30px;">
            <i class="dayLetter" style="padding: 5px 15px;">ה'</i>
            <label class="dayName" >
                יום חמישי&nbsp; &nbsp;
            </label>
        </form>
        <table class="table table-sm text-right" style="color: #3f3f3f; text-align: right;">
            <thead style="text-align: right; flex-direction: row;">
            <tr style="background-color: #eff1f366; color: #565f66;">
                <th  style="width: 5%; text-align: center;">איפוס</th>
                <th  style="width: 5%; text-align: center;">שמירה</th>
                <th  style="width: 10%; text-align: center;">18:00</th>
                <th  style="width: 10%; text-align: center;">17:00</th>
                <th  style="width: 10%;text-align: center;">16:00</th>
                <th style="width: 10%;text-align: center;">15:00</th>
                <th style="width: 10%;text-align: center;">14:00</th>
                <th style="width: 10%;text-align: center;">רמת לימוד</th>
                <th style="width: 10%; padding-right: 14px;">שם מורה</th>
            </tr>
            </thead>
            <tbody id="teachersScheduleBodyThr" style="text-align: center;">

            </tbody>
        </table>
    </div>
</div></div></div>
<div id="mySidenav" class="sidenav">
    <table class="table table-sm text-right" id="teachersTable" style="color: #3f3f3f; text-align: right;">
        <thead style="text-align: right; flex-direction: row;">
        <tr style="text-align: left; background-color: #eff1f3; color: #565f66;">
            <th onclick="closeNav()" style="cursor: pointer;">&nbsp;&nbsp;x</th>
        </tr>
        <tr style="background-color: #eff1f3; color: #565f66;">
            <th style="padding-right: 14px;">תלמידים שטרם שובצו</th>
        </tr>
        </thead>
        <tbody id="unAssignedBody">

        </tbody>
    </table>

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
    var unassignedPupil = [];
    $("#subjCombo").change(function () {
        updateWindow(this.value);
    });

    function updateWindow(subject) {
        getTeachersForSchedule(subject);
        getAssignedTeacherStudent(subject);
        getUnassignedPupils(subject);
    }

    function setPupilsForScheduleBuilder(response) {
        const days = ['א','ב', 'ג', 'ד', 'ה'];
        const tableDays = ['Sun', 'Mon', 'Tue', 'Wen', 'Thr'];
        const workingHours = getWorikingHours();
        $.each(response, function (ind, val) {
            let pupilName = val['firstName'] + ' ' + val['lastName'] +  ' ' + '(' + val['level'] + ')';
            let first = workingHours.indexOf(val['startHour']);
            let last = workingHours.indexOf(val['finishHour']);
            let pupilId = val['id'];
            let isOccupied = true;
            for(let i = first ; i < last ; i++)
            {
                let idSubString = tableDays[days.indexOf(val['day'])] + workingHours[i].substring(0, 2) + 'Combo';
                $("select[id*='" + idSubString + "']").each(function (ind, val) {
                    isOccupied = false;
                    val.append(new Option(pupilName, pupilId));
                });
            }
            if(isOccupied)
            {
                $('select.teacher-combo').each(function (ind, val) {
                    val.append(new Option(pupilName, pupilId));
                });
            }
        });
    }

    function getAssignedTeacherStudent(subject) {
        let formData = {};
        formData['subject'] = subject;
        $.ajax({
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            url: '/admin/getAssignedTeacherStudent',
            type: 'post',
            dataType: 'json',
            data: JSON.stringify(formData),
            success: function (response) {
                setAssignedTeacherStudent(response);
            },
            error: function(jqXHR, textStatus, errorThrown){
            }
        });
    }
    
    function setAssignedTeacherStudent(response) {
        $.each(response, function (ind, val) {
            let teacherCombo = getTeacherCombo(val['teacherId'], val['day'], val['hour']);
            let studentName = val['pupilFirstName'] + ' ' + val['pupilLastName'];
            let preSpan = getTeacherCombo(val['teacherId'], val['day']);
            let pSpan = '<span id="' + preSpan + '-' + val['pupilId'] + '">' + studentName + '</span>';
            $("#" + teacherCombo).html(pSpan);
        });
    }
// <span id="266391553ass223458432">שמואל פרץ</span>
    function getTeachersForSchedule(subject) {
        let formData = {};
        const days = ['א','ב', 'ג', 'ד', 'ה'];
        const tableDays = ['Sun', 'Mon', 'Tue', 'Wen', 'Thr'];
        $.each(days, function (ind, val) {
            formData['subject'] = subject;
            formData['days'] = val;
            $.ajax({
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                },
                url: '/admin/getTeachersForSchedule',
                type: 'post',
                dataType: 'json',
                data: JSON.stringify(formData),
                success: function (response) {
                    setTeacherDay(response, tableDays[ind]);
                },
                error: function(jqXHR, textStatus, errorThrown){
                }
            });
        });
    }

    function getUnassignedPupils(subject) {
        let formData = {};
        formData['subject'] = subject;
        $.ajax({
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            url: '/admin/getUnassignedPupils',
            type: 'post',
            dataType: 'json',
            data: JSON.stringify(formData),
            success: function (response) {
                setUnassignedTable(response);
                if(response)
                {
                    setPupilsForScheduleBuilder(response);
                    $.each(response, function (ind, val) {
                       unassignedPupil.push(response[ind]);
                    });
                }
            },
            error: function(jqXHR, textStatus, errorThrown){
            }
        });
    }

    function setUnassignedTable(response) {
        let toAppend = response ? "" : '<tr><td><strong>' + "אין תלמידים נוספים לשיבוץ" + '</strong></td></tr>';
        $("#unAssignedBody").html("");
        $.each(response, function (ind, val) {
            let pupilName = val['firstName'] + ' ' + val['lastName'] + ' (' + val['id'] + ')';
            toAppend += '<tr>';
            toAppend += '<td style="padding-right: 14px;">' + pupilName + '</td>';
            toAppend += '</tr>';
        });
        $('#unAssignedBody').append(toAppend);
    }

    function setTeacherDay(response, tableDay) {
        const workingHours = ['18:00:00', '17:00:00', '16:00:00', '15:00:00', '14:00:00'];
        let toAppend = "";
        $("#teachersScheduleBody" + tableDay).html("");
        $.each(response, function (ind, val) {
            let teacher = getTeacherWorkingHours(response[ind]);
            let startInd = workingHours.indexOf(teacher.finishHour);
            startInd++;
            let duration = teacher.duration;
            let teacherName = val['firstName'] + ' ' + val['lastName'];
            if(val['type'] == 'S') {
                teacherName =  '<i class="fa fa-graduation-cap" style="font-size: 10px; color:#2fbced"></i>' + ' ' + val['firstName'] + ' ' + val['lastName'];
            }
            toAppend += '<tr>';
            toAppend += '<td style="text-align: center; "><a id="' + val['id'] + tableDay + '" class="btn edit" role="button" style="border-radius: 100px; font-size: 16px; padding: 3px 8px;"><i class="fa fa-rotate-left" style="color: #24292e;"></i></a></td>';
            toAppend += '<td style="text-align: center; "><a id="' + val['id'] + tableDay + '" class="btn saveUpdates" role="button" style="border-radius: 100px; font-size: 16px; padding: 3px 8px;"><i class="fa fa-calendar-check-o" style="color: #24292e;"></i></a></td>';
            for(let i = 0 ; i<workingHours.length ; i++)
            {
                if(i >= startInd && duration != 0)
                {
                    let tdComboId = val['id'] + tableDay + workingHours[i].substring(0,2);
                    let comboId = tdComboId + 'Combo';
                    toAppend += '<td id="' + tdComboId + '"><select id="' + comboId + '" dir="rtl" class="custom-select mr-sm-2 float-left teacher-combo" style="font-size: 16px; text-align: right; height: 35px; width: 150px;"><option value="def">בחירת תלמיד</option></select></td>'
                    duration--;
                }
                else
                {
                    toAppend += '<td></td>';
                }

            }
            toAppend += '<td style="border-left: 1px solid #dee2e6; text-align: center;">' + val['level'] + '</td>';
            toAppend += '<td style="text-align: right; padding-right: 14px;">' + teacherName + '</td>';
            toAppend += '</tr>';
        });
        if(toAppend)
        {
            $("#teachersScheduleBody" + tableDay).append(toAppend);
        }
    }
    
    function getTeacherWorkingHours(teacher) {
        let duration = parseInt(teacher['finishHour']) - parseInt(teacher['startHour']);
        let workingHours = {
            finishHour: teacher['finishHour'],
            duration: duration
        };
        return workingHours;
    }

    function getTeacherCombo(teacherId, day, hour) {
        const days = ['א','ב', 'ג', 'ד', 'ה'];
        const tableDays = ['Sun', 'Mon', 'Tue', 'Wen', 'Thr'];
        if(hour)
            return teacherId + tableDays[days.indexOf(day)] + hour.substring(0, 2);
        else
            return teacherId + tableDays[days.indexOf(day)];
    }

    $(document).on('click', '.saveUpdates', function () {
        const days = ['א','ב', 'ג', 'ד', 'ה'];
        const tableDays = ['Sun', 'Mon', 'Tue', 'Wen', 'Thr'];
        let attrId = $(this).attr('id');
        let assignedInThisAction = [];
        let formData = {};
        let teacherId = getOnlyNumbers(attrId);
        let day = days[tableDays.indexOf(getOnlyLetters(attrId))];
        //GET TIME
        $("select[id*='" + $(this).attr('id') + "']").each(function (ind, val) {
            let pupilId = val['value'];
            if(pupilId != 'def')
            {
                if(jQuery.inArray(pupilId, assignedInThisAction) == -1)
                {
                    assignedInThisAction.push(pupilId);
                    let hour = val['id'].replace(attrId, '').replace('Combo', '');
                    //INSERT
                    formData['teacherId'] = teacherId;
                    formData['day'] = day;
                    formData['pupilId'] = pupilId;
                    formData['hour'] = hour;
                    formData['skill'] = $("#subjCombo").val().toUpperCase()
                    addTeacherStudentRelation(formData);
                    //REFRESH
                }
            }
        });
    });

    $(document).on('click', '.edit', function () {
        const days = ['א','ב', 'ג', 'ד', 'ה'];
        const tableDays = ['Sun', 'Mon', 'Tue', 'Wen', 'Thr'];
        $("span[id*='" + $(this).attr('id') + "']").each(function (ind, val) {
           let attrId = val['id'].split('-');
           let pupilId = attrId[1];
           let teacherId = getOnlyNumbers(attrId[0]);
           let day = getOnlyLetters(attrId[0]);
           let skill = $("#subjCombo").val().toUpperCase();
           let formData = {};
           formData['teacherId'] = teacherId;
           formData['pupilId'] = pupilId;
           formData['skill'] = skill;
           formData['day'] = days[tableDays.indexOf(day)];
           removeTeacherStudentRelation(formData);
        });
    });

    function addTeacherStudentRelation(formData) {
        $.ajax({
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            url: '/admin/addTeacherStudentRelation',
            type: 'post',
            dataType: 'json',
            data: JSON.stringify(formData),
            success: function (response) {
                updateWindow($("#subjCombo").val());
            },
            error: function(jqXHR, textStatus, errorThrown){
            }
        });
    }

    function removeTeacherStudentRelation(formData) {
        $.ajax({
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            url: '/admin/removeTeacherStudentRelation',
            type: 'post',
            dataType: 'json',
            data: JSON.stringify(formData),
            success: function (response) {
                updateWindow($("#subjCombo").val());
            },
            error: function(jqXHR, textStatus, errorThrown){
            }
        });
    }
</script>
<script>
    function openNav() {
        document.getElementById("mySidenav").style.width = "250px";
        document.getElementById("main").style.marginLeft = "250px";
    }

    function closeNav() {
        document.getElementById("mySidenav").style.width = "0";
        document.getElementById("main").style.marginLeft= "0";
    }

    function displayDays() {
        document.getElementById('divSec').style.display='block';
        document.getElementById('divFirst').style.display='none';
    }
</script>


</body>
</html>
