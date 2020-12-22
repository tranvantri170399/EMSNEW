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

<script>
			    function validate() {
			        var Id = document.myform.id.value;
			        var Subjectname = document.myform.subjectname.value;
			        var Description = document.myform.description.value;
			        var Statuss = document.myform.status.value;
			        
			        var status = false;
			 
			        if (Id.length < 1) {
			            document.getElementById("checkName").innerHTML = 
			                " <span class='fas fa-window-close' style='color:red;'>Mã ngành không được trống!</span> ";
			            status = false;
			        } else {
			        	document.getElementById("checkName").innerHTML = 
				            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
			        	status = true;
			        }
			        
			        if (Subjectname.length < 3) {
			            document.getElementById("checkSubject").innerHTML = 
			                "  <span class='fas fa-window-close' style='color:red;'>Tên môn học không được để trống!</span> ";
			            status = false;
			        } else{
			        	document.getElementById("checkSubject").innerHTML = 
				            "<span class='fa fa-check-square' style='color:#3FFF00;'></span>";
			        }
			        
			        if (Description.length < 1) {
			            document.getElementById("checkDescrip").innerHTML = 
			                "  <span class='fas fa-window-close' style='color:red;'>Chú thích không được để trống!</span> ";
			            status = false;
			        } else{
			        	document.getElementById("checkDescrip").innerHTML = 
				            "<span class='fa fa-check-square' style='color:#3FFF00;'></span>";
			        } 
			        	
			        if (Statuss.length < 1) {
			            document.getElementById("checkStatus").innerHTML = 
			                "  <span class='fas fa-window-close' style='color:red;'>Trạng thái không được để trống!</span> ";
			            status = false;
			        } else {
			            document.getElementById("checkStatus").innerHTML = 
			                "<span class='fa fa-check-square' style='color:#3FFF00;'></span>";
			        }
			        return status;
			    }
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
		<h1>
			Danh Sách Môn Học
			<button type="button" class="btn btn-info" data-toggle="modal"
				data-target="#myModal">Thêm Môn Học</button>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Trang chủ</a></li>
			<li class="active">Quản Lí Lịch Học</li>
			<li class="active">Danh sách Môn Học</li>
		</ol>
	</section>
	<!--Modalthemnhanvien-->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<form:form action="/newSubject" modelAttribute="subjectNew"
				enctype="multipart/form-data" onsubmit="return validate()" name="myform">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Thêm Môn học</h4>
					</div>
					<div class="modal-body">
						<div>
							<div class="form-group">
								<label for="InputID">Mã Ngành:</label>
								<form:input type="text" path="id" class="form-control" id="name" />
								<span id="checkName"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="InputID">Chuyên ngành:</label>
							<form:select path="majors" class="custom-select" idxmlns="sel1">
								<c:if test="${not empty Listmj}">
									<c:forEach var="sp" items="${Listmj}">
										<option>${sp.name}</option>
									</c:forEach>
								</c:if>
							</form:select>
						</div>
						<div>
							<div class="form-group">
								<label for="InputID">Tên môn học:</label>
								<form:input type="text" path="subjectname" class="form-control"
									id="name" />
									<span id="checkSubject"></span>
							</div>
						</div>
						<div>
							<div class="form-group">
								<label for="InputID">Chú thích môn:</label>
								<form:input type="text" path="description" class="form-control"
									id="name" />
									<span id="checkDescrip"></span>
							</div>
						</div>
						<div>
							<div class="form-group">
								<label for="InputID">Trạng thái:</label>
								<form:input type="text" path="status" class="form-control"
									id="name" />
									<span id="checkStatus"></span>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<input type="submit" name="btnsave" class="btn btn-info"
							value="Lưu">
						<button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
					</div>

				</div>
			</form:form>
		</div>
	</div>

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
						<td class="input-id" >${list.id}</td>
						<td class="table-name">${list.majors.name}</td>
						<td class="table-name">${list.subjectname}</td>
						<td class="table-name">${list.description}</td>
						<td class="table-name">${list.status}</td>
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

</body>

</html>
