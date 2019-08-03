<%@ page import="pl.jnowacki.Album" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: jedrz
  Date: 03.08.2019
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>MyAlbums</title>
</head>

<style>
    table, th, td {
        border: 1px solid black;
    }
</style>

<body>


<form method="post" action="/JSP_Demo">
    Title:<br><input type="text" name="title"><br>
    Artist:<br><input type="text" name="artist"><br>
    Year:<br><input type="text" name="year"><br>
    Genre:<br><input type="text" name="genre"><br>
    <input type="submit">
</form>

<%
    List<Album> albums = new ArrayList<>();

    Album album1 = new Album();

    album1.setTitle("1st album");
    album1.setArtist("1st artist");
    album1.setYear(2001);
    album1.setGenre("rock");

    Album album2 = new Album();

    album2.setTitle("2nd album");
    album2.setArtist("2nd artist");
    album2.setYear(2002);
    album2.setGenre("blues");

    albums.add(album1);
    albums.add(album2);

    session.setAttribute("albums", albums);
%>
<table>
    <tr>
        <th>Lp.</th>
        <th>Title</th>
        <th>Author</th>
        <th>Year</th>
        <th>Genre</th>
    </tr>

    <%
        for (int i = 0; i < albums.size(); i++) {
    %>
    <tr>
        <td><%= i %>
        </td>
        <td><%= albums.get(i).getTitle()%>
        </td>
        <td><%= albums.get(i).getArtist()%>
        </td>
        <td><%= albums.get(i).getYear()%>
        </td>
        <td><%= albums.get(i).getGenre()%>
        </td>
    </tr>
    <%}%>


</table>

<table>
    <tr>
        <th>Lp.</th>
        <th>Title</th>
        <th>Artist</th>
        <th>Year</th>
        <th>Genre</th>
    </tr>
    <c:forEach items="${sessionScope.albums}" var="album" varStatus="loop">
        <tr>
            <td>${loop.index}</td>
            <td>${album.title}</td>
            <td>${album.artist}</td>
            <td>${album.year}</td>
            <td>${album.genre}</td>
        </tr>
    </c:forEach>

</table>

</body>
</html>
