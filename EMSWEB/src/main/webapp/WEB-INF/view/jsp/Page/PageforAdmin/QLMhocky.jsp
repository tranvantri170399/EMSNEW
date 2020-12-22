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
<link href="../../../../../resources/css/table.css"
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

table {
	width: 50%;
	counter-reset: row-num;
}

table tr {
	counter-increment: row-num-1;
}

table tr td:first-child::before {
	content: counter(row-num-1) " ";
}
</style>
</head>
<body>
	<section class="content-header">
		<h1>
			Quản Lý Môn Học Từng Kỳ
			<button type="button" class="btn btn-info" data-toggle="modal"
				data-target="#myModal">Thêm môn học</button>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Trang chủ</a></li>
			<li class="active">Quản lí sinh viên</li>
			<li class="active">Quản lý môn học từng kỳ</li>
		</ol>
	</section>
	<!--Modal-->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<form:form action="/NewQLhocky" modelAttribute="majorSemester"
				enctype="multipart/form-data">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Thêm Nhân Viên</h4>
					</div>
					<div class="modal-body">
						<div>
							<div clas="form-group">
								<label for="InputID">Học Kì:</label>
								<select name="semesters" class="form-control"
									id="sel1">
									<c:if test="${not empty listST}">
										<c:forEach var="sp" items="${listST}">
											<option>${sp.name}</option>
										</c:forEach>
									</c:if>
								</select>
							</div>
						</div>
						<div>
							<div clas="form-group">
								<label for="InputID">Học kì:</label>
								<select name="majors" class="form-control"
									id="sel1">
									<c:if test="${not empty listMJ}">
										<c:forEach var="sp" items="${listMJ}">
											<option>${sp.name}</option>
										</c:forEach>
									</c:if>
								</select>
							</div>
						</div>
						<div>
							<div clas="form-group">
								<label for="InputID">Tên môn học:</label>
								<select name="subjectname" class="form-control"
									id="sel1">
									<c:if test="${not empty listSB}">
										<c:forEach var="sp" items="${listSB}">
											<option>${sp.subjectname}</option>
										</c:forEach>
									</c:if>
								</select>
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
	
	<!--Table  -->
	<table id="table1" class="display">

		<thead style="background-color: #4876FF; color:white;">
			<tr>
				<th>STT</th>
				<th>Học kỳ</th>
				<th>Chuyên ngành</th>
				<th>Tên môn học</th>
				<th>Action</th>
			</tr>
		</thead>

		<tbody>
			<c:if test="${not empty majorSemester}">
				<c:forEach var="list" items="${majorSemester}">


					<!-- construct an "update" link with customer id -->
					<c:url var="updateLink" value="/formUDQLMhocky">
						<c:param name="id" value="${list.id}" />
					</c:url>

					<!-- construct an "delete" link with customer id -->
					<c:url var="deleteLink" value="/deleteQLMhocky">
						<c:param name="id" value="${list.id}" />
					</c:url>

					<tr>
						<td class="input-id"></td>
						<td class="table-name">${list.semester.name}</td>
						<td class="table-name">${list.majors.name}</td>
						<td class="table-name">${list.subject.subjectname}</td>
						<td><a href="${updateLink}" class="btn btn-primary">Update</a>
							<a href="${deleteLink}" class="btn btn-danger">Delete</a></td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>

	</table>


</body>
</html>
