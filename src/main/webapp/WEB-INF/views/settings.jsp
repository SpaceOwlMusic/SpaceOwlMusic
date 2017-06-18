<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--
  Created by IntelliJ IDEA.
  User: Dmitro
  Date: 28.05.2017
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

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
    <link rel="stylesheet" href="${contextPath}/resources/css/settings.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/profile.css">
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
    <section id="forminfochange">
        <form method="POST" action="javascript:void(null);" onsubmit="callFirstBlock()" class="form-signin">
            <div class="form-group">
                <h2>General Info</h2>
                <label for="email">Email address:</label>
                <input type="email" class="form-control" id="email" name="email" value="${user.email}">
            </div>
            <div class="form-group">
                <label> Name:</label>
                <input type="text" name="first_name" class="form-control" value="${user.firstName}">
            </div>
            <div class=" form-group">
                <label>Last name:</label>
                <input type="text" name="last_name" class="form-control" value="${user.lastName}">
            </div>
            <div class="checkbox">
                <h2>Gender</h2>
                <c:choose>

                    <c:when test="${user.gender.equals('male')}">
                        <label class="checkbox-inline"><input type="checkbox" name="gender" checked value="1">Male</label>
                        <label class="checkbox-inline"><input type="checkbox" name="gender" value="2">Female</label>
                        <label class="checkbox-inline"><input type="checkbox" name="gender" value="3">Other</label> </c:when>
                    <c:when test="${user.gender.equals('female')}">
                        <label class="checkbox-inline"><input type="checkbox" class="gender" value="1">Male</label>
                        <label class="checkbox-inline"><input type="checkbox" class="gender" checked value="2">Female</label>
                        <label class="checkbox-inline"><input type="checkbox" class="gender" value="3">Other</label> </c:when>
                    <c:when test="${user.gender.equals('other')}">
                        <label class="checkbox-inline"><input type="checkbox" class="gender" value="1">Male</label>
                        <label class="checkbox-inline"><input type="checkbox" class="gender" value="2">Female</label>
                        <label class="checkbox-inline"><input type="checkbox" class="gender" checked value="3">Other</label> </c:when>

                </c:choose>

            </div>
            <div class="form-group">
                <label for="sel1">Relationship status:</label>
                <select class="form-control" id="sel1">

                    <c:choose>
                        <c:when test="${user.relationship==null}">
                            <option selected="selected">not selected</option>
                            <option>Other</option>
                            <option>Single</option>
                            <option>In a relationship</option>
                            <option>Married</option>
                        </c:when>
                        <c:when test="${user.relationship.equals('Other')}">
                            <option selected selected="selected">Other</option>
                            <option>Single</option>
                            <option>In a relationship</option>
                            <option>Married</option>
                        </c:when>

                        <c:when test="${user.relationship.equals('Single')}">
                            <option selected>Other</option>
                            <option selected="selected">Single</option>
                            <option>In a relationship</option>
                            <option>Married</option>
                        </c:when>

                        <c:when test="${user.relationship.equals('In a relationship')}">
                            <option selected>Other</option>
                            <option>Single</option>
                            <option selected="selected">In a relationship</option>
                            <option>Married</option>
                        </c:when>

                        <c:when test="${user.relationship.equals('Married')}">
                            <option selected>Other</option>
                            <option>Single</option>
                            <option>In a relationship</option>
                            <option selected="selected">Married</option>
                        </c:when>


                    </c:choose>

                </select>
            </div>
            <button type="submit" class="btn btn-default">Submit</button>
        </form>


        <form>

            <h2>Interests</h2>
            <div class="form-group">
                <label>Favorite music:</label>
                <textarea class="form-control" rows="4">${user.profile.description.favoriteMusic}</textarea>
            </div>
            <div class="form-group">
                <label>Hobbies:</label>
                <textarea class="form-control" rows="4">${user.profile.description.hobbies}</textarea>
            </div>


            <div class="form-group">
                <label>Tell about yourself:</label>
                <textarea class="form-control" rows="4">${user.profile.description.aboutYourself}</textarea>
            </div>
            <button type="submit" class="btn btn-default">Submit</button>
        </form>
        <form>

            <h2>Inspiration</h2>
            <div class="form-group">
                <label>Your source of inspiration:</label>
                <textarea class="form-control" rows="4">${user.profile.description.inspiration}</textarea>
            </div>
            <div class="form-group">
                <label>Wich music do you compose:</label>
                <textarea class="form-control" rows="4">${user.profile.description.musicCompose}</textarea>
            </div>

            <div class="form-group">
                <label>Other information:</label>
                <textarea class="form-control" rows="4">${user.profile.description.otherInformation}</textarea>
            </div>


            <button type="submit" class="btn btn-default">Submit</button>
        </form>
    </section>
</div>
</div>
<script type="text/javascript" src="${contextPath}/resources/js/jquery-1.11.3.min.js"></script>

<script src="${contextPath}/resources/js/setting.js"></script>

</body>
</html>