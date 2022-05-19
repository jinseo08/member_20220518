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
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>
<body>
    <h2>회원 전체목록</h2>
    <table class="table table-striped">
        <tr>
            <th>아이디</th>
            <th>아이디</th>
            <th>비밀번호</th>
            <th>이름</th>
            <th>나이</th>
            <th>번호</th>
            <th>조회</th>
            <th>삭제</th>
        </tr>
        <c:forEach var="member" items="${memberList}">
        <tr>
            <td>${member.id}</td>
            <td>${member.memberId}</td>
            <td>${member.memberPassword}</td>
            <td>${member.memberName}</td>
            <td>${member.memberAge}</td>
            <td>${member.memberPhone}</td>
            <td><a href="/detail?id=${member.id}">조회</a> </td>
            <!-- 클릭한 회원의 정보를 DB에서 가져와서 detail.jsp에 출력 -->
        </tr>
        </c:forEach>
    </table>
</body>
</html>
