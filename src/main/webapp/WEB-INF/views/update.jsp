<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2022-05-20
  Time: 오전 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <h2>update.jsp</h2>
  <form action="/update" method="post" name="updateForm">
      <p>관리번호</p>
      <input type="text" name="id" value="${updateMember.id}" readonly><br>
      <p>아이디</p>
      <input type="text" name="memberId" value="${updateMember.memberId}" readonly><br>
      <p>비밀번호</p>
      <input type="password" id="pwConfirm" placeholder="비밀번호를 입력하세요"><br>
      <p>이름</p>
      <input type="text" name="memberName" value="${updateMember.memberName}" readonly><br>
      <p>나이</p>
      <input type="text" name="memberAge" value="${updateMember.memberAge}" readonly><br>
      <p>전화번호</p>
      <input type="text" name="memberPhone" value="${updateMember.memberPhone}"><br>
      <input type="button" onclick="update()" value="정보수정">
  </form>
</body>
<script>
    function update(){
        console.log("update 함수호출");
        //사용자가 입력한 비밀번호 값 가져오기
        const pwConfirm = document.getElementById("pwConfirm").value;
        //DB에서 가져온 비밀번호 가져오기
        const pwDB = "${updateMember.memberPassword}";
        console.log("pwConfirm: " + pwConfirm + " pwDB :" + pwDB);
        // 비밀번호 일치하면 form태그에 입력한 내용을 컨트롤러로 요청
        // 일치하지 않으면 alert으로 비밀번호 틀린다고 보여줌
        if(pwConfirm == pwDB){
            updateForm.submit(); //해당 폼을 submit 하는 js함수  form태그name.submit()
        }else{
            alert("비밀번호가 틀립니다.")
        }
    }
</script>
</html>
