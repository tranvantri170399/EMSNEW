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
	var name = document.myform.InputName.value;
	var number = document.myform.InputClassNumber.value;
	var dt = document.myform.InputDt.value;
	
	var status = false;
	
	if(name.length < 1){
		 document.getElementById("checkName").innerHTML = 
	            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Tên phòng!</span> ";
	        status = false;
	}else{
		document.getElementById("checkName").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
    	status = true;
	}
	
	if(number.length < 1){
		document.getElementById("checkNumber").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Số phòng!</span> ";
        status = false;
	}else{
		document.getElementById("checkNumber").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
	
	if(dt.length < 1){
		document.getElementById("checkDt").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Diện tích!</span> ";
        status = false;
	}else if(!dt.match(/^\d+/)){
		document.getElementById("checkDt").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Diện tích chỉ nhập bằng số!</span> ";
        status = false;
	}else{
		document.getElementById("checkDt").innerHTML = 
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

</head>
<body>
	<section class="content-header">
		<h1>
			Danh Sách Phòng Học
			<button type="button" class="btn btn-info" data-toggle="modal"
				data-target="#myModal">Thêm Phòng Học</button>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Trang chủ</a></li>
			<li class="active">Quản lí CSVC</li>
			<li class="active">Danh sách Phòng Học</li>
		</ol>
	</section>
	<!--Modalthemnhanvien-->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<form:form action="/save/schoolroom" modelAttribute="room" onsubmit="return validate()" name="myform">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Thêm Phòng Học</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<div>

							<div class="form-group">
								<form:input type="hidden" path="id" />
							</div>
							<div Class="form-group">
								<label for="InputName">Tên phòng</label>
								<form:input type="text" path="name" class="form-control"
									id="InputName" />
									<span id="checkName"></span>
							</div>

							<div class="form-group">
								<label for="InputID">Số Phòng</label>
								<form:input type="text" path="schoolroomnumber"
									class="form-control" id="InputClassNumber" />
									<span id="checkNumber"></span>
							</div>

							<div class="form-group">
								<label for="InputID">Diện Tích</label>
								<div class="input-group">
									<form:input type="text" path="surfacearea" class="form-control"
										id="InputDt" />
									<div class="input-group-prepend">
										<span Class="input-group-text">m<sup>2</sup></span>
									</div>
									
								</div>
								<span id="checkDt"></span>
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
	<form:form action="/save" modelAttribute="room">
		<table id="table1" class="display">

			<thead style="background-color: #4876FF; color: white">
				<tr>
					<th>ID</th>
					<th>Tên Phòng</th>
					<th>Số Phòng</th>
					<th>Diện Tích(m<sup>2</sup>)
					</th>
					<th></th>
				</tr>
			</thead>

			<tbody>
				<c:if test="${not empty List}">
					<c:forEach var="sp" items="${List}">

						<c:url var="updateLink" value="/updateSchoolRoom">
							<c:param name="id" value="${sp.id}" />
						</c:url>

						<!-- construct an "delete" link with customer id -->
						<c:url var="deleteLink" value="/deleteSchoolRoom">
							<c:param name="id" value="${sp.id}" />
						</c:url>


						<tr style="color: red;">
							<td class="input-id">${sp.id}</td>
							<td class="table-name">${sp.name}</td>
							<td class="table-time">${sp.schoolroomnumber}</td>
							<td class="table-time">${sp.surfacearea}</td>
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
