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
    if(request.getParameter("itemID") != null) {
      cart.addItem(new Item(
              request.getParameter("itemID"),
              request.getParameter("itemName"),
              request.getParameter("itemPrice"),
              1
      ));
    }
  %>

  <c:import var="itemsXML" url="items.xml"/>
  <x:parse xml="${itemsXML}" var="items" />

  <x:forEach select = "$items/computer_parts/part" var = "item">
    <br>Przedmiot <x:out select = "name" />
    <br>Cena: <x:out select = "price" />
    <br>
    <form action="shop.jsp" method="post">
      <input type="submit" value="dodaj do koszyka">
      <input type="hidden" name="itemID" value="<x:out select = '@ID' />">
      <input type="hidden" name="itemName" value="<x:out select = 'name' />">
      <input type="hidden" name="itemPrice" value="<x:out select = 'price' />">
    </form>
  </x:forEach>

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
  </c:forEach>

  <br>
  <br><a href="cart.jsp">KOSZYK</a>

  </body>
</html>