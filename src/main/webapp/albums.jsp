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
    Title:<br><input type="text" name="title"><br>
    Artist:<br><input type="text" name="artist"><br>
    Year:<br><input type="text" name="year"><br>
    Genre:<br><input type="text" name="genre"><br>
    <input type="submit">
</form>

<c:if test="${requestScope.invalid}">
    <h1>Album data invalid!</h1>
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