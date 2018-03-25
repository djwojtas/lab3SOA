<%--
  Created by IntelliJ IDEA.
  User: djwojtas
  Date: 2018-03-25
  Time: 23:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html>
<style>
    table, th, td {
        border: 1px solid black;
    }
</style>
<head>
    <title>Lista filmów</title>
</head>
<body>
<h1>Lista filmów</h1>
<table>
    <tr>
        <td><b>Tytul</b></td>
        <td><b>Gatunek</b></td>
        <td><b>Rok</b></td>
        <td><b>Dochod</b></td>
    </tr>
    <c:forEach var="movie" items="${movies}">
        <tr>
            <td>${movie.title}</td>
            <c:choose>
                <c:when test="${movie.type == 'wojenny'}">
                    <td bgcolor="#FF0000">${movie.type}</td>
                </c:when>
                <c:otherwise>
                    <td>${movie.type}</td>
                </c:otherwise>
            </c:choose>
            <td>${movie.year}</td>
            <td>
                <fmt:setLocale value = "en_US"/>
                <fmt:formatNumber value = "${movie.profit}" type = "currency"/>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>