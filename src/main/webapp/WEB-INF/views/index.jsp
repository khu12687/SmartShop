<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="include/head.jsp"></jsp:include>
</head>
<body>

	<c:if test="${sessionScope.member == null}">
		<div>
			<a href="login/">로그인</a>
		</div>
		<div>
			<a href="signup/">회원가입</a>
		</div>
	</c:if>
	
	<c:if test="${sessionScope.member != null}">
		<div>
			<span>${sessionScope.member.id}</span><span>님 환영합니다!</span>
		</div>
		<div>
			<a href="logout/">로그아웃</a>
		</div>
	</c:if>
	
	<div>
	 	<ul>
			<li><a href="product/">제품 관리</a></li>
			<li><a href="html/product.html">제품 관리(Ajax)</a></li>
			<li><a href="html/partner.html">거래처 관리</a></li>
			<li><a href="member/">회원 관리</a></li>
			<li><a href="purchase/">입고 관리</a></li>
			<li><a href="sales/">출고 관리</a></li>
		</ul>
	</div>

</body>
<jsp:include page="include/body.jsp"></jsp:include>
</html>