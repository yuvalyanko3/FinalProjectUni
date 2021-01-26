<%--
  Created by IntelliJ IDEA.
  User: Yuval
  Date: 8/17/2019
  Time: 19:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Heebo:100,300,400,500,700,800,900&subset=hebrew,latin">
    <style>
        .error{
            margin-right: 5px;
            color: #ff5459;
            font-size: 12px;
        }
        ::-webkit-scrollbar {
            display: none;
        }
    </style>
</head>
<body style="background-image: url('/images/index.png'); background-repeat: no-repeat; background-size: 100% auto;">
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark" style="display: grid; grid-template-columns: 1fr 1fr 1fr; height: 60px; background-color: #2a2a2a !important;">
    <a class="navbar-brand" href="/logout_page" style="font-size: 16px; grid-area: 1 / 1 / 2 / 1; padding-left: 9px;">התנתקות</a>
    <a class="navbar-brand" data-toggle="modal" href="#settingsModal" style="font-size: 16px; grid-area: 1 / 1 / 2 / 1; padding-left: 103px;">הגדרות</a>
    <span class="navbar float-left" style="font-size: 25px; grid-area: 1 / 3 / 2 / 4; text-align: right; margin-top: -12px; padding-bottom: -26px; margin-bottom: -12px; margin-left: auto; font-family: Heebo; color: #ffffff;" data-placement="right">מרכז למידה&nbsp; /&nbsp; מתנ"ס נווה יוסף</span></nav>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
</div>
<!-- Marketing messaging and featurettes
================================================== -->
<!-- Wrap the rest of the page in another container to center all the content. -->
<div class="container marketing" style="padding-bottom: -22px; margin-bottom: -16px; margin-top: -14px; bottom: 2px;">
    <!-- Three columns of text below the carousel -->
    <div class="row" style="padding-bottom: -15px; margin-bottom: -67px; margin-top: -55px; padding-top: 48px;">
        <div class="col-lg-4">
            <div style="margin-right: 30px; margin-left: 30px; padding-top: 20px; padding-bottom: 20px; border-radius: 270px; box-shadow:1px 1px 0px #32beed, 1px 1px 0px 4px #2a2a2a;">
            <img src="/images/studentIcon.png" alt="Generic placeholder image"style="width: 180px; height: 180px;">
            <h6>&nbsp;</h6>
            <p><a class="btn btn-secondaryMenu" href="/admin/students" role="button" style="width: 113px; border-radius: 100px;">&lt; סטודנטים</a></p>
            </div>
        </div>
        <!-- /.col-lg-4 -->
        <div class="col-lg-4">
            <div class="menuBtn" style="margin-right: 30px; margin-left: 30px; padding-top: 20px; padding-bottom: 20px; border-radius: 270px; box-shadow:1px 1px 0px #32beed, 1px 1px 0px 4px #2a2a2a;">
            <img  src="/images/pupilIcon.png" alt="Generic placeholder image" style="width: 180px; height: 180px;">
            <h6>&nbsp;</h6>
            <p><a class="btn btn-secondaryMenu" href="/admin/pupils" role="button" style="width: 109px; border-radius: 100px;">&lt; תלמידים</a></p>
            </div>
        </div>
        <!-- /.col-lg-4 -->
        <div class="col-lg-4">
            <div class="menuBtn" style="margin-right: 30px; margin-left: 30px; padding-top: 20px; padding-bottom: 20px; border-radius: 270px; box-shadow:1px 1px 0px #32beed, 1px 1px 0px 4px #2a2a2a;">
            <img  src="/images/teacherIcon.png" alt="Generic placeholder image"  style="width: 180px; height: 180px;">
            <h6>&nbsp;</h6>
            <p><a class="btn btn-secondaryMenu" href="/admin/teachers" role="button" style="border-radius: 100px; width: 97px; font-size: 16px;" target="_self">&lt; מורים</a></p>
            </div>
        </div>
        <!-- /.col-lg-4 -->
    </div>
    <!-- /.row -->
    <!-- START THE FEATURETTES -->
    <!-- /END THE FEATURETTES -->
    <!-- FOOTER -->
