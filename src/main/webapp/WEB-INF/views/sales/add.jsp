<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/head.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
	function checkStock() {
		const select = $("select[name='product']");
		const max = select.find("option[value='" + select.val() +"']").data("amount");
		
		$("#msg").text("수량 (재고:" + max +")");
		$("input[name=amount]").attr("max", max);
	}
	
	$(function() {
		$("select[name=product]").on("change", function() {
			checkStock();
		});
		
	checkStock();
	})
</script>
</head>
<body>
	<div class="container">
		<h1 class="mt-3">출고 정보 등록 (${user})</h1>
		<form method="post" class="mt-4">
		 	<div class="mb-3">
				<label class="form-label">제품명</label>
		 		<select name="product" class="form-select">
		 			<c:forEach var="stock" items="${stockList}">
		 				<option value="${stock.code}" data-amount="${stock.amount}">${stock.name}</option>
		 			</c:forEach>
		 		</select>
		 	</div>
		 	<div class="mb-3">
				<label class="form-label">거래처명</label>
		 		<select name="partner" class="form-select">
		 			<c:forEach var="partner" items="${listPartner}">
		 				<option value="${partner.code}">${partner.name}</option>
		 			</c:forEach>
		 		</select>
		 	</div>
		 	<div class="mb-3">
				<label class="form-label" id="msg">수량</label>
		 		<input type="number" name="amount" class="form-control" placeholder="수량" min="1" value="1">
		 	</div>
			<div class="d-grid gap-2 col-6 mx-auto">
			 	<button class="btn btn-primary">등록</button>
			 	<a href="list" class="btn btn-primary">이전</a>
			</div>
		</form>
	</div>
</body>
<jsp:include page="../include/body.jsp"></jsp:include>
</html>