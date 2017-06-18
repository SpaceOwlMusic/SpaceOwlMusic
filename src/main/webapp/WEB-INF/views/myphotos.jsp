<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Dmitro
  Date: 28.05.2017
  Time: 22:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<body>
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
    <link rel="stylesheet" href="${contextPath}/resources/css/myphotos.css">
</head>
<body>
<div id="pagewrap">
    <div id="content">
        <!--<ХЕДЕР=================================================================================================>-->
        <header id="header">
            <jsp:include page="/WEB-INF/views/header.jsp"/>
        </header>
        <section class="userphoto">
            <!--<Второй ПОПАП ДОБАВЕНИЕ ФОТО===========================================================>-->
            <button data-photo="photo" id="userfotka" class="addphoto">
                Add photos
            </button>
            <div id="containerfoto">
                <div id="conteinerrow" class="row">
                    <c:forEach items="${photos}" var="map">
                    <div class="col-xs-6 col-md-3"><img width="150px" height="150px" class="thumbnail"
                                                        src="data:${map.mapperImage.contenttype};base64,${map.mapperImage.base64}"></div>
                    </c:forEach>
                </div>
            </div>


    <div class="popup" id="photo">
        <div class="popup-inner">
            <div class="popup-close">X</div>
            <div class="container">
                <h2>Add photo</h2>
                <img src="${contextPath}/resources/img/camera.png">
            </div>
            <article>Enter the description of photo</article>
            <br>
            <div class="input-group">
                <span class="input-group-addon" id="sizing-addon2"> File description </span>
                <input type="text" class="form-control" placeholder="Description" aria-describedby="sizing-addon2">
            </div>
            <form id="formaddphoto">
                <input type="file" name="filefoto" id="file" class="inputfile" multiple/>
                <label for="file"> Choose a file</label>
                <button id="uploadphoto" type="button">Upload</button>
            </form>


        </div>
    </div>

    </div>
</section>
</div>
<script src="${contextPath}/resources/js/jquery-3.2.1.min%20.js"></script>
<script src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/myphotos.js"></script>

</body>
</html>