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

    <link rel="stylesheet" href="${contextPath}/resources/css/profile.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/settings.css">
</head>
<body>
<div id="pagewrap">
    <!--<ХЕДЕР=================================================================================================>-->
    <header id="header">
        <jsp:include page="/WEB-INF/views/header.jsp"/>
    </header>
    <div class="settings-style-h2">
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
                        <input type="radio" name="gender" class="gender" value="male" checked><span>Male</span> <br>
                        <input type="radio" name="gender" class="gender" value="female"><span>Female</span> <br>
                        <input type="radio" name="gender" class="gender" value="other"> <span>Other </span>
                        </c:when>
                        <c:when test="${user.gender.equals('female')}">
                        <input type="radio" name="gender" class="gender" value="male"><span> Male</span> <br>
                        <input type="radio" name="gender" class="gender" value="female" checked><span>Female</span> <br>
                        <input type="radio" name="gender" class="gender" value="other" checked> <span>Other </span>
                        </c:when>
                        <c:when test="${user.gender.equals('other')}">
                        <input type="radio" name="gender" class="gender" value="male"><span> Male</span> <br>
                        <input type="radio" name="gender" class="gender" value="female"><span>Female</span> <br>
                        <input type="radio" name="gender" class="gender" value="other checked" checked>
                        <span>Other </span>
                        </c:when>

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
                                <option  selected="selected">Other</option>
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