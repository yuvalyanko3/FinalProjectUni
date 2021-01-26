<%--
  Created by IntelliJ IDEA.
  User: Yuval
  Date: 8/19/2019
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title></title>
</head>
<body>
    <form:form action="/logout" method="post" id="lout"></form:form>
    <script src="/js/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
           $("#lout").submit();
        });
    </script>
</body>
</html>
