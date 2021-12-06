<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<h1 class="mt-3">입고 정보 변경</h1>
		<form method="post" class="mt-4">
		 	<div class="mb-3">
				<label class="form-label">제품명</label>
		 		<select name="product" class="form-select">
		 			<c:forEach var="product" items="${listProduct}">
		 				<option value="${product.code}" ${item.product == product.code ? 'selected' : ''}>${product.name}</option>
		 			</c:forEach>
		 		</select>
		 	</div>
		 	<div class="mb-3">
				<label class="form-label">거래처명</label>
		 		<select name="partner" class="form-select">
		 			<c:forEach var="partner" items="${listPartner}">
		 				<option value="${partner.code}" ${item.partner == partner.code ? 'selected' : ''}>${partner.name}</option>
		 			</c:forEach>
		 		</select>
		 	</div>
		 	<div class="mb-3">
				<label class="form-label">수량</label>
		 		<input type="text" name="amount" class="form-control" value="${item.amount}">
		 	</div>
			<div class="d-grid gap-2 col-6 mx-auto">
			 	<button class="btn btn-primary">등록</button>
			 	<a href="../list" class="btn btn-primary">이전</a>
			</div>
		</form>
	</div>
</body>
<jsp:include page="../include/body.jsp"></jsp:include>
</html>