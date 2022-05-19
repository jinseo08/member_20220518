<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2022-05-18
  Time: 오후 3:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
</head>
<body>
    <h2>로그인</h2>
    <form action="/login" method="post">
        <input type="text" name="memberId" placeholder="아이디"><br>
        <input type="password" name="memberPassword" placeholder="비밀번호"><br>
        <button>로그인</button>
    </form>
</body>
</html>
