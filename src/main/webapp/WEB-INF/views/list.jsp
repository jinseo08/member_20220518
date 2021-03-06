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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>
<body>
    <h2>회원 전체목록</h2>
    <table class="table table-striped">
        <tr>
            <th>관리번호</th>
            <th>아이디</th>
            <th>비밀번호</th>
            <th>이름</th>
            <th>나이</th>
            <th>전화번호</th>
            <th>조회</th>
            <th>삭제</th>
            <th>ajax조회</th>
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
            <td><a href="delete?id=${member.id}">삭제</a> </td>
            <td><button onclick="detailByAjax('${member.id}')">조회</button></td>
        </tr>
        </c:forEach>
    </table>
    <div id="detail"></div>
</body>
<script>
    const detailByAjax = (id) => {
        console.log(id);
        const detail = document.getElementById("detail");
        $.ajax({
            type: "get", // http request method
            url: "detail-ajax", // 요청주소(컨트롤러 주소값)
            data: {"id": id}, // 전송하는 파라미터
            dataType: "json", // 리턴받을 데이터 형식
            //json : 자바스크립트의 데이터 타입으로 문자열, 정수형 등 모든 타입을 담을 수 있음
            success: function (result) {
                console.log(result)
                let output = "<table class='table table-striped'>";
                output += "<tr>" +
                    "<th>관리번호</th> <th>아이디</th> <th>비밀번호</th> <th>이름</th>" +
                    "<th>나이</th> <th>전화번호</th> " +
                    "</tr>";
                output += "<tr>";
                output += "<td>" + result.id                  + "</td>";
                output += "<td>" + result.memberId            + "</td>";
                output += "<td>" + result.memberPassword      + "</td>";
                output += "<td>" + result.memberName          + "</td>";
                output += "<td>" + result.memberAge           + "</td>";
                output += "<td>" + result.memberPhone         + "</td>";
                output += "</tr>";
                output += "</table>";

                detail.innerHTML = output;
            },
            error: function () {
                alert("오타체크"); //생략 가능 (쉽게 if else 개념으로 알아두기)
            }
        });

    }
</script>
</html>
