<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Dmitro
  Date: 11.05.2017
  Time: 12:41
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@page language="java" session="true" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>OwlMusic</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap styles -->
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/bootstrap.min.css">
    <!-- Generic page styles -->
    <link rel="stylesheet" href="${contextPath}/resources/css/profile.css">
</head>
<body>
<div id="pagewrap">
    <!--<ХЕДЕР=================================================================================================>-->
    <header id="header">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
        </form>

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
                <li><a href="${contextPath}/people"><img src="${contextPath}/resources/img/team.png">People</a></li>
                <li><a href="${contextPath}/profile/settings"><img src="${contextPath}/resources/img/music-player.png">Settings</a>
                </li>

            </ul>
        </nav>
    </header>
    <!--<НАЧАЛО КОНТЕНТА======================================================================================>-->
    <div id="content">
        <div class="userpage">
            <section class="userinfo">
                <!--<div class="userfotka">-->
                <div>
                    <span style="margin: auto;text-align: center"><h3>${user.firstName} ${user.lastName} </h3></span>
                    <div class="img-circle" id="imgContainer">
                        <img id="baseimg" class="img-circle"
                             src="data:${user.profile.avatar.mapperImage.contenttype};base64,${user.profile.avatar.mapperImage.base64}">

                    </div>
                        <form method="GET" action="${contextPath}/dialog">
                        <button id="people-send-message" type="submit" value="send message">Send message</button>>
                        <input type="hidden" value="${user.id}" name="id">
                    </form>

                </div>
                <!--<img style="width: 100px; height: 100px;" src="img/owlchat.png" alt="fotouser">-->
                <!--</div>-->


                <ul class="list-group">
                    <li class="list-group-item">
                        <span class="badge">14</span>
                        <a href="#">Friends </a>
                    </li>
                </ul>
                <ul class="list-group">
                    <li class="list-group-item">
                        <span class="badge">14</span>
                        <a href="${contextPath}/${user.username}/sound"> Music </a>
                    </li>
                </ul>
            </section>
            <section class="maininfo">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab"
                                                              data-toggle="tab">Wall</a></li>
                    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">General
                        Information</a></li>
                    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">
                        Interests</a></li>
                    <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Events</a>
                    </li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="home">
                        <form class="wallnews">
                            <input type="text" name="author" id="userermews"/>
                            <button class="publish"> Publish</button>
                        </form>
                        <div class="actionwall">
                            <!--<img src="img/picture.png">-->
                        </div>
                    </div>

                    <!--<ВКЛАДКА ОБЩАЯ ИНФОРМАЦИЯ================================================================>-->
                    <div role="tabpanel" class="tab-pane" id="profile">
                        <h2>Name: ${user.firstName}</h2>
                        <h2>Last Name: ${user.lastName}</h2>
                        <h2>Email: ${user.email}</h2>
                        <h2>Gender: ${user.gender}</h2>
                        <h2>Relationship status: ${user.relationship}</h2>
                    </div>

                    <!--<ВКЛАДКА ИНТЕРЕСЫ=====================================================================>-->
                    <div role="tabpanel" class="tab-pane" id="messages">
                        <h2>Favorite music: ${user.profile.description.favoriteMusic}</h2>
                        <h2>Hobbies: ${user.profile.description.hobbies}</h2>
                        <h2>About me: ${user.profile.description.aboutYourself}</h2>
                        <h2>Source of inspiration: ${user.profile.description.inspiration}</h2>
                        <h2>My kind of music: ${user.profile.description.musicCompose}</h2>
                        <h2>Other in: ${user.profile.description.otherInformation}</h2>

                    </div>
                    <!--<ВКЛАДКА СОБЫТИЯ =====================================================================>-->
                    <div role="tabpanel" class="tab-pane" id="settings">...</div>
                </div>
            </section>
        </div>
        <footer><span>©2017 SpaceOwlMusic  All rights reserved.</span></footer>
    </div>
</div>
<script src="${contextPath}/resources/js/jquery-3.2.1.min%20.js"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<script src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/profile.js"></script>
</body>
</html>