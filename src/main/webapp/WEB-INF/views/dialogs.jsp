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
<div id="pagewrap" style="padding-bottom: 50%">
    <!--<ХЕДЕР=================================================================================================>-->
    <header id="header">
           <jsp:include page="/WEB-INF/views/header.jsp"/>
    </header>


    <div id="content" class="container people">
        <c:if test="${dialog.size() ==0}">
            <span style="color: #FFFFFF">Dialogs not found</span>
        </c:if>
        <c:forEach items="${dialog}" var="map">
            <c:set var="user" value="${map.userSecond}" />
            <c:if test="${user.username == pageContext.request.userPrincipal.name}">
                <c:set var="user" value="${map.userFirst}" />
            </c:if>
            <div class="row">
                <div class="col-md-3 col-sm-3">
                    <img src="data:${user.profile.avatar.mapperImage.contenttype};base64,${user.profile.avatar.mapperImage.base64}" alt="Avatar" class="img-circle" style="width:100px; height: 100px">
                </div>
                <div class="col-md-3 col-sm-3 people-container">
                    <span class="dialogs-name">${user.firstName} ${user.lastName}</span>
                </div >
                <div class="col-md-3 col-sm-3 people-container">
                    <form method="GET" action="${contextPath}/fromDialogs">
                        <button id="people-send-message" type="submit" value="send message">Open dialog</button>
                        <input type="hidden" value="${user.username}" name="username">
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<script src="${contextPath}/resources/js/jquery-3.2.1.min%20.js"></script>
<script src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/profile.js"></script>
</body>
</html>