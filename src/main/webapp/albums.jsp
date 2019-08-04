<%@ page import="pl.jnowacki.Album" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: jedrz
  Date: 03.08.2019
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>

<%--zdefniowane kodowanie strony--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--Expression language jest włączony--%>
<%@ page isELIgnored="false" %>
<%--JSTL jest włączony--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>MyAlbums</title>
</head>

<%--styl do obramowania tabelki--%>
<style>
    table, th, td {
        border: 1px solid black;
    }
</style>

<body>

<%--Formularz z polami. Nazwy pól (atrybut 'name' odpowiadają nazwom setterów w klasie--%>
<%--Ukryte pole pozwala sprawdzić, czy formularz został wysłany, czy też strona jest
otwarta po raz pierwszy--%>
<form method="post">
    <input type="hidden" name="submitted" value="true">
    Title:<br><input type="text" name="title"><br>
    Artist:<br><input type="text" name="artist"><br>
    Year:<br><input type="text" name="year"><br>
    Genre:<br><input type="text" name="genre"><br>
    <input type="submit">
</form>

<%--Czy formularz został wysłany (submitted == true)?--%>
<c:if test="${param.submitted}">

    <%--Użycie java beans - zadeklarowanie beana--%>
    <jsp:useBean id="newAlbum" class="pl.jnowacki.Album"/>
    <%--Użycie java beans - przypisanie przez settery wartość z formularza--%>
    <jsp:setProperty name="newAlbum" property="*"/>

    <c:choose>

        <%--czy metoda isValid albumu zwraca true--%>
        <c:when test="${newAlbum.valid}">

            <%--zwraca true - dodaj album--%>
            <%
                ((List<Album>)session.getAttribute("albums")).add(newAlbum);
            %>
        </c:when>
        <c:otherwise>
            <%--zwraca false - wyświetl komunikat--%>
            <h1>Album data invalid!<br></h1>
        </c:otherwise>
    </c:choose>
</c:if>

<table>
    <tr>
        <th>Lp.</th>
        <th>Title</th>
        <th>Artist</th>
        <th>Year</th>
        <th>Genre</th>
    </tr>
    <%--iterujemy się po wszystkich elementach listy albumów, przechowywanej w sesji--%>
    <c:forEach items="${sessionScope.albums}" var="album" varStatus="loop">
        <tr>
            <%--używamy expression language żeby wyświetlić kolejne pola--%>
            <td>${loop.count}</td>
            <td>${album.title}</td>
            <td>${album.artist}</td>
            <td>${album.year}</td>
            <td>${album.genre}</td>
        </tr>
    </c:forEach>

</table>

</body>
</html>