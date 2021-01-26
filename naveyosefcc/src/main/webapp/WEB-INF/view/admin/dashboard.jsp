<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/carousel.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Heebo">
    <title>מרכז למידה - מתנ"ס נווה יוסף</title>
  <style>
  canvas {
    -moz-user-select: none;
    -webkit-user-select: none;
    -ms-user-select: none;
  }
  .container {
      padding-left:5%;
      width: 100%;
  }
  @media (min-width: 576px) {
      .container {
          max-width: 540px;
      }
  }
  @media (min-width: 768px) {
      .container {
          max-width: 720px;
      }
  }
  @media (min-width: 992px) {
      .container {
          max-width: 960px;
      }
  }
  @media (min-width: 1200px) {
      .container {
          max-width: 1450px;
      }
  }
  </style>
  <script>
    window.onload = function() {
      getNumOfTeachersBySkill();
      getNumOfStudentsByProgram();
      getAVGradesByYearAndMonth();
      getAVGradesByTeachers();
      getNumOfPupilsBySkills();
      getNumOfPupilsByAgeGroup();
      getNumOfPupilsByAttendance();
      getNumOfPupilsByNumOfClasses();
      getNumOfPupilsByGrades();
      getTOP3ofPupilsByAVG();
      getLAST3ofPupilsByAVG();
    }

    function getNumOfTeachersBySkill(){
      event.preventDefault();
      $.ajax({
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        url: '/admin/processDashboard1',
        type: 'POST',
        dataType: 'json',
        success: function (response) {
          var skills = [];
          var countTeachers =[];
          $.each(response, function (key, val) {
            skills.push(val['skillName']);
            countTeachers.push(val['countTeachers']);
          });
          var config = {
            type: 'doughnut',
            data: {
              datasets: [{
                data: countTeachers,
                  borderColor: ['#454545','#454545','#454545'],
                backgroundColor: [
                    'rgb(147,101,237)',
                    'rgb(36,172,237)',
                    'rgb(75, 192, 192)'
                ],
                label: 'Dataset 1'
              }],
              labels: skills

            },
            options: {
              responsive: true,
                maintainAspectRatio: false,
                legend: {
                    labels: {
                        fontColor: "#FFFFFF",
                        fontSize: 14
                    }
                },
              title: {
                display: true,
                text: 'כמות מורים וסטודנטים לפי מקצוע לימוד',
                  fontSize: 16,
                  //fontFamily: 'Heebo regular',
                  fontFamily: 'Heebo',
                  fontColor: '#FFFFFF'
              },
            }
          };
          var ctx = document.getElementById('chart-area').getContext('2d');
          window.myPie = new Chart(ctx, config);
          },
        error: function(jqXHR, textStatus, errorThrown){
        }
      });
    }
    function getNumOfStudentsByProgram(){
      event.preventDefault();
      $.ajax({
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        url: '/admin/processDashboard2',
        type: 'POST',
        dataType: 'json',
        success: function (response) {
          var programs = [];
          var countStudents =[];
          $.each(response, function (key, val) {
            programs.push(val['volunteer_program']);
            countStudents.push(val['countStudents']);
          });
          var config = {
            type: 'doughnut',
            data: {
              datasets: [{
                data: countStudents,
                  borderColor: ['#454545','#454545','#454545'],
                backgroundColor: [
                    'rgb(147,101,237)',
                    'rgb(36,172,237)',
                    'rgb(75, 192, 192)'
                ],
                label: 'Dataset 1'
              }],

              labels: programs
            },
            options: {
              responsive: true,
                maintainAspectRatio: false,
                legend: {
                    labels: {
                        fontColor: "#FFFFFF",
                        fontSize: 14
                    }
                },
              title: {
                display: true,
                text: 'כמות סטודנטים לפי מלגות',
                  fontSize: 16,
                  //fontFamily: 'Heebo regular',
                  fontFamily: 'Heebo',
                  fontColor: '#FFFFFF'

              },
            }
          };
          var ctx = document.getElementById('chart-area2').getContext('2d');
          window.myPie = new Chart(ctx, config);
        },
        error: function(jqXHR, textStatus, errorThrown){
        }
      });
    }
    function getAVGradesByYearAndMonth(){
      event.preventDefault();
      $.ajax({
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        url: '/admin/processDashboard3',
        type: 'POST',
        dataType: 'json',
        success: function (response) {
            var d = new Date();
            var months =[], month2 = [], years1=[], years2=[], avgs1=[], avgs2=[];
            var monthMap = ["ספטמבר", "אוקטובר", "נומבמבר", "דצמבר","ינואר", "פברואר", "מרץ", "אפריל", "מאי", "יוני", "יולי", "אוגוסט"];
            $.each(response, function (key, val) {
                if(val['month'] == '9' && val['year'] == (d.getFullYear() - 1)) {
                    years1.push(parseInt(val['year'])+1);
                    if (months.indexOf(val['month']) == -1) {
                        months.push(val['month']);
                    }
                    avgs1.push(val['avg']);
                }
                if(val['month'] == '9' && val['year'] == (d.getFullYear() - 2)) {
                    years2.push(parseInt(val['year']));
                    if (months.indexOf(val['month']) == -1) {
                        months.push(val['month']);
                    }
                    avgs2.push(val['avg']);
                }
                if(val['month'] == '10' && val['year'] == (d.getFullYear() - 1)) {
                    years1.push(parseInt(val['year'])+1);
                    if (months.indexOf(val['month']) == -1) {
                        months.push(val['month']);
                    }
                    avgs1.push(val['avg']);
                }
                if(val['month'] == '10' && val['year'] == (d.getFullYear() - 2)) {
                    years2.push(parseInt(val['year']));
                    if (months.indexOf(val['month']) == -1) {
                        months.push(val['month']);
                    }
                    avgs2.push(val['avg']);
                }
                if(val['month'] == '11' && val['year'] == (d.getFullYear() - 1)) {
                    years1.push(parseInt(val['year'])+1);
                    if (months.indexOf(val['month']) == -1) {
                        months.push(val['month']);
                    }
                    avgs1.push(val['avg']);
                }
                if(val['month'] == '11' && val['year'] == (d.getFullYear() - 2)) {
                    years2.push(parseInt(val['year']));
                    if (months.indexOf(val['month']) == -1) {
                        months.push(val['month']);
                    }
                    avgs2.push(val['avg']);
                }
                if(val['month'] == '12' && val['year'] == (d.getFullYear() - 1)) {
                    years1.push(parseInt(val['year'])+1);
                    if (months.indexOf(val['month']) == -1) {
                        months.push(val['month']);
                    }
                    avgs1.push(val['avg']);
                }
                if(val['month'] == '12' && val['year'] == (d.getFullYear() - 2)) {
                    years2.push(parseInt(val['year']));
                    if (months.indexOf(val['month']) == -1) {
                        months.push(val['month']);
                    }
                    avgs2.push(val['avg']);
                }

                if (val['year'] == d.getFullYear()) {
                    years1.push(parseInt(val['year'])+1);
                    if (months.indexOf(val['month']) == -1) {
                        months.push(val['month']);
                    }
                    avgs1.push(val['avg']);
                }
                if (val['year'] == (d.getFullYear() - 1)) {
                    years2.push(parseInt(val['year']));
                    if (months.indexOf(val['month']) == -1) {
                       months.push(val['month']);
                    }
                    avgs2.push(val['avg']);
                }
                    $.each(months, function (key, val) {
                        if(month2.indexOf(monthMap[key]) == -1){
                            month2.push(monthMap[key])
                        }
                    });
            });
            var config3 = {
            type: 'line',
            data: {
              labels: month2,
              datasets: [
                  {
                      label: (parseInt(years2.pop())-1)+' - '+years2.pop(),
                      backgroundColor: window.chartColors.green,
                      borderColor: window.chartColors.green,
                      fill: false,
                      data: avgs2,
                  },
                  {
                      label: (parseInt(years1.pop())-1)+' - '+years1.pop(),
                      backgroundColor: window.chartColors.blue,
                      borderColor: window.chartColors.blue,
                      fill: false,
                      data: avgs1
              }]
            },
            options: {
              responsive: true,
                maintainAspectRatio: false,
              title: {
                display: true,
                text: 'ממוצע ציונים של כל התלמידים במרכז למידה בהשוואה לשנה שעברה',
                  fontSize: 16,
                  fontFamily: 'Heebo'
              },
              scales: {
                xAxes: [{
                  display: true,
                }],
                yAxes: [{
                  display: true,
                  ticks: {
                    min: 5,
                    max: 10,
                  }
                }]
              }
            }
          };
          var ctx = document.getElementById('canvas').getContext('2d');
          window.myPie = new Chart(ctx, config3);
        },
        error: function(jqXHR, textStatus, errorThrown){
        }
      });
    }
    function getAVGradesByTeachers(){
      event.preventDefault();
      $.ajax({
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        url: '/admin/processDashboard4',
        type: 'POST',
        dataType: 'json',
        success: function (response) {
          //console.log(response);
          var teachers = [];
          var avgs =[];
          $.each(response, function (key, val) {
            teachers.push(val['teacherName']);
            avgs.push(val['avg']);
          });
            var d = new Date();
            var config4 = {
            type: 'bar',
            data: {
              labels: teachers,
              datasets: [{
                label: d.getFullYear(),
                  borderColor: window.chartColors.green,
                  backgroundColor: 'rgb(75, 192, 192, 0.2)',
                borderWidth: 2,
                data: avgs
              }]
            },
            options: {
              responsive: true,
                maintainAspectRatio: false,
              title: {
                display: true,
                text: 'ממוצע ציונים לפי מורים בחודש האחרון',
                  fontSize: 16,
                  fontFamily: 'Heebo'
              },
              scales: {
                xAxes: [{
                  display: true,
                    scaleLabel: {
                        display: true,
                        labelString: 'שם מורה'
                    },
                    ticks: {
                        min: 1,
                        max: 12
                    }
                }],
                yAxes: [{
                  display: true,
                    scaleLabel: {
                        display: true,
                        labelString: 'ממוצע'
                    },
                  ticks: {
                    min: 5,
                    max: 10
                  }
                }]
              }
            }
          };
          var ctx = document.getElementById('canvas2').getContext('2d');
          window.myPie = new Chart(ctx, config4);
        },
        error: function(jqXHR, textStatus, errorThrown){
        }
      });
    }
    function getNumOfPupilsBySkills(){
      event.preventDefault();
      $.ajax({
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        url: '/admin/processDashboard5',
        type: 'POST',
        dataType: 'json',
        success: function (response) {
          var skills = [];
          var countPupils =[];
          $.each(response, function (key, val) {
            skills.push(val['skillName']);
            countPupils.push(val['countPupils']);
          });
          var config5 = {
            type: 'doughnut',
            data: {
              datasets: [{
                data: countPupils,
                  borderColor: ['#454545','#454545','#454545'],
                backgroundColor: [
                    'rgb(147,101,237)',
                    'rgb(36,172,237)',
                    'rgb(75, 192, 192)'
                ],
                label: 'Dataset 1'
              }],
              labels: skills
            },
            options: {
              responsive: true,
                maintainAspectRatio: false,
                legend: {
                    labels: {
                        fontColor: "#FFFFFF",
                        fontSize: 14
                    }
                },
              title: {
                display: true,
                text: 'כמות תלמידים לפי מקצוע לימוד',
                  fontSize: 16,
                  //fontFamily: 'Heebo regular',
                  fontFamily: 'Heebo',
                  fontColor: '#FFFFFF'
              },
            }
          };
          var ctx = document.getElementById('chart-area3').getContext('2d');
          window.myPie = new Chart(ctx, config5);
        },
        error: function(jqXHR, textStatus, errorThrown){
        }
      });
    }
    function getNumOfPupilsByAgeGroup(){
      event.preventDefault();
      $.ajax({
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        url: '/admin/processDashboard6',
        type: 'POST',
        dataType: 'json',
        success: function (response) {
          var ageGroups = [];
          var countPupils =[];
          $.each(response, function (key, val) {
            ageGroups.push(val['ageGroups']);
            countPupils.push(val['countPupils']);
          });
          var config6 = {
            type: 'doughnut',
            data: {
              datasets: [{
                data: countPupils,
                backgroundColor: [
                    'rgb(36,172,237)',
                    'rgb(147,101,237)',
                    'rgb(75, 192, 192)',
                    'rgb(223,223,223)'
                ],
                  borderColor: ['#454545','#454545','#454545','#454545'],
                label: 'Dataset 1'
              }],
              labels: ageGroups
            },
            options: {
              responsive: true,
                maintainAspectRatio: false,
                legend: {
                    labels: {
                        fontColor: "#FFFFFF",
                        fontSize: 14
                    }
                },
              title: {
                display: true,
                text: 'כמות תלמידים לפי שכבת גיל',
                  fontSize: 16,
                  //fontFamily: 'Heebo regular',
                  fontFamily: 'Heebo',
                  fontColor: '#FFFFFF'
              },
            }
          };
          var ctx = document.getElementById('chart-area4').getContext('2d');
          window.myPie = new Chart(ctx, config6);
        },
        error: function(jqXHR, textStatus, errorThrown){
        }
      });
    }
    function getNumOfPupilsByAttendance(){
      event.preventDefault();
      $.ajax({
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        url: '/admin/processDashboard7',
        type: 'POST',
        dataType: 'json',
        success: function (response) {
          var attendance = [];
          var countPupils =[];
          $.each(response, function (key, val) {
            attendance.push(val['attendance']);
            countPupils.push(val['countPupils']);
          });
            var d = new Date();
            var config7 = {
            type: 'bar',
            data: {
              labels: attendance,
              datasets: [{
               label: d.getFullYear(),
                borderColor: 'rgb(147,101,237)',
                backgroundColor: 'rgb(147,101,237,0.2)',
                borderWidth: 2,
                data: countPupils
              }]
            },
            options: {
              responsive: true,
                maintainAspectRatio: false,
              title: {
                display: true,
                text: 'דוח נוכחות תלמידים בשיעורים',
                  fontSize: 16,
                  fontFamily: 'Heebo'
              },
              scales: {
                xAxes: [{
                  display: true,
                    scaleLabel: {
                        display: true,
                        labelString: 'כמות שיעורים'
                    }
                }],
                yAxes: [{
                  display: true,
                  ticks: {
                    min: 0,
                  },
                    scaleLabel: {
                        display: true,
                        labelString: 'מספר תלמידים'
                    }
                }]
              }
            }
          };
          var ctx = document.getElementById('canvas3').getContext('2d');
          window.myPie = new Chart(ctx, config7);
        },
        error: function(jqXHR, textStatus, errorThrown){
        }
      });
    }
    function getNumOfPupilsByNumOfClasses(){
      event.preventDefault();
      $.ajax({
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        url: '/admin/processDashboard8',
        type: 'POST',
        dataType: 'json',
        success: function (response) {
          var numOfClasses = [];
          var numOfPupils =[];
          $.each(response, function (key, val) {
            numOfClasses.push(val['numOfClasses']);
            numOfPupils.push(val['numOfPupils']);
          });
            var d = new Date();
            var config8 = {
            type: 'bar',
            data: {
              labels: numOfClasses,
              datasets: [{
                label: d.getFullYear(),
                  backgroundColor: 'rgb(54, 162, 235, 0.2)',
                borderColor: window.chartColors.blue,
                borderWidth: 2,
                data: numOfPupils
              }]
            },
            options: {
              responsive: true,
                maintainAspectRatio: false,
              title: {
                display: true,
                text: 'כמות שיעורים שנותרו לתלמידים',
                  fontSize: 16,
                  fontFamily: 'Heebo'
              },
              scales: {
                xAxes: [{
                  display: true,
                    scaleLabel: {
                        display: true,
                        labelString: 'כמות שיעורים'
                    }
                }],
                yAxes: [{
                  display: true,
                  ticks: {
                    min: 0,
                    stepSize: 5
                  },
                    scaleLabel: {
                        display: true,
                        labelString: 'מספר תלמידים'
                    }
                }]
              }
            }
          };
          var ctx = document.getElementById('canvas4').getContext('2d');
          window.myPie = new Chart(ctx, config8);
        },
        error: function(jqXHR, textStatus, errorThrown){
        }
      });
    }
    function getNumOfPupilsByGrades(){
        event.preventDefault();
        $.ajax({
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            url: '/admin/processDashboard10',
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                var grades = [];
                var numOfPupils =[];
                $.each(response, function (key, val) {
                    grades.push(val['grades']);
                    numOfPupils.push(val['numOfPupils']);
                });
                var d = new Date();
                var config9 = {
                    type: 'line',
                    data: {
                        labels: grades,
                        datasets: [{
                            label: d.getFullYear(),
                            backgroundColor: window.chartColors.blue,
                            borderColor: window.chartColors.blue,
                            pointBackgroundColor: window.chartColors.blue,
                            pointRadius: 6,
                            pointHoverRadius: 10,
                            showLine: false,
                            data: numOfPupils
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        title: {
                            display: true,
                            text: 'מספר תלמידים לפי ציונים',
                            fontSize: 16,
                            fontFamily: 'Heebo'
                        },
                        scales: {
                            xAxes: [{
                                display: true,
                                scaleLabel: {
                                    display: true,
                                    labelString: 'ציון'
                                }
                            }],
                            yAxes: [{
                                display: true,
                                ticks: {
                                    min: 0,
                                    stepSize: 5
                                },
                                scaleLabel: {
                                    display: true,
                                    labelString: 'מספר תלמידים'
                                }
                            }]
                        }
                    }
                };
                var ctx = document.getElementById('canvas5').getContext('2d');
                window.myPie = new Chart(ctx, config9);
            },
            error: function(jqXHR, textStatus, errorThrown){
            }
        });
    }
    function getTOP3ofPupilsByAVG(){
      event.preventDefault();
      var flag = 1;
      $.ajax({
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        url: "/admin/processDashboard9",
        type: "post",
        dataType: 'json',
        data: JSON.stringify(flag),
        success: function (response) {
          $("#postEx").html("");
          var content = "<tr>\n" +
                  "<th style='font-size: 15px; color: #32beed'>ממוצע ציונים</th>\n" +
                  "<th style='font-size: 15px; color: #32beed'>&nbsp|&nbsp&nbspשם התלמיד</th>\n" +
                  "</tr>";
          $.each(response, function (key, val) {
            content += "<tr>"
            content += "<td style='font-size: 16px;  color: #FFFFFF;'>";
            content += val['numOfPupils'];
            content += "</td>";
            content += "<td style='font-size: 16px;  color: #FFFFFF;'>";
            content += val['grades'];
            content += "</td>";
            content+= "</tr>";
          });
          $("#postEx").append(content);        },
        error: function(jqXHR, textStatus, errorThrown){
        }
      });
    }
    function getLAST3ofPupilsByAVG(){
      event.preventDefault();
      var flag = 2;
      $.ajax({
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        url: "/admin/processDashboard9",
        type: "post",
        dataType: 'json',
        data: JSON.stringify(flag),
        success: function (response) {
          $("#postEx2").html("");
            var content = "<tr>\n" +
                "<th style='font-size: 15px; color: #32beed'>ממוצע ציונים</th>\n" +
                "<th style='font-size: 15px; color: #32beed'>&nbsp|&nbsp&nbspשם התלמיד</th>\n" +
                "</tr>";
            $.each(response, function (key, val) {
                content += "<tr>"
                content += "<td style='font-size: 16px;  color: #FFFFFF;'>";
                content += val['numOfPupils'];
                content += "</td>";
                content += "<td style='font-size: 16px;  color: #FFFFFF;'>";
                content += val['grades'];
                content += "</td>";
                content+= "</tr>";
            });
          $("#postEx2").append(content);        },
        error: function(jqXHR, textStatus, errorThrown){
        }
      });
    }

  window.chartColors = {
    red: 'rgb(255, 99, 132)',
    orange: 'rgb(255, 159, 64)',
    yellow: 'rgb(255, 205, 86)',
    green: 'rgb(75, 192, 192)',
    blue: 'rgb(0,132,235)',
    purple: 'rgb(153, 102, 255)',
    grey: 'rgb(231,233,237)'
  }

  </script>
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark" style="display: grid; grid-template-columns: 1fr 1fr 1fr; height: 60px; background-color: #2a2a2a !important;">
    <a class="navbar-brand" href="/admin/index" style="font-size: 16px; grid-area: 1 / 1 / 2 / 1; padding-left: 9px; ">חזרה לתפריט הראשי</a>
    <span class="navbar float-left" style="font-size: 25px; grid-area: 1 / 3 / 2 / 4; text-align: right;  margin-left: auto; font-family: Heebo; color: #ffffff;" data-placement="right">לוח בקרה</span></nav>
<center><div  class="container" style=" width: 100%;">
    <div class="row" style="height:350px; margin-top:5%; margin-bottom:2%; margin-right:2px;">
        <div class="col-6 col-md-7" style="background-color: #fbfbfb; margin-right:0.5%; padding-bottom: 2%; height:100%">
            <canvas id="canvas"></canvas></div>
        <div class="col-6 col-md-2" style="background-color: #454545; margin-left:0.5%; margin-right:0.5%; padding-bottom: 3%; height:100%">
            <label style="font-family: Heebo; font-size: 22px; padding-top: 18%; color: #FFFFFF;">תלמידים חזקים</label>
            <br>
                <table id="postEx" style="height:85%; width: 95%; text-align: center; font-family: Heebo; " >
            </table></div>
        <div class="col-6 col-md-2" style="background-color: #454545; margin-left:0.5%;  padding-bottom: 3%; height:100%">
            <label style="font-family: Heebo; font-size: 22px; padding-top: 18%; color: #FFFFFF;">תלמידים חלשים</label>
            <br>
            <table id="postEx2" style="height:85%; width: 95%; text-align: center; font-family: Heebo;" >
            </table></div>
    </div>
    <div class="row" style="height:300px; margin-right:15px;">
        <div class="col-6 col-md-3" style="background-color: #454545;  margin-right:0.5%; padding-bottom: 2%; height:90%">
            <canvas id="chart-area"></canvas></div>
        <div class="col-6 col-md-2" style="background-color: #454545; margin-left:0.5%; margin-right:0.5%; padding-bottom: 2%; height:90%">
            <canvas id="chart-area2"></canvas></div>
        <div class="col-6 col-md-3" style="background-color: #454545; margin-left:0.5%; margin-right:0.5%; padding-bottom: 2%; height:90%">
            <canvas id="chart-area3"></canvas></div>
        <div class="col-6 col-md-3" style="background-color: #454545; margin-left:0.5%; margin-right:0.5%; padding-bottom: 2%; height:90%">
            <canvas id="chart-area4"></canvas></div>
    </div>
    <!-- Columns start at 50% wide on mobile and bump up to 33.3% wide on desktop -->
    <div class="row" style="height:300px; margin-bottom:9%; " >
        <div class="col-6 col-md-5" style="background-color: #fbfbfb; margin-right:0.5%; padding-bottom: 2%; height:130%">
            <canvas id="canvas4"></canvas></div>
        <div class="col-6 col-md-6" style="background-color: #fbfbfb; margin-left:0.5%;  padding-bottom: 2%;  height:130%">
            <canvas id="canvas3"></canvas></div>
    </div>
    <!-- Columns are always 50% wide, on mobile and desktop -->
    <div class="row" style="height: 300px; margin-bottom:8%;">
        <div class="col-6 col-md-7" style="background-color: #fbfbfb; margin-right:0.5%; padding-bottom: 2%; height:130%">
            <canvas id="canvas2"></canvas></div>
        <div class="col-6 col-md-4" style="background-color: #fbfbfb; margin-left:0.5%;  padding-bottom: 2%;  height:130%">
            <canvas id="canvas5"></canvas></div>
    </div>
</div></center>
</body>
</html>
