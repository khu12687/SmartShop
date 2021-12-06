<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body class="container">
	<div>
		<h2 class="mt-3 mb-3">입고 관리</h2>
	</div>
		<form>
			<div class="input-group mb-3">
				<div class="col-8"></div>
				<span class="col-auto">
					<select name="search" class="form-select">
						<option value="0">검색항목</option>
						<option value="1" ${pager.search == 1 ? 'selected' : ''}>입고 코드</option>
						<option value="2" ${pager.search == 2 ? 'selected' : ''}>제품명</option>
						<option value="3" ${pager.search == 3 ? 'selected' : ''}>거래처명</option>
						<option value="4" ${pager.search == 4 ? 'selected' : ''}>수량</option>
						<option value="5" ${pager.search == 5 ? 'selected' : ''}>입고일자</option>
					</select>
				</span>
				<input class="form-control" type="text" name="keyword" value="${pager.keyword}" placeholder="검색어를 입력하세요">
				<button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
			</div>
		</form>
	<div class="table-responsive">
		<table class="table table-hover">
			<thead>
				<tr class="table-dark col-auto">
					<td>입고 코드</td>
					<td>제품명</td>
					<td>거래처명</td>
					<td>수량</td>
					<td>입고일자</td>
					<td class="col-auto">관리</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${list}">
					<tr>
						<td>${item.code}</td>
						<td>${item.productName}</td>
						<td>${item.partnerName}</td>
						<td>${item.amount}</td>
						<td><fmt:formatDate value="${item.regDate}" pattern="yyyy년 MM월 dd일 a hh:mm:ss"/></td>
						<td><a href="update/${item.code}" class="btn btn-warning btn-sm">변경</a> <a href="delete/${item.code}" class="btn btn-danger btn-sm">삭제</a></td>
					</tr>
				</c:forEach>
				<c:if test="${list.size() < 1}">
					<tr>
						<td colspan="6">등록된 제품이 없습니다</td>
					</tr>
				</c:if>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="7">
						<div class="pagination justify-content-center">
							<div class="page-item"><a href="?page=1&${pager.query}" class="page-link">처음</a></div>
							<div class="page-item"><a href="?page=${pager.prev}&${pager.query}" class="page-link">이전</a></div>
							
							<c:forEach var="page" items="${pager.list}">
								<div class="page-item ${page == pager.page ? 'active' : ''}"><a href="?page=${page}&${pager.query}" class="page-link">${page}</a></div>
							</c:forEach>
							
							<div class="page-item"><a href="?page=${pager.next}&${pager.query}" class="page-link">다음</a></div>
							<div class="page-item"><a href="?page=${pager.last}&${pager.query}" class="page-link">마지막</a></div>
						</div>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
	<div class="btn justify-content-right">
		<a href="add" class="btn btn-primary">등록</a>
		<a href=".." class="btn btn-primary">이전 메뉴</a>
	</div>
</body>
<jsp:include page="../include/body.jsp"></jsp:include>
</html>