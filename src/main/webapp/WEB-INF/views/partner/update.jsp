<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<h1 class="mt-3">거래처 정보 변경</h1>
		<form method="post" class="mt-4">
		 	<div class="mb-3">
				<label class="form-label">거래처명</label>
		 		<input type="text" name="name" class="form-control" value="${item.name}">
		 	</div>
		 	<div class="mb-3">
				<label class="form-label">주소</label>
		 		<input type="text" name="address" class="form-control" value="${item.address}">
		 	</div>
		 	<div class="mb-3">
				<label class="form-label">전화번호</label>
		 		<input type="text" name="tel" class="form-control" value="${item.tel}">
		 	</div>
			<div class="d-grid gap-2 col-6 mx-auto">
			 	<button class="btn btn-primary">변경</button>
			 	<a href=".." class="btn btn-primary">이전</a>
			</div>
		</form>
	</div>
</body>
<jsp:include page="../include/body.jsp"></jsp:include>
</html>