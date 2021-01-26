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

                setTeacherSchedule(response);
            }

        },
        error: function(jqXHR, textStatus, errorThrown){
        }
    });
}

function setTeacherSchedule(response) {
    $("#scheduleTable td").not('.not-removed').each(function () {
        $(this).html("");
        $(this).css('background-color', '#fafafa');
    });
    var pupils = response["pupil"];
    var toAdd = {};
    $.each(pupils, function (index, value) {
        if(value["day"] == "א")
            toAdd["day"] = "su"
        else if(value["day"] == "ב")
            toAdd["day"] = "mo";
        else if(value["day"] == "ג")
            toAdd["day"] = "tu";
        else if(value["day"] == "ד")
            toAdd["day"] = "we";
        else if(value["day"] == "ה")
            toAdd["day"] = "th";

        var hour = parseInt(value["startHour"]); //removed fixTime
        if(hour == 14)
            toAdd["startHour"] = "Two"
        else if(hour == 15)
            toAdd["startHour"] = "Three"
        else if(hour == 16)
            toAdd["startHour"] = "Four"
        else if(hour == 17)
            toAdd["startHour"] = "Five"
        else if(hour == 18)
            toAdd["startHour"] = "Six"
        else if(hour == 19)
            toAdd["startHour"] = "Seven"
        $("#" + toAdd["day"] + toAdd["startHour"]).html(value["firstName"] + " " + value["lastName"]);
        document.getElementById(toAdd["day"] + toAdd["startHour"]).style.color="#ffffff";
        document.getElementById(toAdd["day"] + toAdd["startHour"]).style.backgroundColor="#25aaed";
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

//helper function to set pref day
function setPrefDay(check, day, startHour, finishHour) {
    $("#" + check).prop('checked', true);
    $("#up" + day + "Start").val(startHour); //removed fixTime
    $("#up" + day + "Finish").val(finishHour); //removed fixTime
}

//helper method. remove 2 hours from time, due to timezone differences.
function fixTime(time) {
    var date = new Date();
    var timeArr = time.split(":");
    date.setHours(parseInt(timeArr[0]) - 2);
    date.setMinutes(timeArr[1]);
    return date.toTimeString().split(' ')[0].substring(0, 5);
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


$('#searchTeacher').on('keyup', function(){
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

$("#add").on('hidden.bs.modal', function (e) {

    clearForm(false, this);
});

$("#update").on('hidden.bs.modal', function (e) {
    clearForm(true);
});

function clearForm(isUpdate, form) {
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
