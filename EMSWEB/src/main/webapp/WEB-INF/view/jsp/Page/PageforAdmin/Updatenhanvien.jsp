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
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- Bootstrap 3.3.2 -->
<link href="../../../../../resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link
	href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />
<!-- Morris chart -->
<link href="../../../../../resources/bootstrap/css/morris.css"
	rel="stylesheet" type="text/css" />
<!-- jvectormap -->
<link
	href="../../../../../resources/bootstrap/css/jquery-jvectormap-1.2.2.css"
	rel="stylesheet" type="text/css" />
<!-- Daterange picker -->
<link
	href="../../../../../resources/bootstrap/css/daterangepicker-bs3.css"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="../../../../../resources/bootstrap/css/AdminLTE.min.css"
	rel="stylesheet" type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
<link href="../../../../../resources/bootstrap/css/_all-skins.min.css"
	rel="stylesheet" type="text/css" />


</head>
<body>
	<section class="content-header">
		<h1>LÍ LỊCH</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Trang chủ</a></li>
			<li class="active">Quản lí nhân viên</li>
			<li class="active">Danh sách sinh viên</li>
			<li class="active">Cập nhật nhân viên</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Info boxes -->
		<!--Thoi Khoa Bieu -->
		<div class="row">
			<div class="col-md-12">
				<form:form action="/updatess" modelAttribute="staff"
					enctype="multipart/form-data">
					<div class="box box-primary">
						<!-- 						<img src="../../../../../resources/FileUpload/tri1703.jpg" name=""
							style="width: 200px; height: 200px;"> -->
						<!--form  -->


						<c:if test="${not empty List}">
							<c:forEach var="sp" items="${List}">
								<img src="../../../../../resources/FileUpload/${sp.image}"
									name="" style="width: 200px; height: 300px;">
								<div class="box-body">
									<div class="form-group">
										<input type="hidden" id="custId" name="custId" value="3487">
									</div>
									<div class="form-group">
										<label for="exampleInputFile">File input</label>
										<div class="input-group">
											<input type="File" class="form-control" name="files"
												id="InputImage"> <span class="input-group-btn">
												<button class="btn btn-default" type="submit">Update
												</button>
											</span>
										</div>
									</div>
									<div class="form-group">
										<label for="exampleInputName">Họ và Tên</label>
										<div class="input-group">
											<span class="input-group-addon">Họ</span>
											<input value="${sp.lname}" readonly class="form-control"/>
											<span class="input-group-addon">Tên</span>
											<input value="${sp.fname}" readonly class="form-control"/>
										</div>
									</div>
									<!-- 									<script type="text/javascript">
										var date = new Date("03/25/2015");
										document.getElementById("InputDob").value =date;
									</script> -->
									<div class="form-group">
										<label for="InputDob">Ngày sinh</label>
										<form:input path="dob" type="date" class="form-control"
											id="InputDob" min="1980-1-1" max="2020-12-31"
											value="${sp.dob}" />
									</div>

									<div class="form-group">
										<label for="exampleInputEmail">Email</label>
										<form:input path="email" value="${sp.email}"
											class="form-control" id="InputEmail" />
									</div>
									<div class="form-group">
										<label for="InputPhone">Số Điện Thoại</label>
										<form:input path="phone" value="${sp.phone}" type="text"
											class="form-control" id="InputPhone" />
									</div>
									<div class="form-group">
										<label for="InputPhone">Địa chỉ</label>
										<form:input path="address" value="${sp.address}" type="text"
											class="form-control" id="InputAddress" />
									</div>
									<div class="form-group">
										<label for="InputPhone">Trạng thái:</label> <label
											id="InputStatus">Học đi</label>
									</div>
									<div class="form-group">
										<label for="InputID">Cấp độ:</label>
										<form:input path="level" value="${sp.level}"
											class="form-control" />
									</div>
									<div class="form-group">
										<label for="InputID">Lương</label>
										<form:input path="salary" value="${sp.salary}"
											class="form-control" />
									</div>
									<%-- <div clas="form-group">
										<label for="InputID">Phòng Ban:</label>
										<form:select path="depart" items="${sp.depart.name}" />
									</div> --%>
									<div class="form-group">
										<label for="InputID">Phòng Ban:</label>
										<form:select path="depart" class="form-control" idxmlns="sel1">
											<c:if test="${not empty Listdp}">
												<c:forEach var="sp" items="${Listdp}">
													<form:option value="${sp.name}" />
													<%--  <form:options items="${Listdp}" /> --%>
												</c:forEach>
											</c:if>
										</form:select>
									</div>
									<%-- 	<div clas="form-group">
										<label for="InputID">Chức vụ</label>
										<form:select path="role" items="" />
									</div> --%>

									<div class="form-group">
										<label for="InputID">Chức vụ</label>
										<form:select path="role" class="form-control" idxmlns="sel1">
											<c:if test="${not empty Listr}">
												<c:forEach var="sp" items="${Listr}">
													<option>${sp.roleName}</option>
												</c:forEach>
											</c:if>
										</form:select>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
					<!-- /.box-body -->
					<div class="box-footer">
						<button type="submit" class="btn btn-primary">Xác nhận</button>
					</div>
				</form:form>
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</section>




	<script src="../../../../../resources/js/jQuery-2.1.3.min.js"></script>
	<!-- Bootstrap 3.3.2 JS -->
	<script src="../../../../../resources/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<!-- FastClick -->
	<script src='../../../../../resources/js/fastclick.min.js'></script>
	<!-- AdminLTE App -->
	<script src="../../../../../resources/js/app.min.js"
		type="text/javascript"></script>
	<!-- Sparkline -->
	<script src="../../../../../resources/js/jquery.sparkline.min.js"
		type="text/javascript"></script>
	<!-- jvectormap -->
	<script
		src="../../../../../resources/js/jquery-jvectormap-1.2.2.min.js"
		type="text/javascript"></script>
	<script
		src="../../../../resources/js/jquery-jvectormap-world-mill-en.js"
		type="text/javascript"></script>
	<!-- daterangepicker -->
	<script src="../../../../../resources/js/daterangepicker.js"
		type="text/javascript"></script>
	<!-- datepicker -->
	<script src="../../../../../resources/js/bootstrap-datepicker.js"
		type="text/javascript"></script>
	<!-- iCheck -->
	<script src="../../../../../resources/js/icheck.min.js"
		type="text/javascript"></script>
	<!-- SlimScroll 1.3.0 -->
	<script src="../../../../../resources/js/jquery.slimscroll.min.js"
		type="text/javascript"></script>
	<!-- ChartJS 1.0.1 -->
	<script src="../../../../../resources/js/Chart.min.js"
		type="text/javascript"></script>

	<!-- AdminLTE for demo purposes -->
	<script src="../../../../../resources/js/demo.js"
		type="text/javascript"></script>
</body>
</html>
