<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/head.jsp"></jsp:include>
	
	<script>
		$(function() {
			$(`thead input[type='checkbox']`).on("change", function() {
		        const checked = $(this).prop("checked");
		
		        $(".item-check").prop("checked", checked);
		
		    });
			
			$("#delete_list").click(() => $("#delete_form").submit());
		})
	</script>
</head>
<body class="container">
	<div>
		<h2 class="mt-3 mb-3">제품 관리</h2>
	</div>
		<form>
			<div class="input-group mb-3">
				<div class="col-8"></div>
				<span class="col-auto">
					<select name="search" class="form-select">
						<option value="0">검색항목</option>
						<option value="1" ${pager.search == 1 ? 'selected' : ''}>제품코드</option>
						<option value="2" ${pager.search == 2 ? 'selected' : ''}>제품명</option>
						<option value="3" ${pager.search == 3 ? 'selected' : ''}>규격</option>
						<option value="4" ${pager.search == 4 ? 'selected' : ''}>분류</option>
						<option value="5" ${pager.search == 5 ? 'selected' : ''}>제조사</option>
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
					<td><input type="checkbox"></td>
					<td>제품코드</td>
					<td>제품명</td>
					<td>규격</td>
					<td>분류</td>
					<td>제조사</td>
					<td>가격</td>
					<td class="col-auto">관리</td>
				</tr>
			</thead>
			<form id="delete_form" method="post" action="delete_list">
				<tbody>
					<c:forEach var="item" items="${list}">
						<tr>
							<td><input name="code" type="checkbox" class="item-check" value="${item.code}"></td>
							<td>${item.code}</td>
							<td><a href="view/${item.code}">${item.name}</a></td>
							<td>${item.spec}</td>
							<td>${item.category}</td>
							<td>${item.manufacture}</td>
							<td><fmt:formatNumber>${item.price}</fmt:formatNumber></td>
							<td><a href="update/${item.code}" class="btn btn-warning btn-sm">변경</a> <a href="delete/${item.code}" class="btn btn-danger btn-sm">삭제</a></td>
						</tr>
					</c:forEach>
					
					<c:if test="${list.size() < 1}">
						<tr>
							<td colspan="7">등록된 제품이 없습니다</td>
						</tr>
					</c:if>
				</tbody>
			</form>
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
		<button id="delete_list" class="btn btn-danger">선택 삭제</button>
		<a href="dummy"class="btn btn-secondary">대량등록</a>
		<a href="init"class="btn btn-secondary">초기화</a>
	</div>
</body>
<jsp:include page="../include/body.jsp"></jsp:include>
</html>