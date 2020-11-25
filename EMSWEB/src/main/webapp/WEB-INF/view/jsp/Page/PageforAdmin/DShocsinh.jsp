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
			Danh Sách Nhân Viên
			<button type="button" class="btn btn-info" data-toggle="modal"
				data-target="#myModal">Thêm nhân viên</button>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Trang chủ</a></li>
			<li class="active">Quản lí nhân viên</li>
			<li class="active">Danh sách Nhân Viên</li>
		</ol>
	</section>

	<div class="row">
		<article class="col-sm-9">
			<!--MODAL Đăng ký & đăng nhập-->
			<div class="modal fade" id="myModal">
				<div class="modal-dialog modal-lg">
					<form:form action="/studentNew" modelAttribute="student"
						enctype="multipart/form-data">
						<div class="modal-content">

							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">ĐĂNG NHẬP & ĐĂNG KÝ TÀI KHOẢN</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<!-- Modal body -->
							<div class="modal-body">
								<div class="container">
									<div class="row">
										<div class="col-sm-6">
											<div class="card">
												<div class="card-body">

													<div class="modal-content">
														<div class="modal-header">

															<h4 class="modal-title">Thêm Học Sinh</h4>
														</div>
														<div class="modal-body">
															<div>

																<div class="form-group">
																	<form:input type="hidden" path="id" />
																</div>
																<div Class="form-group">
																	<label for="InputName">Họ và tên:</label>
																	<div Class="input-group">
																		<span Class="input-group-addon">Họ</span>
																		<form:input type="text" path="lname"
																			classxmlns="form-control" id="InputLastname" />
																		<span Class="input-group-addon">Tên</span>
																		<form:input type="text" path="fname"
																			classxmlns="form-control" id="InputFirstname" />
																	</div>
																</div>
																<div clas="form-group">
																	<label for="InputID">Image:</label> <input type="File"
																		class="form-control" name="files" id="InputImage">
																</div>
																<div clas="form-group">
																	<label for="InputID">Email:</label>
																	<form:input type="text" path="email"
																		classxmlns="form-control" id="InputEmail" />
																</div>

																<div clas="form-group">
																	<label for="InputID">Ngày sinh</label>
																	<form:input type="date" path="dob"
																		classxmlns="form-control" id="InputDob" min="1980-1-1"
																		max="2020-12-31" />
																</div>
																<div clas="form-group">
																	<label for="InputID">Số Điện Thoại</label>
																	<form:input type="text" path="phone"
																		classxmlns="form-control" id="InputPhone" />
																</div>
																<div clas="form-group">
																	<label for="InputID">Địa chỉ:</label>
																	<form:input path="address" classxmlns="form-control" />
																</div>

																<div clas="form-group">
																	<label for="InputID">Trạng Thái:</label>
																	<form:input path="status" classxmlns="form-control" />
																</div>

															</div>
														</div>
													</div>
												</div>
											</div>
										</div>

										<div class="col-sm-6">
											<div class="card">
												<div class="card-body">
													<div class="modal-content">
														<div class="modal-header">

															<h4 class="modal-title">Phu huynh</h4>
														</div>
														<div class="modal-body">

															<div Class="form-group">
																<span Class="input-group-addon">Tên<dspan>
																	<input type="text" name="fnamee"
																		classxmlns="form-control" />
															</div>

															<div Class="form-group">
																<span Class="input-group-addon">Họ</span> <input
																	type="text" name="lnamee" id="InputFirstname" />
															</div>

															<div clas="form-group">
																<label for="InputID">Image:</label> <input type="File"
																	class="form-control" name="filess" id="InputImage">
															</div>

															<div Class="form-group">
																<span Class="input-group-addon">Email<dspan>
																	<input type="text" name="emaill"
																		classxmlns="form-control" id="InputFirstname" />
															</div>

															<div clas="form-group">
																<label for="InputID">Ngày sinh</label> <input
																	type="date" name="dobb" classxmlns="form-control"
																	id="InputDob" min="1980-1-1" max="2020-12-31" />
															</div>

															<div Class="form-group">
																<span Class="input-group-addon">Phone<dspan>
																	<input type="text" name="phonee"
																		classxmlns="form-control" />
															</div>

															<div Class="form-group">
																<span Class="input-group-addon">Địa chỉ<dspan>
																	<input type="text" name="addresss"
																		classxmlns="form-control" />
															</div>

															<div Class="form-group">
																<span Class="input-group-addon">Tình trạng<dspan>
																	<input type="text" name="statuss"
																		classxmlns="form-control" />
															</div>

															<div Class="form-group">
																<span Class="input-group-addon">Quan hệ<dspan>
																	<input type="text" name="relationshipp"
																		classxmlns="form-control" />
															</div>

															<select name="relationshipp">
																<option value="volvo">Ba</option>
																<option value="saab">Mẹ</option>
																<option value="mercedes">Anh/Chị</option>
																<option value="audi">Cô/chú</option>
															</select>

														</div>
													</div>

												</div>

											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- Modal footer -->
							<div class="modal-footer">
								<input type="submit" name="btnsave" class="btn btn-info"
									value="SAVE">
								<button type="button" class="btn btn-primary"
									data-dismiss="modal">Hủy</button>
							</div>
						</div>
					</form:form>
				</div>

			</div>
	</div>

	</article>
	</div>

	<!--Table  -->
	<form:form action="/save" modelAttribute="student">
		<table id="table1" class="display">

			<thead style="background-color: aqua;">
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Email</th>
					<th>Ngày sinh</th>
					<th>Số điện thoại</th>
					<th>Địa chỉ</th>
					<th>status</th>
					<th>Action</th>
				</tr>
			</thead>

			<tbody>
				<c:if test="${not empty List}">
					<c:forEach var="list" items="${List}">


						<!-- construct an "update" link with customer id -->
						<c:url var="updateLink" value="/updateFormHS">
							<c:param name="id" value="${list.id}" />
						</c:url>

						<!-- construct an "delete" link with customer id -->
						<c:url var="deleteLink" value="/deleteST">
							<c:param name="id" value="${list.id}" />
						</c:url>

						<tr>
							<td>${list.id}</td>
							<td>${list.lname}&ensp;${list.fname}</td>
							<td>${list.email}</td>
							<td>${list.dob}</td>
							<td>${list.phone}</td>
							<td>${list.address}</td>
							<td>${list.status}</td>
							<td><a href="${updateLink}" class="btn btn-primary">Update</a>
								<a href="${deleteLink}" class="btn btn-danger">Delete</a></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>

		</table>


	</form:form>


</body>
</html>
