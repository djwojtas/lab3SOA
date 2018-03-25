<%-- Created by IntelliJ IDEA. --%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>guessnum</title>
  </head>
  <body>
    <c:set var="rand" value="${param.rand}" />
    <c:set var="tries" value="${(empty param.tries) ? 0 : (param.tries + 1)}" />
    <c:if test="${empty rand}">
      <c:set var="rand" scope = "request"><%= Long.toString(java.lang.Math.round(java.lang.Math.random() * 100)) %></c:set>
    </c:if>

    <c:if test="${!empty param.guess}">
      <fmt:parseNumber var="parsedGuess" value="${param.guess}" integerOnly="true"/>
      <fmt:parseNumber var="parsedRandom" value="${rand}" integerOnly="true"/>
      <c:choose>
        <c:when test="${rand.equals(param.guess)}">
          <font color="red">YOU GUESSED RIGHT! (${rand}) IT TOOK YOU ${tries} TRIES!</font>
          <c:set var="rand" scope = "request"><%= Long.toString(java.lang.Math.round(java.lang.Math.random() * 100)) %></c:set>
          <c:set var="tries" value="0" />
        </c:when>
        <c:when test="${parsedGuess > parsedRandom}">
          Secret number is smaller.
        </c:when>
        <c:when test="${parsedGuess < parsedRandom}">
          Secret number is larger.
        </c:when>
      </c:choose>
    </c:if>

    <form action="index.jsp" method="get">
      <input type="hidden" name="tries" value="${tries}">
      <input type="hidden" name="rand" value="${rand}">
      <input type="text" name="guess"> <br>
      <input type="submit" value="TRY">
    </form>
  </body>
</html>