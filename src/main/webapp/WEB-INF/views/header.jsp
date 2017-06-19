<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ЖЛЗК
  Date: 18.06.2017
  Time: 21:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/profile.css">
</head>

<form id="logoutForm" method="POST" action="${contextPath}/logout">
</form>
<body>
<header>
<hgroup class="logoname">
    <img src="${contextPath}/resources/img/logoowl.png">
    <h1><a href="#">SpaceOwl Music</a></h1>
    <img id="imglogout" src="${contextPath}/resources/img/exit.png">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <a id="logout" onclick="document.forms['logoutForm'].submit()"> Logout</a></c:if>
</hgroup>
<nav>
    <ul id="top-nav">
        <li><a href="${contextPath}/"><img src="${contextPath}/resources/img/home.png">Home</a></li>
        <li><a href="${contextPath}/${pageContext.request.userPrincipal.name}"><img src="${contextPath}/resources/img/profile.png">Profile</a></li>
        <li><a href="${contextPath}/people"><img src="${contextPath}/resources/img/team.png">People</a></li>
        <li><a href="${contextPath}/profile/settings"><img src="${contextPath}/resources/img/music-player.png">Settings</a>
        </li>
    </ul>
</nav>
</header>
</body>
</html>
