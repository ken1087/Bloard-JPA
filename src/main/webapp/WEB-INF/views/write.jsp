<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Write</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/board.css">
</head>
<body>
<c:import url="base/header.jsp"></c:import>
<div class="container">
	<h3 style="text-align:left">글 쓰기</h3>
	<form action="/boardWrite" method="POST">
		<input type="text" name="title" class="form-control form-control" placeholder="제목" required="required">
		<textarea name="content" class="form-control form-control" placeholder="내용 입력해 주세요" style="resize: none; height:300px; margin-top: 20px" required="required"></textarea>
		<button type="submit" class="btn btn-primary">등록</button>
		<button type="button" class="btn btn-primary">뒤로가기</button>
	</form>
</div>
<c:import url="base/footer.jsp"></c:import>
</body>
</html>