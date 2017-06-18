<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Dmitro
  Date: 09.05.2017
  Time: 13:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%--dialog :  ${login.toString()}--%>



<c:if test="${not empty dialogs}">

    <ul>
        <c:forEach var="listValue" items="${dialogs}">
            <form method="GET" action="${contextPath}/profile/dialog/chat">
                <%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
                    <input id="secretValue" name="id_dialog" type="hidden" value="${listValue.id}"/>
                    <%--${person.currentIdDialog=listValue.id}--%>
                <button class="btn btn-lg btn-primary btn-block" type="submit">you dialog with
                    <h1>${listValue.userFirst.username}</h1> with <h1>${listValue.userSecond.username}</h1></button>
            </form>
        </c:forEach>

    </ul>


</c:if>
</body>
</html>
