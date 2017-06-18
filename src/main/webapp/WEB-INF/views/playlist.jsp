<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<%--
  Created by IntelliJ IDEA.
  User: ЖЛЗК
  Date: 17.05.2017
  Time: 1:25
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
    <link rel="stylesheet" href="${contextPath}/resources/css/playlist.css">

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
                <li><a href="${contextPath}/"><img src="${contextPath}/resources/img/home.png">Home</a></li>
                <li><a href="${contextPath}/people"><img src="${contextPath}/resources/img/team.png">People</a></li>
                <li><a href="${contextPath}/profile/settings"><img src="${contextPath}/resources/img/music-player.png">Settings</a>
                </li>

            </ul>
        </nav>
    </header>
    <div id="content">
        <div id="conteineraddtrack" style="background: url('data: ${sound.bacground.mapperImage.contenttype};base64,${sound.bacground.mapperImage.base64}')") >
            <section id="nameplaylist">
                <img id="baseimgplaylist" src="${contextPath}/resources/img/owlchat.png">
                <div>
                    <<h2>Name playlist: ${sound.title}</h2>
                    <h2>Owner:${sound.profile.user.firstName} ${sound.profile.user.lastName}</h2>

                    <a href="#"> <img  src="${contextPath}/resources/img/pencil.png"></a>
                    <a href="#">  <img  src="${contextPath}/resources/img/delete.png"></a>
                </div>
            </section>
            <section id="addtracks">
                <form id="formaddphoto">
                    <input type="file" name="filefoto" id="file" class="inputfile"  />
                    <label for="file">upload photo</label>
                    <input id="secretValue" name="id_dialog" type="hidden" value="${sound.id}"/>
                    <button id="uploadphoto" type="button">Upload</button>
                </form>
                <a href="#"> <img  src="${contextPath}/resources/img/pencil.png"></a>
                <a href="#">  <img  src="${contextPath}/resources/img/delete.png"></a>
                </form>
            </section>

        </div>
        <form id="formaddmusic">
            <input type="file" name="fileaudio" id="addsingletrack" class="inputfile" MULTIPLE />
            <label for="addsingletrack"> Choose a file</label>
            <input id="secretValue" name="id_dialog" type="hidden" value="${sound.id}"/>
            <button id="uploadtrack" type="button"> Upload</button>
        </form>
        <div id="containeraudiolist">
<c:forEach items="${sound.sounds}" var="map">

            <li style="margin:3%; width: 50%;border-radius: 10px;" class="list-group-item list-group-item-success" id="sound${map.id}">
                <i class="fa fa-trash-o" aria-hidden="true" onclick="deleteSound(${map.id})" ></i>
                <span style="display: block">' + ${map.title} + '</span><audio preload="none" src='${map.url}' controls></audio> </li>
</c:forEach>

        </div>
        <!--ДОБАВЛЕНИЕ ТРЕКОВ===================================================================-->


    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/playlist.js"></script>
</body>
</html></html>