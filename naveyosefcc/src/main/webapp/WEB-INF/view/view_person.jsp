<%--
  Created by IntelliJ IDEA.
  User: Yuval
  Date: 7/29/2019
  Time: 19:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>View person</title>
</head>
<body>
    <form:form action="/view_person_res" method="get">
        <input name="id" type="text" />
        <input type="submit" value="Click">
    </form:form>
    <c:if test="${reqPerson != null}">
        ID:         ${reqPerson.id}<br>
        First name: ${reqPerson.firstName}<br>
        Last name:  ${reqPerson.lastName}<br>
    </c:if>
</body>
</html>
