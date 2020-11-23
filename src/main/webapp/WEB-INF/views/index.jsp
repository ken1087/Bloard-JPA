<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Board List</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/board.css">
</head>
<body>
<c:import url="base/header.jsp"></c:import>
<div class="container">
	<div class="searchBox">
		<input type="text" name="searchParam" class="searchVal content form-control form-control" placeholder="내용">
		<button type="button" onclick="searchFun()" class="btn btn-primary" style="margin-left:10px">검색</button>
		<c:choose>
			<c:when test="${search eq 'search'}">
				<button type="button"  onclick="home()" class="btn btn-primary" style="margin-left:10px">홈으로</button>
			</c:when>
		</c:choose>
	</div> 
    <table class="table table-dark table-striped" style="margin-top: 20px">
    	<tr>
    		<td>번호</td>
    		<td>제목</td>
    		<td>작성일</td>
    		<td>수정일</td>
    	</tr>
    	<c:forEach var="item" items="${list}">
    		<tr class="atable">
				<td>${item.id}</td>
				<td><a href="/detail/${item.id }" >${item.title}</a></td>
				<td>${item.createDate}</td>
				<td>${item.updateDate}</td>
			</tr>
    	</c:forEach>
    </table>
    <div style="text-align: right"><a href="/boardWritePage"><button type="button" class="btn btn-primary">글 쓰기</button></a></div>
</div>
<c:import url="base/footer.jsp"></c:import>
<script>
const searchFun = () => {
	location.href = '/search/' + document.querySelector('.searchVal').value;
}

const home = () => {
	location.href = '/home';
}
</script>
</body>
</html>