<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--Created by IntelliJ IDEA.--%>
<%--User: Dmitro--%>
<%--Date: 11.05.2017--%>
<%--Time: 17:04--%>
<%--To change this template use File | Settings | File Templates.--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>

<head>


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Chat OwlSpase</title>

    <link rel="stylesheet" href="http://cdn.jsdelivr.net/emojione/1.3.0/assets/css/emojione.min.css"/>
    <link rel="stylesheet" href="${contextPath}/resources/css/styles.css"/>

</head>

<body>

<div class="shoutbox">

    <h1>Live <img src='${contextPath}/resources/img/refresh.png'/></h1>

    <ul class="shoutbox-content">
<%--        <c:forEach items="${messages}" var="map">

        <li><span class="shoutbox-username">${map.sender.username}: </span>
            <p class="shoutbox-comment">${map.message}</p>
            <div class="shoutbox-comment-details"><span class="shoutbox-comment-reply" data-name="' + d.name + '"></span><span
                    class="shoutbox-comment-ago">' + d.timeAgo + '</span></div>
        </li>

    </c:forEach>--%>

    </ul>

    <div class="shoutbox-form">
        <h2>Leave a message <span>×</span></h2>
        <form >
            <label class="shoutbox-comment-label" for="shoutbox-comment">Message </label> <textarea
                id="shoutbox-comment" name="comment" maxlength='240'></textarea>
            <input type="submit" value="Shout!"/>
        </form>
    </div>

</div>

<input type="hidden" name="idDialog" id="idDialog" value="${id}"/>

<input type="hidden" name="idSelf" id="idSelf" value="${idSelf}"/>


<script src="${contextPath}/resources/js/jquery-3.2.1.min%20.js"></script>
<script src="http://cdn.jsdelivr.net/emojione/1.3.0/lib/js/emojione.min.js"></script>
<script src="${contextPath}/resources/js/script.js"></script>

</body>

</html>