<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<h3>${item.name}</h3>
		<div>
			<label>제품번호:</label>
			<span>${item.code}</span>
		</div>
		<div>
			<label>제품명:</label>
			<span>${item.name}</span>
		</div>
		<div>
			<label>규격:</label>
			<span>${item.spec}</span>
		</div>
		<div>
			<label>카테고리:</label>
			<span>${item.category}</span>
		</div>
		<div>
			<label>제조사:</label>
			<span>${item.manufacture}</span>
		</div>
		<div>
			<label>가격:</label>
			<span>${item.price}</span>
		</div>
		<div>
			<label>제품 설명:</label>
			<span>${item.info}</span>
		</div>
		<div>
			<label>바코드:</label>
			<span>${item.barcode}</span>
		</div>
		<div>
			<ul>
				<c:if test="${item.images == null} || ${item.images.size() < 1}">
					<li>등록된 제품이미지가 없습니다</li>
				</c:if>
				<c:forEach var="image" items="${item.images}">
					<li><img src="/upload/${image.uuid}_${image.filename}" target="_blank"></li>
				</c:forEach>
			</ul>
		</div>
		<div>
			<a href="..">목록</a>
		</div>
	</div>
	<jsp:include page="../include/body.jsp"></jsp:include>
</body>
</html>