</div>
<div class="container marketing">
    <!-- Three columns of text below the carousel -->
    <div class="row" style="margin-top: 104px;">
        <div class="col-lg-4">
            <div style="margin-right: 30px; margin-left: 30px; padding-top: 20px; padding-bottom: 20px; border-radius: 270px; box-shadow:1px 1px 0px #32beed, 1px 1px 0px 4px #2a2a2a;">
            <img  src="/images/dashbIcon.png" alt="Generic placeholder image" width="140" height="140" style="width: 170px; height: 170px;">
            <h6>&nbsp;</h6>
            <p><a class="btn btn-secondaryMenu" href="/admin/dashboard" role="button" style="width: 120px; border-radius: 100px;">&lt; לוח בקרה</a></p>
            </div>
        </div>
        <!-- /.col-lg-4 -->
        <div class="col-lg-4">
            <div style="margin-right: 30px; margin-left: 30px; padding-top: 20px; padding-bottom: 20px; border-radius: 270px; box-shadow:1px 1px 0px #32beed, 1px 1px 0px 4px #2a2a2a; ">
            <img src="/images/reportIcon.png" alt="Generic placeholder image" width="140" height="140" style="width: 170px; height: 170px;">
            <h6>&nbsp;</h6>
            <p><a class="btn btn-secondaryMenu" href="/admin/reports" role="button" style="width: 140px; border-radius: 100px;">&lt; הפקת דוחות</a></p>
            </div>
        </div>
        <!-- /.col-lg-4 -->
        <div class="col-lg-4">
            <div style="margin-right: 30px; margin-left: 30px; padding-top: 20px; padding-bottom: 20px; border-radius: 270px;box-shadow:1px 1px 0px #32beed, 1px 1px 0px 4px #2a2a2a; ">
            <img src="/images/groupIcon.png" alt="Generic placeholder image" width="140" height="140" style="width: 170px; height: 170px;">
            <h6>&nbsp;</h6>
            <p><a class="btn btn-secondaryMenu" href="/admin/schedule" role="button" style="border-radius: 100px; width: 145px;">&lt; שיבוץ שיעורים</a></p>
            </div>
        </div>
        <!-- /.col-lg-4 -->
    </div>
    <!-- /.row -->
    <!-- START THE FEATURETTES -->
    <!-- /END THE FEATURETTES -->
    <!-- FOOTER -->
</div>
<!----------------------------------------------------------------SETTINGS MODAL------------------------------------------------------------------>
<form method="post" action="/changePassword" class="needs-validation" novalidate="" dir="rtl" id="update">
    <div id="settingsModal" class="modal pg-show-modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalPopoversLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
        <div class="modal-dialog text-right modal-dialog-centered modal-lg" role="document">
            <div class="modal-content" style="padding-right: -102px;">
                <div class="modal-header text-right text-xl-right text-lg-right text-md-right text-sm-right" style="text-align: right; background-color: #fafafa;">
                    <h5 class="modal-title" id="exampleModalPopoversLabel" style="text-align: right; padding-right: 5px; margin-right: 7px; margin-left: auto; font-size: 22px; color: #565f66; font-family: Heebo; ">
                        <i class="fa fa-inverse fa-cog" style="color: #bfc8cf; margin-left: 10px; font-size: 18px;"></i>הגדרות</h5>
                </div>
                <div class="modal-body" style="padding-right: 28px; padding-left: 20px; font-size: 14px;">
                    <div class="row">
                        <div class="col-md-4 mb-3" style="padding-left: 20px; font-weight: bold; font-size: 18px;">שינוי סיסמת מנהל
                            <span id="adminPassError" class="error" style="font-weight: normal;"></span></div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-4 mb-3" style="padding-left: 20px;">
                            <label>סיסמה חדשה</label>
                            <span id="passError" class="error"></span>
                            <input type="text" name="newPass" class="form-control text-right" id="newPassword" placeholder='סיסמה חדשה' />
                        </div>
                        <div class="col-md-4 mb-3" style="padding-left: 20px;">
                            <label>אימות סיסמה</label>
                            <span id="reapetPassError" class="error"></span>
                            <input type="text" name="reapetPass" class="form-control text-right" id="checkPassword" placeholder='אימות סיסמה' />
                        </div>

                    </div>
                    <span id="checkPassError" class="error"></span>
                    <hr style="margin-left: 15px;"/>
                    <div class="row">
                        <div class="col-md-4 mb-3" style="padding-left: 20px; font-weight: bold; font-size: 18px;">שינוי דוא"ל ראשי
                            <span id="adminMailError" class="error" style="font-weight: normal;"></span></div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-6 mb-3" style="padding-left: 20px;">
                            <label>כתובת דוא"ל</label>
                            <span id="mailError" class="error"></span>
                            <input type="text" name="newMail" class="form-control text-right" id="mainMail" placeholder='כתובת דוא"ל חדשה' />
                        </div>
                    </div>

                </div>
                <div dir="rtl" class="modal-footer" style="background-color: #3f3f3f; ">
                    <button type="button" id="btnClose" data-dismiss="modal" class="close" style="margin-left: auto; color: #ffffff; font-size: 16px; font-weight: lighter; opacity: 100%;" onclick="clearForm()">  סגירה ללא שמירה</button>
                    <input type="submit" class="btn btn-secondary" style="border-radius: 100px; width: 90px;" value="שמירה"/>
                </div>
            </div>
        </div>
    </div>
    </div>
