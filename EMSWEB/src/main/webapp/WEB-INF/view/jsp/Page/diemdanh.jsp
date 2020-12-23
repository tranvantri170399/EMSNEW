<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" >
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.2 -->
    <link href="../../../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Morris chart -->
    <link href="../../../../resources/bootstrap/css/morris.css" rel="stylesheet" type="text/css" />
    <!-- jvectormap -->
    <link href="../../../../resources/bootstrap/css/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
    <!-- Daterange picker -->
    <link href="../../../../resources/bootstrap/css/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="../../../../resources/bootstrap/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
<link href="../../../../../resources/bootstrap/css/_all-skins.min.css"
	rel="stylesheet" type="text/css" />
	
	
	<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	

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

</style>
</head>
<body>
	<section class="content-header">
		<H1>Điểm Danh</H1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Trang Chủ</a></li>
			<li class="active">Học Tập </li>
			<li class="active">Điểm Danh</li>
		</ol>
	</section>

	<section class="content">
	<label for="exampleInputName">Tên Lớp Học:</label>
	<div style="width: 60%;" class="row">

			
			<div class="form-group col-sm-8">
				
				<select name="course" class="form-control" id="sel1">
					<c:if test="${not empty Lists}">
						<c:forEach var="sp" items="${Lists}">
						<!-- construct an "update" link with customer id -->
					<c:url var="attandence" value="/attandence/save">
						<c:param name="id" value="${sp.classroom.id}" />
					</c:url>
							<option>${sp.classroom.name}</option>
						</c:forEach>
					</c:if>
				</select>		
			</div>
			<div class="col-sm-4">
			<button type="button" class="btn btn-info"
									onclick="location.href='${attandence}';">Chọn</button>
			</div>
			

	</div>
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
					<th>Ngày</th>
					<th>Tên Sinh Viên</th>
					<th>Môn Học</th>
					<th>Trạng thái</th>
					
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
							<%-- <select name="statusxx" class="form-control" id="sel1" style="width:60%">
									<option>${sp.status}</option>
									
							</select> --%>${sp.status}
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
