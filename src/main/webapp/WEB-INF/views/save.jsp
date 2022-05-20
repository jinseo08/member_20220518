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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <h2>회원가입</h2>
    <form action="/save" method="post">
        <p>아이디</p>
        <input type="text" name="memberId" placeholder="아이디" onblur="duplicateCheck()" id="memberId"><br>
        <div id="dup-check-result"></div>
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
    function duplicateCheck(){
        console.log("함수호출 성공");
        const memberId = document.getElementById("memberId").value;
        const checkResult = document.getElementById("dup-check-result");
        $.ajax({
            type : "post", //http request method
            url : "duplicateCheck", //요청주소(컨트롤러 주소값)
            data : {"memberId" : memberId}, //전송하는 파라미터
            dataType : "text", //리턴받을 데이터 형식
            success : function (result){
                if(result == "ok"){
                    checkResult.innerHTML = "사용 가능한 아이디 입니다.";
                    checkResult.style.color = "green";
                }else{
                    checkResult.innerHTML = "이미 사용중인 아이디 입니다.";
                    checkResult.style.color = "red";
                }
            },
            error : function (){
                alert("오타 체크");
            }
        });
    }
</script>
</html>
