<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Dmitro
  Date: 30.05.2017
  Time: 1:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>OwlMusic</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap styles -->
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/myfriends.css">

    <style>

        img {
            border-radius: 5px 5px 0 0;
        }

        .container {
            padding: 2px 16px;
        }
    </style>
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
                <li><a href="${contextPath}/"><img src="${contextPath}/resources/img/home.png">Home</a></li>
                <li><a href="${contextPath}/people"><img src="${contextPath}/resources/img/team.png">People</a></li>
                <li><a href="${contextPath}/profile/settings"><img src="${contextPath}/resources/img/music-player.png">Settings</a>
                </li>
            </ul>
        </nav>
    </header>


    <div id="content" class="container people">

            <c:forEach items="${users}" var="map">
                <div class="row">

                    <div class="col-md-3 col-sm-3">
                    <img src="data:${map.profile.avatar.mapperImage.contenttype};base64,${map.profile.avatar.mapperImage.base64}" alt="Avatar" class="img-circle" style="width:100px; height: 100px">
                    </div>

                    <div class="col-md-3 col-sm-3 people-container">
                        <a href="${contextPath}/${map.username}">${map.firstName} ${map.lastName}</a>
                    </div >
                        <div class="col-md-3 col-sm-3 people-container">
                        <form >
                            <button type="submit" id="add-friend" value="add in friend">Add to friend</button>
                        </form>
                        </div>
                </div>
            </c:forEach>

    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/mymusic.js"></script>
</body>
</html>