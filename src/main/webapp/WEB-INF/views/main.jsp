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
    <title>main</title>
</head>
<body>
    <h1>로그인 성공!</h1>
    <h2>회원만 볼 수 있는 페이지입니다.</h2>
    로그인 회원 정보 : ${memberLogin} <br>
    세션에 담은 memberId: ${sessionScope.memberId} <br>
    세션에 담은 id : ${sessionScope.id} <br>
    <a href="/">index로 이동</a><br>
    <button onclick="location.href ='/update-form'">수정</button>
    <button onclick="updateForm()">수정(함수호출)</button>
    <button onclick="location.href ='/logout'">로그아웃</button>
</body>
<script>

    function updateForm(){
//함수정의를 이렇게 해도 위와 똑같은 것 알아두기 : const updateForm = () => {}
        location.href = "/update-form";
    }
</script>
</html>
