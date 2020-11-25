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
			Danh Sách Thiết Bị
			<button type="button" class="btn btn-info" data-toggle="modal"
				data-target="#myModal">Thêm Thiết Bị</button>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Trang chủ</a></li>
			<li class="active">Quản lí CSVC</li>
			<li class="active">Danh sách Thiết Bị</li>
		</ol>
	</section>
	<!--Modalthemnhanvien-->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<form:form action="/save/staff" modelAttribute="rooma">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Thêm Thiết bị</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<div>

							<div class="form-group">
								<form:input type="hidden" path="id" />
							</div>
							<div Class="form-group">
								<label for="InputName">Tên phòng</label>
									<form:input type="text" path="schoolroom" class="form-control"
										id="InputLastname" />
							</div>
							
							<div clas="form-group">
								<label for="InputID">Thiết Bị:</label>
								<form:input type="text" path="device" class="form-control"
									id="InputEmail" />
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
	<form:form action="/save" modelAttribute="room">
		<table id="table1" class="display">

			<thead style="background-color: aqua;">
				<tr>
					<th>ID</th>
					<th>Tên Phòng Học</th>
					<th>Tên Thiết Bị</th>	
					<th>Số Lượng</th>				
					<th>Action</th>
				</tr>
			</thead>

			<tbody>
				<c:if test="${not empty List}">
					<c:forEach var="sp" items="${List}">

						<c:url var="updateLink" value="/updateroomDevice">
							<c:param name="id" value="${sp.id}" />
						</c:url>

						<!-- construct an "delete" link with customer id -->
						<c:url var="deleteLink" value="/deleteroomDevice">
							<c:param name="id" value="${sp.id}" />
						</c:url>

						
						<tr style="color: red;">
							<td class="gfgusername"><input style="color: red;border: none;width: 50px" name="idstaff"
								value=" ${sp.id}"></td>
							<td class="gfgpp"><input style="color: red;border: none;width: 80%" name="firstname"
								value="${sp.schoolroom.name}"></td>
							<td class="gfgscores">${sp.device.deviceName}</td>
							<td class="gfgscores">${sp.amount}</td>
							<td style="text-align: center;">
								<a href="${updateLink}" >UPDATE</a>
								<a href="${deleteLink}">DEL</a>
							</td>
						</tr>

					</c:forEach>
				</c:if>

			</tbody>

		</table>


	</form:form>


</body>
</html>