</form>
<!-- /.container -->
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="/js/jquery.min.js"></script>
<script src="/js/popper.js"></script>
<script src="/js/bootstrap.min.js"></script>
<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
<script src="/js/holder.min.js"></script>
<script src="/js/functions.js"></script>
<script>
    $("#update").on('submit', function (e) {

        var passChanged = false;
        const sleep = (milliseconds) => {
            return new Promise(resolve => setTimeout(resolve, milliseconds))
        };

        if($("#newPassword").val().trim() != "" || $("#checkPassword").val().trim() != "")
        {
            var form = $(this);
            var formData = {};
            var id = $("#teacherId").val();
            var newPass = $("#newPassword").val();
            var repeatPass = $("#checkPassword").val();
            if(!changePass(id, newPass, repeatPass, false))
            {
                document.getElementById("checkPassError").style.color = "red";
                $("#checkPassError").html("הסיסמאות אינן זהות");
                e.preventDefault();
                return false;
            }
            $.each(this, function (k, v) {
                var value = $(v);
                formData[value.attr("name")] = value.val();
            });
            passChanged = true;
            formData['id'] = 'user1';
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
                    $("#checkPassError").html("<i class='fa fa-check-circle' style='color: #25aaed;'></i>"+ "&nbsp&nbspסיסמת מנהל שונתה בהצלחה!");
                    document.getElementById("checkPassError").style.color = "#25AAED";
                },
                error: function(jqXHR, textStatus, errorThrown){
                }
            });
        }
        if($("#mainMail").val().trim() != "")
        {
            var form = $(this);
            var formData = {};
            var id = $("#teacherId").val();
            var newMail = $("#mainMail").val();

            if(!validateEmail(newMail))
            {
                e.preventDefault();
                return false;
            }
            $.each(this, function (k, v) {
                var value = $(v);
                formData[value.attr("name")] = value.val();
            });
            formData['id'] = 'user1';
            if(passChanged)
            {
                sleep(1500);
            }
            e.preventDefault();
            $.ajax({
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                },
                url: '/changeMail',
                type: form.attr("method"),
                dataType: 'json',
                data: JSON.stringify(formData),
                success: function (response) {
                  //  callBack(response);
                },
                error: function(jqXHR, textStatus, errorThrown){
                }
            });
        }
    });

    function updatePassword(form, e) {

    }

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

    function clearForm() {
            document.getElementById("checkPassError").style.color = "red";
            $("#checkPassword").val("");
            $("#newPassword").val("");
            $("#checkPassError").text("");
            $("#mainMail").val("");
    }

</script>
</body>
</html>
