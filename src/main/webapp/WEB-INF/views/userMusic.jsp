<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--
  Created by IntelliJ IDEA.
  User: Dmitro
  Date: 28.05.2017
  Time: 19:35
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>OwlMusic</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap styles -->
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/bootstrap.min.css">
    <!-- Generic page styles -->
    <link rel="stylesheet" href="${contextPath}/resources/css/mymusic.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/font-awesome.min.css">


</head>
<body>
<div id="pagewrap">
    <!--<ХЕДЕР=================================================================================================>-->
    <header id="header">
        <hgroup class="logoname">
            <img src="${contextPath}/resources/img/logoowl.png">
            <h1><a href="#">SpaceOwl Music</a></h1>
        </hgroup>
        <nav>
            <ul id="top-nav">
                <li><a href="#"><img src="${contextPath}/resources/img/13.png">Top Music</a></li>
                <li><a href="#"><img src="${contextPath}/resources/img/team.png">People</a></li>
                <li><a href="#"><img src="${contextPath}/resources/img/user.png"> Profile</a></li>
                <li>
                    <form id="searchform">
                        <input class="inputtext" type="search" placeholder="Search">
                        <input type="submit" value="Search">
                    </form>
                </li>
            </ul>
        </nav>
    </header>
    <div id="content">
        <div id="addtrack" class="col-sm-4">

            <div id="containeraudiolist">
                <c:forEach items="${sounds.sounds}" var="map">

                    <li  style="margin:3%; width: 100%;border-radius: 10px;  background-color: #fafafa;" id="sound${map.id}"
                         class="list-group-item list-group-item-success"><span style="display: block">' + ${map.title} + '</span>
                        <audio src='${map.url}' preload="none" controls/>
                    </li>
                </c:forEach>
            </div>
        </div>

        <div class="col-sm-8">

            <div class="row">


                <c:forEach items="${playlists}" var="map">
                    <div class="col-xs-6 col-md-3 img-playlist">
                        <div class="option_image_container">
                            <a href="${contextPath}/${username}/playlist/${map.id}" class="thumbnail">
                                <img src="${contextPath}/resources/img/audiotrack10.jpeg" alt="cover">
                                <span class="name-play-list">${map.title}</span>
                            </a>
                        </div>

                        <a class="like" href="${contextPath}/profile/playlist/${map.id}"><img
                                src="${contextPath}/resources/img/heart.png"> Like</a>
                    </div>
                </c:forEach>

            </div>

        </div>

        <!-- POPUP ADD PLAYLIST==================================================================================-->

    </div>
</div>
</div>
<script type="text/javascript" src="${contextPath}/resources/js/jquery-1.11.3.min.js"></script>
<script src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/mymusic.js"></script>
</body>
</html>
