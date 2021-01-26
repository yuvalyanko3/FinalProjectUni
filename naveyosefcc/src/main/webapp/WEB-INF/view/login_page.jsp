<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%--        <link href="<c:url value="/assets/css/bootstrap.css">" rel="stylesheet">--%>
        <!-- Custom styles for this template -->
        <link href="/css/cover.css" rel="stylesheet">
<%--        <link href="<c:url value="/assets/css/cover.css">" rel="stylesheet">--%>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Heebo:100,300,400,500,700,800,900&subset=hebrew,latin">
        <style>
            .error{
                color: #ff5459;
                font-size: 12px;
            }
        </style>
    </head>
    <body style="background-image: url('/images/login.png'); background-repeat: no-repeat; background-size: auto 100%;">
        <div class="site-wrapper">
            <div class="site-wrapper-inner" style="font-size: 19px; letter-spacing: 2px;">
                <div class="cover-container" style="float: right; margin-right: 7%;">
                    <div class="inner cover" style="color: #ffffff;">
                        <h1 class="cover-heading" style=" font-size: 57px; letter-spacing: 7px; font-family: Heebo; font-weight: normal;"><b>מרכז למידה</b></h1>
                        <h1 class="cover-heading" style="font-size: 52px; font-family: Heebo; font-weight: lighter; margin-bottom: 24px;">מתנ"ס נווה יוסף</h1>
                        <form:form action="/auth_user" method="post" role="form" style="columns: 1; width: 327px; padding-left: 1px; margin-left: 147px; border-top: 1px groove;">
                            <div class="form-group" style="border-top: 1.5px solid #25aaed;">
                                <label for="exampleInputEmail1" style="float: right; margin-top: 50px;">תעודת זהות</label>                                 
                                <input type="text" name="username" class="form-control" id="exampleInputEmail1" placeholder="הקלד/י 9 ספרות" style="text-align: right;">
                            </div>                             
                            <div class="form-group">
                                <label for="exampleInputEmail1" style="float: right;">סיסמה</label>
                                <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="הקלד/י את הסיסמה שלך" style="text-align: right;">
                                <a href="#passwordRec" role="button" data-target="#passwordRec" data-toggle="modal" target="_self" style="margin-top:10px; float: right; font-size: 12px; color: #bebebe; font-weight: normal;">שכחת סיסמה? לחץ/י כאן</a>
                                <br/>
                                <br/>
                                <c:if test="${param.error != null}">
                                    <label style="font-size: 12px;  font-weight: normal;">תעודת הזהות או הסיסמה שהזנת אינם תקינים</label>
                                </c:if>
                            </div>
                            <input type="submit" value="כניסה" class="btn btn-default" style="background: linear-gradient(to bottom, #05c1ed, #1c7ded); border-radius: 40px; width: 128px; font-size: 22px; color: #ffffff; box-shadow: 5px 5px 22px -9px #121212;">
<%--                            <button type="submit" class="btn btn-default" style="background: linear-gradient(90deg, #DA22FF, #9733EE); border-radius: 40px; width: 128px; font-size: 22px; color: #ffffff; box-shadow: 6px 6px 24px -9px #121212;">כניסה</button>--%>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
<!-----------------------------------------------------------------RESET PASSWORD MODAL---------------------------------------------------------------->
        <form method="post" action="/reset_password" id="resetPassForm">
            <div id="passwordRec" class="modal pg-show-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalPopoversLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
                <div class="text-right modal-dialog modal-dialog-centered carousel-fade" role="document">
                    <div class="modal-content" style="padding-right: -102px;">
                        <div class="modal-header text-right text-xl-right text-lg-right text-md-right text-sm-right" style="text-align: right; background-color: #fafafa;">
                            <h5 class="modal-title" id="exampleModalPopoversLabel" style="text-align: right; padding-right: 5px; margin-right: 7px; margin-left: auto; font-size: 22px; color: #565f66; font-family: Heebo; "> שיחזור סיסמה<i class="fa fa-inverse fa-lock" style="color: #bfc8cf; margin-left: 10px; font-size: 18px;"></i></h5>
                        </div>
                        <div dir="rtl" class="modal-body" style="font-size: 14px; padding: 20px 30px 40px 20px;">
                            <form class="needs-validation" novalidate="">
                                <div class="form-row">
                                    לאחר הזנת תעודת זהות ישלח אליך דוא"ל עם סיסמה חדשה.
                                    <div style="padding-left: 20px; color: #3f3f3f; " class="col-xl-6 text-right float-right">

                                        <br>
                                        <label style="font-size: 16px;">תעודת זהות</label>
                                        <span id="idError" class="error"></span>
                                        <input type="text" class="form-control text-right" id="idTeacher" placeholder="תעודת זהות"/>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div dir="rtl" class="modal-footer" style="background-color: #3f3f3f;">
                            <button type="button" data-dismiss="modal" class="close" onclick="clearForm()" style="margin-left: auto; color: #ffffff; font-size: 16px; font-weight: lighter; opacity: 100%;">  סגירה ללא שמירה</button>
                            <input type="submit"  class="btn btn-secondary" style="border-radius: 100px; width: 90px;" value="שליחה"/>
                        </div>
                    </div>
                </div>
            </div>
        </form>
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
            $("#resetPassForm").on('submit', function (e) {
                var form = $(this);
                var id = $("#idTeacher").val();
                var formData = {};
                if (!validateId(id))
                {
                    $("#idError").html("&nbsp&nbspערך לא תקין");
                    e.preventDefault();
                    return false;
                }
                formData["id"] = id;
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
                        clearForm();
                        $('#passwordRec').modal('hide');
                    },
                    error: function(jqXHR, textStatus, errorThrown){
                    }
                });
            });

            function clearForm() {
                $("#idError").text("");
                $("#idTeacher").val("");
            }
        </script>
    </body>
</html>