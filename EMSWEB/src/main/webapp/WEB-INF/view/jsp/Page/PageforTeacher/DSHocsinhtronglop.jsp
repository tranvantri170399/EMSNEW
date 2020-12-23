<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>AdminLTE 2 | Dashboard</title>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>

<!-- modal -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link
	href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />
<!-- Daterange picker -->
<link
	href="../../../../../resources/bootstrap/css/daterangepicker-bs3.css"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="../../../../../resources/bootstrap/css/AdminLTE.min.css"
	rel="stylesheet" type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the cs/skins 
         folder instead of downloading all of them to reduce the load. -->
<link href="../../../../../resources/bootstrap/css/_all-skins.min.css"
	rel="stylesheet" type="text/css" />



<script>
	$(document).ready(function() {
		$('#table1').DataTable();
	});
</script>

<style type="text/css">
#InputLastname {
	border-color: red;
}

th.image.sorting {
	width: 50px;
}
</style>
</head>

<body>
	<section class="content-header">
		<h1>Danh Sách Lớp Học</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Trang chủ</a></li>
			<li class="active">Quản Lí Học Sinh</li>
			<li class="active">Danh sách Học Sinh</li>
		</ol>
	</section>
	<section class="content">
	<!--Table  -->
	<table id="table1" class="display">

		<thead style="background-color:#4876FF ;color: white">
			<tr>
				<th>Mã</th>
				<th>Chuyên Ngành</th>
				<th>Tên Môn học</th>
				<th>Mô tả môn học</th>
				<th>Trạng thái</th>
				<th>Actions</th>
			</tr>
		</thead>

		<tbody>
			<c:if test="${not empty List}">
				<c:forEach var="list" items="${List}">


					<!-- construct an "update" link with customer id -->
					<c:url var="updateLink" value="/updateFormSJ">
						<c:param name="id" value="${list.id}" />
					</c:url>

					<!-- construct an "delete" link with customer id -->
					<c:url var="deleteLink" value="/deleteSubject">
						<c:param name="id" value="${list.id}" />
					</c:url>

					<tr>
						<td>${list.id}</td>
						<td>${list.classroom.id}</td>
						<td>${list.classroom.name}</td>
						<td>${list.student.fname}</td>
						<td>${list.student.email}</td>
						<td>
							<div class="btn-group" role="group" aria-label="Basic example">
								<button type="button" class="btn btn-info"
									onclick="location.href='${updateLink}';">Cập Nhật</button>
								<button type="button" class="btn btn-danger"
									onclick="location.href='${deleteLink}';">Xóa</button>
							</div>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	</section>
</body>

</html>