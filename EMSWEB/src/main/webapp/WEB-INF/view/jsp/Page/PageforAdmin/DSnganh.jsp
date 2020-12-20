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

<!-- <script type="text/javascript">
function validate(){
	var name = document.myform.InputLastname.value;
	var noteCk = document.myform.InputNote.value;
	var statusCk = document.myform.InputStatus.value;
	
	var status = false;
	
	if(name.length < 1){
		document.getElementById("checkName").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Tên chuyên ngành!</span> ";
        status = false;
	}else{
		document.getElementById("checkName").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
		status = true;
	}
	
	if(noteCk.length < 1){
		document.getElementById("checkNote").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Chú thích!</span> ";
        status = false;
	}else{
		document.getElementById("checkNote").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
	
	if(statusCk.length < 1){
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
 -->
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
			Danh Sách Chuyên Ngành
			<button type="button" class="btn btn-info" data-toggle="modal"
				data-target="#myModal">Thêm Chuyên Ngành</button>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Trang chủ</a></li>
			<li class="active">Quản lí Sinh Viên</li>
			<li class="active">Danh sách Chuyên Ngành</li>
		</ol>
	</section>
	<!--Modalthemnhanvien-->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<form:form action="/newDSnganh" modelAttribute="major" onsubmit="return validate()" name="myform">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Thêm Chuyên Ngành</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<div>

							<div Class="form-group">
								<label for="InputName">Mã ngành:</label>
									<form:input type="text" path="id" class="form-control"
										id="InputLastname" />
										<span id="checkName"></span>
							</div>
							<div Class="form-group">
								<label for="InputName">Tên Ngành:</label>
									<form:input type="text" path="name" class="form-control"
										id="InputLastname" />
										<span id="checkName"></span>
							</div>
							
							<div class="form-group">
								<label for="InputID">Chú Thích:</label>
								<form:input type="text" path="description" class="form-control"
									id="InputNote" />
									<span id="checkNote"></span>
							</div>	
							
							<div class="form-group">
								<label for="InputID">Trạng Thái:</label>
								<form:input type="text" path="status" class="form-control"
									id="InputStatus" />
									<span id="checkStatus"></span>
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
	<form:form action="/save" modelAttribute="room">
		<table id="table1" class="display">

			<thead style="background-color: #4876FF; color: white">
				<tr>
					<th>ID</th>
					<th>Tên Ngành</th>
					<th>Chú Thích</th>	
					<th>Trạng Thái</th>				
					<th>Action</th>
				</tr>
			</thead>

			<tbody>
				<c:if test="${not empty List}">
					<c:forEach var="sp" items="${List}">

						<c:url var="updateLink" value="/updateFormMJ">
							<c:param name="id" value="${sp.id}" />
						</c:url>

						<!-- construct an "delete" link with customer id -->
						<c:url var="deleteLink" value="/deleteMJ">
							<c:param name="id" value="${sp.id}" />
						</c:url>

						
						<tr style="color: red;">
							<td class="gfgusername"><input style="color: red;border: none;width: 50px" name="idstaff"
								value=" ${sp.id}"></td>
							<td class="gfgpp"><input style="color: red;border: none;width: 80%" name="firstname"
								value="${sp.name}"></td>
							<td class="gfgscores">${sp.description}</td>
							<td class="gfgscores">${sp.status}</td>
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
