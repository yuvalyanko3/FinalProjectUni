function validateId(id) {
    return id.trim().length == 9 && /^\d+$/.test(id);
}

function validatePassword(pass) {
    return pass.trim().length != 0;
}

function validateDayTime(start, finish) {
    return start != "" && finish != "" && start < finish;
}

function validateEmail(mail) {
    var toReturn = false;
    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail))
        toReturn = true;
    return toReturn;
}

function validateDate(date) {
    if(date == "")
        return false;
    return new Date().toISOString().slice(0, 10) > date;
}

function validatePhone(phone) {
    var toReturn = false;
    if (/^[(]{0,1}[0-9]{2,3}[)]{0,1}[-\s\.]{0,1}[0-9]{7}$/.test(phone))
        toReturn = true;
    return toReturn;
}

function validateSubjectLevel(level) {
    return level == "3" || level == "4" || level == "5";
}

//helper method. remove 2 hours from time, due to timezone differences.
function fixTime(time) {
    var date = new Date();
    var timeArr = time.split(":");
    date.setHours(parseInt(timeArr[0]) - 2);
    date.setMinutes(timeArr[1]);
    return date.toTimeString().split(' ')[0].substring(0, 5);
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
            toAdd["day"] = "su";
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
            toAdd["startHour"] = "Two";
        else if(hour == 15)
            toAdd["startHour"] = "Three";
        else if(hour == 16)
            toAdd["startHour"] = "Four";
        else if(hour == 17)
            toAdd["startHour"] = "Five";
        else if(hour == 18)
            toAdd["startHour"] = "Six";
        else if(hour == 19)
            toAdd["startHour"] = "Seven";
        $("#" + toAdd["day"] + toAdd["startHour"]).html(value["firstName"] + " " + value["lastName"]);
        document.getElementById(toAdd["day"] + toAdd["startHour"]).style.color="#ffffff";
        document.getElementById(toAdd["day"] + toAdd["startHour"]).style.backgroundColor="#25aaed";
    });
}

function setPrefDay(check, day, startHour, finishHour) {
    $("#" + check).prop('checked', true);
    $("#up" + day + "Start").val(startHour); //removed fixTime
    $("#up" + day + "Finish").val(finishHour); //removed fixTime
}

function setSchedule(response) {
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
            toAdd["startHour"] = "Two";
        else if(hour == 15)
            toAdd["startHour"] = "Three";
        else if(hour == 16)
            toAdd["startHour"] = "Four";
        else if(hour == 17)
            toAdd["startHour"] = "Five";
        else if(hour == 18)
            toAdd["startHour"] = "Six";
        else if(hour == 19)
            toAdd["startHour"] = "Seven";
        $("#" + toAdd["day"] + toAdd["startHour"]).html(value["firstName"] + " " + value["lastName"]);
        document.getElementById(toAdd["day"] + toAdd["startHour"]).style.color="#ffffff";
        document.getElementById(toAdd["day"] + toAdd["startHour"]).style.backgroundColor="#25aaed";
    });
}

function isPassFormValid(id, newPass, repeatPass, idRequired) {
    var isValid = true;

    if(idRequired && !validateId(id))
    {
        isValid = false;
        $("#idError").html("&nbsp" + "ערך לא תקין" );
    }
    if(!validatePassword(newPass))
    {
        isValid = false
        $("#passError").html("&nbsp" + "שדה חובה");
    }
    else
    {
        if (newPass != repeatPass)
        {
            $("#checkPassError").html("הסיסמאות אינן זהות");
            isValid = false;
        }
    }
    return isValid
}

function buildLessonSheet(response) {
    $.each(response, function () {
       console.log($(this));
    });
}

function translateSubject(subject) {
    let toReturn = "";
    if(subject == "HEBREW")
        toReturn = "עברית";
    if(subject == "ENGLISH")
        toReturn = "אנגלית";
    if(subject == "MATHEMATICS")
        toReturn = "מתמטיקה";
    return toReturn;
}

function populateLessonSheet(formData) {
    $.ajax({
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        url: "/common/lessonSheet",
        type: "post",
        dataType: 'json',
        data: JSON.stringify(formData),
        success: function (response) {
            setLessonSheet(response);
        },
        error: function(jqXHR, textStatus, errorThrown){
        }
    });
}

function setLessonSheet(response) {
    let toAppend = "";
    console.log(response)
    $("#lessonBody").html("");
    $.each(response, function (ind, val) {
        toAppend += '<tr>';
        toAppend += '<td style="border-left: 2px solid #dee2e6;" id="1">' + val["notes"] + '</td>';
        toAppend += '<td style="border-left: 2px solid #dee2e6;" id="2">' + val["grade"] + '</td>';
        toAppend += '<td style="border-left: 2px solid #dee2e6;" id="2">' + val["desc"] + '</td>';
        toAppend += '<td style="border-left: 2px solid #dee2e6;" id="2">' + val["attendance"] + '</td>';
        toAppend += '<td style="border-left: 2px solid #dee2e6;" id="2">' + val["date"] + '</td>';
        toAppend += '<td style="border-left: 2px solid #dee2e6;" id="2">' + translateSubject(val["subject"]) + '</td>';
        toAppend += '<td style="border-left: 2px solid #dee2e6;" id="2">' + (ind + 1) + '</td>';
        toAppend += '</tr>';
    });
    $("#lessonBody").append(toAppend);
}

function getWorikingHours() {
    return ['14:00:00', '15:00:00', '16:00:00', '17:00:00', '18:00:00'];
}

function getOnlyNumbers(str) {
    return str.replace(/[^0-9]/g,'');
}

function getOnlyLetters(str) {
    return str.replace(/[0-9]/g, '');
}