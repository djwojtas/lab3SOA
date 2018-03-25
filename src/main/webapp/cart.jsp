<%@ page import="com.agh.shop.Item" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>shop</title>
  </head>
  <body>

  <jsp:useBean id = "cart" scope="session" class = "com.agh.shop.CartBean" />


  <%
    if(request.getParameter("removeItemID") != null) {
      cart.removeItem(request.getParameter("removeItemID"));
    }
  %>

  <h3>Koszyk:</h3>

  <c:if test="${empty cart.items}">
    Koszyk jest pusty!
  </c:if>

  <c:forEach items="${cart.items}" var="item">
    <br>
    <br><b><c:out value="${item.name}"/></b>
    <br>Cena za sztuke: <c:out value="${item.price}"/>
    <br>Sztuk: <c:out value="${item.quantity}"/>
    <br>
    <form action="cart.jsp" method="post">
      <input type="submit" value="usun z koszyka">
      <input type="hidden" name="removeItemID" value="<c:out value="${item.id}"/>">
    </form>
    <br>
  </c:forEach>

  <br>
  <br><a href="shop.jsp">Powrót do sklepu</a>

  </body>
</html>