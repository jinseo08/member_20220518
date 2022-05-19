<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2022-05-18
  Time: 오후 3:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <a href="save-form">회원가입</a><br>
    <a href="login-form">로그인 페이지</a><br>
    <a href="findAll">회원목록출력</a><br>

    로그인 회원 정보 : ${memberLogin}<br>
    세션에 담은 memberId: ${sessionScope.memberId}<br>
    세션에 담은 id : ${sessionScope.id}<br>
</body>
</html>
