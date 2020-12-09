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

<script type="text/javascript">
function validate(){
	var name = document.myform.InputName.value;
	var timeSt = document.myform.InputTimeSt.value;
	var timeEnd = document.myform.InputTimeEnd.value;
	
	var status = false;
	
	if(name.length < 1){
		document.getElementById("checkName").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Tên ca học!</span> ";
        status = false;
	}else{
		document.getElementById("checkName").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
    	status = true;
	}
	
	if(timeSt.length < 1){
		document.getElementById("checkTimeSt").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Thời gian bắt đầu!</span> ";
        status = false;
	}else{
		document.getElementById("checkTimeSt").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
	
	if(timeEnd.length < 1){
		document.getElementById("checkTimeEnd").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Thời gian kết thúc!</span> ";
        status = false;
	}else{
		document.getElementById("checkTimeEnd").innerHTML = 
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

</style>
</head>
<body>
	<section class="content-header">
		<h1>
			Danh Sách Ca Học
			<button type="button" class="btn btn-info" data-toggle="modal"
				data-target="#myModal">Thêm Ca Học</button>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Trang chủ</a></li>
			<li class="active">Quản Lí Lịch Học </li>
			<li class="active">Danh Sách Ca Học</li>
		</ol>
	</section>
	<!--Modalthemnhanvien-->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<form:form action="/save/studyShift" modelAttribute="studyShift" onsubmit="return validate()" name="myform">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Thêm Ca Học</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<div>

							<div class="form-group">
								<form:input type="hidden" path="id" />
							</div>
							<div Class="form-group">
								<label for="InputName">Tên Ca Học:</label>
								<form:input type="text" path="nameShift" class="form-control"
									id="InputName" />
									<span id="checkName"></span>
							</div>

							<div clas="form-group">
								<label for="InputID">Thời Gian Bắt Đầu:</label>
								<form:input type="time" path="startingTime"
									class="form-control" id="InputTimeSt" />
									<span id="checkTimeSt"></span>
							</div>

							<div clas="form-group">
								<label for="InputID">Thời Gian Kết Thúc:</label>
								
									<form:input type="time" path="endTime" class="form-control"
										id="InputTimeEnd" />
										<span id="checkTimeEnd"></span>
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
	<form:form action="/save" modelAttribute="room">
		<table id="table1" class="display">

			<thead style="background-color:#4876FF ;color: white">
				<tr>
					<th>ID</th>
					<th>Tên Ca Học</th>
					<th>Thời Gian Bắt Đầu</th>
					<th>Thời Gian Kết Thúc</th>
					<th>Action</th>
				</tr>
			</thead>

			<tbody>
				<c:if test="${not empty List}">
					<c:forEach var="sp" items="${List}">

						<c:url var="updateLink" value="/updateStudyShifttoform">
							<c:param name="id" value="${sp.id}" />
						</c:url>

						<!-- construct an "delete" link with customer id -->
						<c:url var="deleteLink" value="/deleteStudyShift">
							<c:param name="id" value="${sp.id}" />
						</c:url>


						<tr style="color: red;">
							<td class="gfgusername"><input
								style="color: red; border: none; width: 50px" name="idstaff"
								value=" ${sp.id}"></td>
							<td class="gfgpp"><input
								style="color: red; border: none; width: 80%" name="firstname"
								value="${sp.nameShift}"></td>
							<td class="gfgscores">${sp.startingTime}</td>
							<td class="gfgscores">${sp.endTime}</td>
							<td >
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


</body>
</html>
