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
			Danh Sách Sinh Viên
			<button type="button" class="btn btn-info" data-toggle="modal"
				data-target="#myModal">Thêm Sinh Viên</button>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Trang chủ</a></li>
			<li class="active">Quản Lí Sinh Viên</li>
			<li class="active">Danh Sách Sinh Viên</li>
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
								<h4 class="modal-title">Đăng ký sinh viên</h4>
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
															<form:input type="hidden" path="id" />
															<div Class="form-group">
																<label for="InputName">Họ và tên:</label>
																<div Class="input-group">
																	<div class="input-group-prepend">
																		<span Class="input-group-text">Họ</span>
																	</div>
																	<form:input type="text" path="lname"
																		class="form-control" id="InputLastname" />
																	<div class="input-group-prepend">
																		<span Class="input-group-text">Tên</span>
																	</div>
																	<form:input type="text" path="fname"
																		class="form-control" id="InputFirstname" />
																</div>
															</div>
															<div class="form-group">
																<label for="InputID">Image:</label> <input type="File"
																	class="form-control" name="files" id="InputImage">
															</div>
															<div class="form-group">
																<label for="InputID">Email:</label>
																<form:input type="text" path="email"
																	class="form-control" id="InputEmail" />
															</div>

															<div class="form-group">
																<label for="InputID">Ngày sinh:</label>
																<form:input type="date" path="dob" class="form-control"
																	id="InputDob" min="1980-1-1" max="2020-12-31" />
															</div>
															<div class="form-group">
																<label for="InputID">Số Điện Thoại:</label>
																<form:input type="text" path="phone"
																	class="form-control" id="InputPhone" />
															</div>
															<div class="form-group">
																<label for="InputID">Địa chỉ:</label>
																<form:input path="address" class="form-control" />
															</div>

															<div class="form-group">
																<label for="InputID">Trạng Thái:</label>
																<form:input path="status" class="form-control" />
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
																<label>Họ và Tên:</label>
																<div class="input-group">
																	<div class="input-group-prepend">
																		<span Class="input-group-text">Họ</span>
																	</div>
																	<input type="text" name="lnamee" class="form-control" />
																	<div class="input-group-prepend">
																		<span Class="input-group-text">Tên</span>
																	</div>
																	<input type="text" name="fnamee" class="form-control" />
																</div>
															</div>

															<div class="form-group">
																<label for="InputID">Image:</label> <input type="File"
																	class="form-control" name="filess" id="InputImage">
															</div>

															<div Class="form-group">
																<label for="InputID">Email:</label>
																 <input
																	type="text" name="emaill" class="form-control"
																	id="InputFirstname" />
															</div>

															<div class="form-group">
																<label for="InputID">Ngày sinh:</label> <input
																	type="date" name="dobb" class="form-control"
																	id="InputDob" min="1980-1-1" max="2020-12-31" />
															</div>

															<div Class="form-group">
																<label>Phone:</label>> <input type="text" name="phonee"
																	class="form-control" />
															</div>

															<div Class="form-group">
																<label>Địa chỉ:</label>> <input type="text"
																	name="addresss" class="form-control" />
															</div>

															<div Class="form-group">
																<span Class="input-group-addon">Tình trạng:<dspan>
																	<input type="text" name="statuss" class="form-control" />
															</div>

															<div Class="form-group">
																<label>Quan hệ:</label> <select class="custom-select"
																	name="relationshipp">
																	<option value="Ba">Ba</option>
																	<option value="Me">Mẹ</option>
																	<option value="Anh/Chi">Anh/Chị</option>
																	<option value="Co/chu">Cô/chú</option>
																</select>
															</div>
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
									value="Lưu">
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
			<colgroup>
				<col span="1" style="width: 5%;">
				<col span="1" style="width: 15%;">
				<col span="1" style="width: 14%;">
				<col span="1" style="width: 11%;">
				<col span="1" style="width: 10%;">
				<col span="1" style="width: 19%;">
				<col span="1" style="width: 10%;">
				<col span="1" style="width: 14%;">
			</colgroup>
			<thead style="background-color: #4876FF; color: white">
				<tr>
					<th>Mã</th>
					<th>Họ Tên</th>
					<th>Email</th>
					<th>Ngày sinh</th>
					<th>Số điện thoại</th>
					<th>Địa chỉ</th>
					<th>Trạng thái</th>
					<th></th>
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
							<td class="class">
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
