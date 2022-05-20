<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2022-05-18
  Time: 오후 3:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>signup</title>
</head>
<body>
    <h2>회원가입</h2>
    <form action="/save" method="post">
        <p>아이디</p>
        <input type="text" name="memberId" placeholder="아이디"><br>
        <p>비밀번호</p>
        <input type="password" name="memberPassword" placeholder="비밀번호"><br>
        <p>이름</p>
        <input type="text" name="memberName" placeholder="이름"><br>
        <p>나이</p>
        <input type="text" name="memberAge" placeholder="나이"><br>
        <p>전화번호</p>
        <input type="text" name="memberPhone" placeholder="전화번호"><br>
        <input type="submit" value="가입">
    </form>
</body>
</html>
