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
        <input type="text" name="memberId" placeholder="아이디" id="id" onblur="id_check()"><br>
        <div id="id_check_result"></div>
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
<script>
    function id_check(){
        var id_check = document.getElementById("id").value;
        var result = document.getElementById("id_check_result")
        /* 아이디 : 5~20자의 영어 소문자와 숫자만 사용가능 */
        const exp = /^[a-z\d]{5,20}$/;
        if(id_check.match(exp)){
            result.innerHTML = "좋은 아이디 입니다"
            result.style.color = "green"
        }else if(id_check.length == 0){
            result.innerHTML = "필수정보 입니다"
            result.style.color = "red"
        }
        else{
            result.innerHTML = "5~20자의 영어 소문자와 숫자만 사용가능합니다"
            result.style.color = "red"
        }
    }
</script>
</html>
