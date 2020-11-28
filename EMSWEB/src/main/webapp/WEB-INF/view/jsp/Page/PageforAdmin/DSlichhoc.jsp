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
</style>
</head>
<body>
	<section class="content-header">
		<h1>
			Danh Sách Lịch Học
			<button type="button" class="btn btn-info" data-toggle="modal"
				data-target="#myModal">Thêm Lịch Học</button>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Trang chủ</a></li>
			<li class="active">Quản lí </li>
			<li class="active">Danh sách Lịch Học</li>
		</ol>
	</section>
	<!--Modalthemnhanvien-->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<form:form action="/save/schedule" modelAttribute="schedule">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Thêm Lịch Học</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<div>

							<div class="form-group">
								<form:input type="hidden" path="id" />
							</div>
							<div class="form-group">
								<label for="exampleInputName">Tên Giảng Đường:</label>
								<select name="testamphitheater" class="form-control"
									id="sel1">
									<c:if test="${not empty Lista}">
										<c:forEach var="sp" items="${Lista}">
											<option>${sp.amphitheaterName}</option>
										</c:forEach>
									</c:if>
								</select>
							</div>

							<div class="form-group">
								<label for="exampleInputName">Tên Lớp:</label>
								<form:select path="classroom" class="form-control"
									idxmlns="sel1">
									<c:if test="${not empty Listc}">
										<c:forEach var="sp" items="${Listc}">
											<form:option value="${sp.name}" />
										</c:forEach>
									</c:if>
								</form:select>
							</div>

							<div class="form-group">
								<label for="exampleInputName">Tên Phòng Học:</label>
								<form:select path="schoolroom" class="form-control"
									idxmlns="sel1">
									<c:if test="${not empty Listsh}">
										<c:forEach var="sp" items="${Listsh}">
											<form:option value="${sp.name}" />
										</c:forEach>
									</c:if>
								</form:select>
							</div>
							<div class="form-group">
							<div class="form-group">
								<label for="exampleInputName">Tên Ca:</label>
								<select name="teststudyShift" class="form-control"
									id="sel1">
									<c:if test="${not empty Lists}">
										<c:forEach var="sp" items="${Lists}">
											<option>${sp.nameShift}</option>
										</c:forEach>
									</c:if>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleInputName">Tên Môn:</label>
								<form:select path="course" class="form-control"
									idxmlns="sel1">
									<c:if test="${not empty Listco}">
										<c:forEach var="sp" items="${Listco}">
											<form:option value="${sp.name}" />
										</c:forEach>
									</c:if>
								</form:select>
							</div>
							<div class="form-group">
								<label for="InputID">Ngày Học:</label>
								<form:input type="date" path="date" class="form-control"
									id="name" />
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<input type="submit" name="btnsave" class="btn btn-info"
							value="Lưu">
						<button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
					</div>

				</div>
				</div>
			</form:form>
		</div>
	</div>
	<section class="content">
	<!--Table  -->
	<form:form action="/save" modelAttribute="room">
		<table id="table1" class="display" style="width: 100%">
<colgroup>
       		<col span="1" style="width: 3%;">
       		<col span="1" style="width: 14%;">
       		<col span="1" style="width: 10%;">
       		<col span="1" style="width: 7%;">
       		<col span="1" style="width: 10%;">
       		<col span="1" style="width: 10%;">
       		<col span="1" style="width: 7%;">
       		<col span="1" style="width: 11%;">
       		<col span="1" style="width: 9%;">
       		<col span="1" style="width: 8%;">
       		<col span="1" style="width: 5%;">
       		<col span="1" style="width: 6%;">       		       		       		
    	</colgroup>
			<thead style="background-color: #4876FF; color: white">
				<tr>
					<th>ID</th>
					<th>Ngày</th>
					<th>Tên Giảng Đường</th>
					<th>Tên lớp</th>
					<th>Tên Phòng</th>
					<th>Tên Ca</th>
					<th>Tên Môn</th>
					<th>Tên Giáo Viên</th>
					<th>Thời Gian</th>
					<th>Action</th>
				</tr>
			</thead>

			<tbody>
				<c:if test="${not empty List}">
					<c:forEach var="sp" items="${List}">

						<c:url var="updateLink" value="/updatescheduletoform">
							<c:param name="id" value="${sp.id}" />
						</c:url>

						<!-- construct an "delete" link with customer id -->
						<c:url var="deleteLink" value="/deleteschedule">
							<c:param name="id" value="${sp.id}" />
						</c:url>


						<tr style="color: red;">
							<td class="gfgusername">${sp.id}</td>
								<td class="gfgscores">${sp.date}</td>
							<td class="gfgpp">${sp.amphitheater.amphitheaterName}</td>
							<td class="gfgscores">${sp.classroom.name}</td>
							<td class="gfgscores">${sp.schoolroom.name}(${sp.schoolroom.schoolroomnumber})</td>
							<td class="gfgscores">${sp.studyShift.nameShift}</td>
							<td class="gfgscores">${sp.course.name}</td>
							<td class="gfgscores">${sp.course.teacher.fname}</td>
							<td class="gfgscores">${sp.studyShift.startingTime}-${sp.studyShift.endTime}</td>
							<td style="text-align: center;">
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


	</form:form>
</section>

</body>
</html>
