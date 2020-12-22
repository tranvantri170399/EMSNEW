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
<link href="../../../../../resources/css/table.css" rel="stylesheet"
	type="text/css" />


<script>
	$(document).ready(function() {
		$('#table1').DataTable();
	});
</script>

<style type="text/css">
#InputLastname {
	border-color: red;
}
</style>
</head>
<body>
	<section class="content-header">
		<h1>
			Danh Sách Khóa Học
			<button type="button" class="btn btn-info" data-toggle="modal"
				data-target="#myModal">Thêm Khóa Học</button>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Trang chủ</a></li>
			<li class="active">Quản Lí Lịch Học</li>
			<li class="active">Danh Sách Khóa Học</li>
		</ol>
	</section>

	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<form:form action="/newCourse/test" modelAttribute="course"
				enctype="multipart/form-data">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Thêm Khóa Học</h4>
					</div>
					<div class="modal-body">
						<div>

							<div class="form-group">
								<label for="InputID">Mã Khóa Học:</label>
								<form:input type="text" path="id" class="form-control"
									id="InputEmail" />
							</div>

							<div class="form-group">
								<label for="InputID">Tên Khóa Học:</label>
								<form:input type="text" path="name" class="form-control"
									id="InputEmail" />
							</div>

							<div class="form-group">
								<label for="InputID">Học Kì</label>
								<select name="semesters" class="form-control" id="sel1">
									<c:if test="${not empty Lists}">
										<c:forEach var="sp" items="${Lists}">
											<%-- <form:option value="${sp.name}" /> --%>
											<option>${sp.name}</option>
										</c:forEach>
									</c:if>
								</select>
							</div>
							<div class="form-group">
								<label for="InputID">Giáo Viên</label>
								<select name="teachers" class="form-control" id="sel1">
									<c:if test="${not empty Listt}">
										<c:forEach var="sp" items="${Listt}">
											<option>${sp.fname}</option>
										</c:forEach>
									</c:if>
								</select>
							</div>
							<div class="form-group">
								<label for="InputID">Trạng Thái:</label>
								<form:input path="status" class="form-control" />
							</div>
							<%-- <div class="form-group">
								<label for="InputID">Chú Ý:</label>
								<form:input path="desc" class="form-control" />
							</div> --%>
							<div class="form-group">
								<label for="InputID">Học Phần:</label>
								<form:input path="section" class="form-control" />
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<input type="submit" name="btnsave" class="btn btn-info"
							value="SAVE">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>

				</div>
			</form:form>
		</div>
	</div>

	<section class="content">
		<!--Table  -->
		<form:form action="/save" modelAttribute="course">
			<table id="table1" class="display">

				<thead style="background-color: #4876FF; color: white">
					<tr>
						<th>ID</th>
						<th>Tên Khóa Học</th>
						<th>Học kì</th>
						<th>Trạng thái</th>
						<th>Giáo Viên</th>
						<th></th>
					</tr>
				</thead>

				<tbody>
					<c:if test="${not empty List}">
						<c:forEach var="list" items="${List}">


							<!-- construct an "update" link with customer id -->
							<c:url var="updateLink" value="/updatelichhoc">
								<c:param name="id" value="${list.id}" />
							</c:url>

							<!-- construct an "delete" link with customer id -->
							<c:url var="deleteLink" value="/deletelichhoc">
								<c:param name="id" value="${list.id}" />
							</c:url>

							<tr>
								<td class="input-id">${list.id}</td>
								<td class="table-name">${list.name}</td>
								<td class="table-name">${list.semester.name}</td>
								<td class="table-name">${list.status}</td>
								<td class="table-name">${list.teacher.fname}</td>
								<td>
									<div class="btn-group" role="group" aria-label="Basic example">
										<button type="button" class="btn btn-info"
											onclick="location.href='${updateLink}';">Cập nhật</button>
										<button type="button" class="btn btn-danger"
											onclick="location.href='${deleteLink}';">Xóa</button>
									</div>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>

			</table>


		</form:form>
	</section>


</body>
</html>
