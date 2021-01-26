<%--
  Created by IntelliJ IDEA.
  User: Yuval
  Date: 21/10/2019
  Time: 16:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Extract Data Example</title>
</head>
<body>
    <h1>Two ways to get data from the database:</h1><br>
    <h3>#1 Using a get request (data will be loaded on page startup):</h3>
        <table border="1">
            <tr>
                <th>Teacher ID</th>
                <th>Pupil ID</th>
                <th>Date</th>
                <th>Type</th>
                <th>Score</th>
            </tr>
            <c:forEach items="${map}" var="entry">
                <c:forEach items="${entry.value}" var="dto">
                    <tr>
                        <td>${dto.teacherId}</td>
                        <td>${dto.pupilId}</td>
                        <td>${dto.lessonDate}</td>
                        <td>${dto.lessonType}</td>
                        <td>${dto.score}</td>
                    </tr>
                </c:forEach>
            </c:forEach>
        </table>

    <h3>#2 Using a post request to get data for a specific teacher:</h3>
    <form id="sub" method="post" action="/admin/processExample">
        Teachers ID: <input type="text" id="tId"> <input type="submit">
    </form>

    <table id="postEx" border="1">

    </table>


    <script src="/js/jquery.min.js"></script>
    <script>
        window.onload = function() {
            event.preventDefault();
            var form = $("#sub");
            var formData = {};
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
        }

       /* $("#sub").on('submit', function (event) {
           event.preventDefault();
           var form = $(this);
           var formData = {};
           formData['id'] = $("#tId").val();
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
        });*/

        function callBack(response) {
            console.log(response);

                $("#postEx").html("");
                var content = "<tr>\n" +
                    "<th>Teacher ID</th>\n" +
                    "<th>Pupil ID</th>\n" +
                    "<th>Date</th>\n" +
                    "<th>Type</th>\n" +
                    "<th>Score</th>\n" +
                    "</tr>";
                $.each(response, function (key, val) {
                    if(val['teacherId']=='266391553') {
                        content += "<tr>"
                        content += "<td>";
                        content += val['teacherId'];
                        content += "</td>";
                        content += "<td>";
                        content += val['pupilId'];
                        content += "</td>";
                        content += "<td>";
                        content += val['lessonDate'];
                        content += "</td>";
                        content += "<td>";
                        content += val['lessonType'];
                        content += "</td>";
                        content += "<td>";
                        content += val['score'];
                        content += "</td>";
                        content += "</tr>";
                    }
                });
                $("#postEx").append(content);

        }
    </script>
</body>
</html>
