<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EMS | Quản Lí Giáo Viên</title>

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
		Quản Lí Giáo Viên
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Trang chủ</a></li>
			<li class="active">Quản lí nhân viên</li>
			<li class="active">Danh sách Nhân Viên</li>
		</ol>
	</section>
	<!--Modalthemnhanvien-->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<form:form action="/newTeacher" modelAttribute="teacherNew"
				enctype="multipart/form-data">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Thêm Giáo Viên</h4>					
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<div>

							<div class="form-group">
								<form:input type="hidden" path="id" />
							</div>
							<div Class="form-group">
								<label for="InputName">Họ và tên:</label>
								<div Class="input-group">
									<div class="input-group-prepend">
									<span Class="input-group-text">Họ</span>
									</div>
									<form:input type="text" path="lname" class="form-control"
										id="InputLastname" />
									<div class="input-group-prepend">	
									<span Class="input-group-text">Tên</span>
									</div>
									<form:input type="text" path="fname" class="form-control"
										id="InputFirstname" />
								</div>
							</div>

							<div clas="form-group">
								<label for="InputID">Image:</label> 								
								<div class="custom-file">
    								<input type="file" class="custom-file-input" id="inputGroupFile01" id="InputImage">
    								<label class="custom-file-label" for="inputGroupFile01">Choose file</label>
							  	</div>
							</div>
							<div clas="form-group">
								<label for="InputID">Email:</label>
								<form:input type="text" path="email" class="form-control"
									id="InputEmail" />
							</div>

							<div clas="form-group">
								<label for="InputID">Ngày sinh</label>
								<form:input type="date" path="dob" class="form-control"
									id="InputDob" min="1980-1-1" max="2020-12-31" />
							</div>
							<div clas="form-group">
								<label for="InputID">Số Điện Thoại</label>
								<form:input type="text" path="phone" class="form-control"
									id="InputPhone" />
							</div>
							<div clas="form-group">
								<label for="InputID">Địa chỉ:</label>
								<form:input type="text" path="address" class="form-control"
									id="InputAddress" />
							</div>
							<div clas="form-group">
								<label for="InputID">Trạng Thái:</label>
								<form:input path="status" class="form-control" />
							</div>
							<div clas="form-group">
								<label for="InputID">Cấp độ:</label>
								<form:input path="level" class="form-control" />
							</div>
							<div clas="form-group">
								<label for="InputID">Lương</label>
								<form:input path="salary" class="form-control" />
							</div>
							<div clas="form-group">
								<label for="InputID">Phòng Ban:</label>
								<form:select path="depart" class="custom-select"
									idxmlns="sel1">
									<c:if test="${not empty Listdp}">
										<c:forEach var="sp" items="${Listdp}">
											<form:option value="${sp.name}" />
											<%--  <form:options items="${Listdp}" /> --%>
										</c:forEach>
									</c:if>
								</form:select>
							</div>
							<div clas="form-group">
								<label for="InputID">Chức vụ</label>
								<form:select path="role" class="custom-select"
									idxmlns="sel1">
									<c:if test="${not empty Listr}">
										<c:forEach var="sp" items="${Listr}">
											<option>${sp.roleName}</option>
										</c:forEach>
									</c:if>
								</form:select>
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
	<h6>Danh sách Giáo Viên	
	<button type="button" class="btn btn-info" data-toggle="modal"
				data-target="#myModal">Thêm nhân viên</button>
	</h6>
	<!--Table  -->
	<form:form action="/save" modelAttribute="teacher">
		<table id="table1" class="table-bordered table-striped dataTable">

			<thead style="background-color: aqua;">
				<tr>
					<th>Mã GV</th>
					<th>Tên GV</th>
					<th>Chức vụ</th>
					<th>Phòng Ban</th>
					<th>Ảnh</th>
					<th>Email</th>
					<th>Phone</th>
					<th>Địa chỉ</th>
					<th>Lương</th>
					<th>Actions</th>
				</tr>
			</thead>

			<tbody>
				<c:if test="${not empty listTeacher}">
					<c:forEach var="list" items="${listTeacher}">


						<!-- construct an "update" link with customer id -->
						<c:url var="updateLink" value="/updateForm">
							<c:param name="id" value="${list.id}" />
						</c:url>

						<!-- construct an "delete" link with customer id -->
						<c:url var="deleteLink" value="/deleteTeacher">
							<c:param name="id" value="${list.id}" />
						</c:url>

						<tr>
							<td>${list.id}</td>
							<td>${list.lname}&ensp;${list.fname}</td>
							<td>${list.role.roleName}</td>
							<td>${list.depart.name }</td>
							<td>${list.image}</td>
							<td>${list.email}</td>
							<td>${list.phone}</td>
							<td>${list.address}</td>
							<td>${list.salary}</td>
							<td><a href="${updateLink}" class="btn btn-primary">Update</a>
								<a href="${deleteLink}" class="btn btn-danger">Delete</a></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>

		</table>


	</form:form>

	</section>

	<!-- 	<script>
		$(function() {
			// ON SELECTING ROW 
			$(".gfgselect")
					 .click( 
							function() {
								//FINDING ELEMENTS OF ROWS AND STORING THEM IN VARIABLES 
								var a = $(this).parents("tr").find(
										".gfgusername").text();
								var c = $(this).parents("tr").find(".gfgpp")
										.text();
								var d = $(this).parents("tr")
										.find(".gfgscores").text();
								var e = $(this).parents("tr").find(
										".gfgarticles").text();
								var p = "";
								// CREATING DATA TO SHOW ON MODEL 
								p += "<p id='a' name='GFGusername' >GFG UserHandle: "
										+ a + " </p>";

								p += "<p > First Name: <input type='text' name='fnamesx' value='"
										+ c + "'> </p>";
								p += "<p > Last Name: <input type='text' name='lname' value='"
									+ d + "'> </p>";
								p += "<p > Depart: <input type='text' name='depart' value='"
									+ e + "'> </p>";
								//CLEARING THE PREFILLED DATA 
								$("#divGFG").empty();
								//WRITING THE DATA ON MODEL 
								$("#divGFG").append(p);
							});
		});
	</script> -->

</body>
</html>
