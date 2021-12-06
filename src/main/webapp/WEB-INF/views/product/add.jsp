<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/head.jsp"></jsp:include>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script>
	$(document).ready(function() {
		$("#summernote").summernote();
		
		$("#add_image").click(function() {
			const div = $("<div>").addClass("mb-3");
			const label = $("<label>").addClass("form-label").text("제품 이미지:");
			const button = $("<span>").addClass("btn btn-outline-danger btn-sm").text("삭제");
			const file = $("<input>").attr("type", "file").attr("name", "productImage").addClass("form-control");
			
			div.append(label);
			div.append(button);
			div.append(file);
			
			button.click(function() {
				$(this).parent().remove();
			});
			
			$("form > div:last-child").before(div);
		})
	})
</script>
</head>
<body>
	<div class="container">
		<h1 class="mt-3">제품 등록</h1>
		<form method="post" class="mt-4" enctype="multipart/form-data">
		 	<div class="mb-3">
				<label class="form-label">이름</label>
		 		<input type="text" name="name" class="form-control">
		 	</div>
		 	<div class="mb-3">
				<label class="form-label">규격</label>
		 		<input type="text" name="spec" class="form-control">
		 	</div>
		 	<div class="mb-3">
				<label class="form-label">분류</label>
		 		<input type="text" name="category" class="form-control">
		 	</div>
		 	<div class="mb-3">
				<label class="form-label">제조사</label>
		 		<input type="text" name="manufacture" class="form-control">
		 	</div>
		 	<div class="mb-3"> 
				<label class="form-label">가격</label>
		 		<input type="text" name="price" class="form-control">
		 	</div>
		 	<div class="mb-3"> 
				<label class="form-label">바코드</label>
		 		<input type="text" name="barcode" class="form-control">
		 	</div>
		 	<div class="mb-3"> 
				<label class="form-label">제품설명</label>
		 		<textarea name="info" rows="10" cols="80" id="summernote"></textarea>
		 	</div>
		 	<div class="mb-3"> 
				<label class="form-label">제품 이미지:</label><span id="add_image" class="btn btn-outline-primary btn-sm">추가</span>
		 		<input type="file" name="productImage" class="form-control">
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