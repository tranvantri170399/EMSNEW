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

<script type="text/javascript">
function validate(){
	var id = document.myform.id.value;
	var name = document.myform.name.value;
	var dSt = document.myform.InputDSt.value;
	var dEnd = document.myform.InputDEnd.value;
	var statusCk = document.myform.InputStatus.value;
	
	var status = false;
	
	if(id.length < 1){
		document.getElementById("checkId").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Mã học kì!</span> ";
        status = false;
	}else{
		document.getElementById("checkId").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
    	status = true;
	}
	
	if(name.length < 1){
		document.getElementById("checkName").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Tên học kỳ!</span> ";
        status = false;
	}else{
		document.getElementById("checkName").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
	
	if(dSt.length < 1){
		document.getElementById("checkDSt").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Ngày bắt đầu!</span> ";
        status = false;
	}else{
		document.getElementById("checkDSt").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
	
	if(dEnd.length < 1){
		document.getElementById("checkDEnd").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Ngày kết thúc!</span> ";
        status = false;
	}else{
		document.getElementById("checkDEnd").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
	
	if(statusCk.length<1){
		document.getElementById("checkStatus").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Trạng thái!</span> ";
        status = false;
	}else{
		document.getElementById("checkStatus").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
	
	
	return status;
}
</script>

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
			Danh Sách Học Kỳ
			<button type="button" class="btn btn-info" data-toggle="modal"
				data-target="#myModal">Thêm Học Kì</button>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Trang chủ</a></li>
			<li class="active">Quản Lí Sinh Viên</li>
			<li class="active">Danh Sách Học Kỳ</li>
		</ol>
	</section>
	<!--Modalthemnhanvien-->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<form:form action="/newSemester" modelAttribute="semester"
				enctype="multipart/form-data" onsubmit="return validate()" name="myform">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Thêm Học Kỳ</h4>					
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<div>
							<div class="form-group">
								<label for="InputID">Mã học kỳ:</label>
								<form:input type="text" path="id" class="form-control" id="id" />
								<span id="checkId"></span>
							</div>
						</div>
						
						<div>
							<div class="form-group">
								<label for="InputID">Tên học kỳ:</label>
								<form:input type="text" path="name" class="form-control" id="name" />
								<span id="checkName"></span>
							</div>
						</div>
		
						<div>
							<div class="form-group">
								<label for="InputID">Ngày bắt đầu:</label>
								<form:input type="date" path="starttime" class="form-control"
									id="InputDSt" min="1980-1-1" max="2020-12-31" />
									<span id="checkDSt"></span>
							</div>
						</div>
						<div>
							<div class="form-group">
								<label for="InputID">Ngày kết thúc:</label>
								<form:input type="date" path="endtime" class="form-control"
									id="InputDEnd" min="1980-1-1" max="2020-12-31" />
									<span id="checkDEnd"></span>
							</div>
						</div>
						<div>
							<div class="form-group">
								<label for="InputID">Trạng thái:</label>
								<form:input type="text" path="status" class="form-control"
									id="InputStatus" />
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
	<section class="content">
	<!--Table  -->
	<table id="table1" class="display">

		<thead style="background-color: #4876FF; color: white">
			<tr>
				<th>STT</th>
				<th>Mã</th>
				<th>Chuyên Ngành</th>
				<th>Tên Môn học</th>
				<th>Mô tả môn học</th>
				<th>Trạng thái</th>
				<th></th>
			</tr>
		</thead>

		<tbody>
			<c:if test="${not empty List}">
				<c:forEach var="list" items="${List}">


					<!-- construct an "update" link with customer id -->
					<c:url var="updateLink" value="/updateFormHK">
						<c:param name="id" value="${list.id}" />
					</c:url>

					<!-- construct an "delete" link with customer id -->
					<c:url var="deleteLink" value="/deleteSubject">
						<c:param name="id" value="${list.id}" />
					</c:url>

					<tr>
						<td class="input-id" style="text-align: center;"><input value=" ${list.id}" type="hidden"></td>
						<td class="input-id">${list.id}</td>
						<td class="table-name">${list.name}</td>
						<td>${list.starttime}</td>
						<td>${list.endtime}</td>
						<td class="table-name">${list.status}</td>
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
	</section>
</body>

</html>