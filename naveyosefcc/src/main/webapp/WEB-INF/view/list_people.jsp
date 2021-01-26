<%--
  Created by IntelliJ IDEA.
  User: Yuval
  Date: 7/29/2019
  Time: 18:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>List pepole</title>
</head>
<body>
<table style="width:100%">
    <tr>
        <th>ID</th>
        <th>First name</th>
        <th>Last name</th>
        <th>Birth date</th>
        <th>Gender</th>
        <th>Phone</th>
        <th>Email</th>
    </tr>
    <c:forEach items="${personList}" var="person">
        <tr>
            <td>${person.id}</td>
            <td>${person.firstName}</td>
            <td>${person.lastName}</td>
            <td>${person.birthDate}</td>
            <td>${person.gender}</td>
            <td>${person.phone}</td>
            <td>${person.email}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
