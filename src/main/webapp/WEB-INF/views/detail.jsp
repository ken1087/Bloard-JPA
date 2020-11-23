<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Detail</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/board.css">
</head>
<body>
<c:import url="base/header.jsp"></c:import>
<div class="container">
	<h3 style="text-align:left">글 조회</h3>
	<form action="/boardUpdate" method="POST"  onsubmit="return updateProc()">
		<input type="text" name="id" value="${board.id }"  style="display:none" readOnly /> 
		<input type="date" name="createDate" value="${board.createDate }"  style="display:none" readOnly /> 
		<input type="text"  name="title" value="${board.title }"  class="title form-control form-control" placeholder="제목" required="required" readOnly />
		<textarea name="content"  class="content form-control form-control" placeholder="내용 입력해 주세요" style="resize: none; height:300px; margin-top: 20px" required="required" readOnly>${board.content }</textarea>
		<div class="updateDelete">
			<button type="button" class="btn btn-primary" onclick="updateBtn()">수정</button>
			<button type="button" class="btn btn-primary" onclick="deleteBoard(${board.id })">삭제</button>
		</div>
		<div class="updateProc" style="display:none">
			<button type="submit" class="btn btn-primary" >수정</button>
			<button type="button" class="btn btn-primary" onclick="cencal()">취소</button>
		</div>
	</form>
</div>
<c:import url="base/footer.jsp"></c:import>
<script>
const deleteBoard = (id) => {
/* 	if(confirm("등록하시겠습니까 ?")){
		location.href = '/boardDelete/' + id;
	}else{
		return false;
	} */
	location.href = confirm("삭제 하시겠습니까 ?") == true ? location.href = '/boardDelete/' + id : false;
}

const updateProc = () => {
	return confirm("수정 하시겠습니까 ?");
}

const updateBtn = () => {
	document.querySelector('.updateDelete').style.display = 'none';
	document.querySelector('.updateProc').style.display = 'block';
	document.querySelector('.title').readOnly = false;
	document.querySelector('.content').readOnly = false;
}

const cencal = () => {
	document.querySelector('.updateDelete').style.display = 'block';
	document.querySelector('.updateProc').style.display = 'none';
	document.querySelector('.title').readOnly = true;
	document.querySelector('.content').readOnly = true;
}


</script>
</body>
</html>