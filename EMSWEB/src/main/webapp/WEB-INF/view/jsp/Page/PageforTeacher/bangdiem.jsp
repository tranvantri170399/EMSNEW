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


table tr {
	counter-increment: row-num-1;
}

table tr td:first-child::before {
	content: counter(row-num-1) " ";
}
<%--message--%>

.ui-draggable .ui-dialog-titlebar{
	background: #007bff;
}
.ui-dialog .ui-dialog-content{
	text-align: center;
}
.ui-dialog .ui-dialog-title{
	text-align: center;
    color: white;
}
</style>
</head>
<body>
	<section class="content-header">
		<h1>Bảng Điểm</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Trang chủ</a></li>
			<li class="active">Học Tập</li>
			<li class="active">Bảng Điểm</li>
		</ol>
	</section>
	<section class="content">
	<form action="/mark/save" class="row">
			<div class="form-group col-sm-6">
			<label for="exampleInputName">Tên Lớp Học:</label>		
				
				<select name="course" class="form-control" id="sel1">
					<c:if test="${not empty Lists}">
						<c:forEach var="sp" items="${Lists}">
						<!-- construct an "update" link with customer id -->
					<c:url var="attandence" value="/mark/save">
						<c:param name="id" value="${sp.id}" />
					</c:url>
							<option>${sp.name}</option>
						</c:forEach>
					</c:if>
				</select>		
			</div>
<%-- 			<div class="col-sm-4">
			<button type="button" class="btn btn-info"
									onclick="location.href='${attandence}';">Chọn</button>
			</div> --%>

		<div class="form-group col-sm-6">
		<label for="exampleInputName">Loại bài kiểm tra:</label>
							
				<select name="namelab" class="form-control" id="sel1">
					<c:if test="${not empty Listss}">
						<c:forEach var="sp" items="${Listss}">
						<!-- construct an "update" link with customer id -->
					<c:url var="attandence" value="/attandence/save">
						<c:param name="id" value="${sp.id}" />
					</c:url>
							<option>${sp.name}</option>
						</c:forEach>
					</c:if>
				</select>		
			</div>

			


			<!-- <div class="modal-footer">
				<input type="submit" name="btnsave" class="btn btn-info" value="Chọn	">
			</div> -->
		<div class="form-group col-sm-6">			
		<label for="exampleInputName">Tên Bài Kiểm Tra:</label>		
				<input class ="form-control" name="nameexam" >
		</div>
		<div class="form-group col-sm-6" style="margin-top: 31px">					
				<input type="submit" class="btn btn-primary" value="submit"/>
		</div>		
</form>
<!-- 	<section class="content-header">
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Trang chủ</a></li>
			<li class="active">Quản lí</li>
			<li class="active">Danh sách Lịch Học</li>
		</ol>
	</section> -->
	<!--Table  -->
	<form:form action="/servlet" modelAttribute="attandence">
		<table id="table1" class="display" style="width: 100%">
			<colgroup>
				<col span="1" style="width: 3%;">
				<col span="1" style="width: 7%;">
				<col span="1" style="width: 10%;">
				<col span="1" style="width: 7%;">
				<col span="1" style="width: 17%;">
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
					<th>STT</th>
					<th>date</th>
					<th>student name</th>
					<th>course</th>
					<th>status</th>
				
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


						<tr>
							<td><form:input path="id" value="${sp.id}" type="hidden" /></td>
							<td>${sp.date}</td>
							<td>${sp.student.fname}</td>
							<td>${sp.course.name}</td>
							<td>
								<%-- <form:input path="status" value="${sp.status}"/> --%> <select
								name="statusxx" class="form-control" id="sel1" style="width: 60%">
									<option>có mặt</option>
									<option>vắng mặt</option>
							</select>
							</td>
							
						</tr>

					</c:forEach>
				</c:if>

			</tbody>

		</table>

		<button type="submit" class="btn btn-info">Lưu thay đổi</button>
	</form:form>
	
	
	<script>
		<c:forEach var="m" items="${mess}">
		function myFunction() {
			document.getElementById("dialog").style.display = 'none';
			document.getElementById("dialogs").style.display = 'none';
			if(${m}=="1"){
				/* alert("Cập nhật thành công :))"); */
				$( "#dialog" ).dialog();
				document.getElementById("dialog").style.background = 'white';
			}else{
				$( "#dialogs" ).dialog();
				document.getElementById("dialogs").style.background = 'white';
			}
		}
		</c:forEach>
		
	</script>

	<div id="dialog" title="Message" style="display: none;background:#007bff;">
	<i class='far fa-check-circle' style='font-size:115px;color:#007bff;margin-top: 1.1rem;'></i>
		<p style="margin-top: 1.5rem; font-size: 20px;"	>Cập nhật thành công</p>
	</div>
	<div id="dialogs" title="Message" style="display: none;background:#007bff;">
		<i class='far fa-times-circle' style='font-size:115px;color:#FE2E2E;margin-top: 1.1rem;'></i>
		<p style="margin-top: 1.5rem; font-size: 20px;">Cập nhật thất bại!</p>
	</div>
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</section>	
</body>
</html>
