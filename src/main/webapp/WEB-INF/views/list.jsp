<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2022-05-18
  Time: 오후 3:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>list</title>
</head>
<body>
    <h2>회원 전체목록</h2>
    <c:forEach var="member" items="${memberList}">
        ${member.memberId}
        ${member.memberPassword}
        ${member.memberName}
        ${member.memberAge}
        ${member.memberPhone}<br>
    </c:forEach>
</body>
</html>
