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
		<h1>Thông Tin Lịch Học</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Trang chủ</a></li>
			<li class="active">Quản Lí Nhân Viên</li>
			<li class="active">Danh Sách Lịch Học</li>
			<li class="active">Cập Nhật Lịch Học</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Info boxes -->
		<!--Thoi Khoa Bieu -->
		<div class="row">
			<div class="col-md-12">
				<form:form action="/updatess/lichhoc" modelAttribute="schedule"
					enctype="multipart/form-data">
					<div class="box box-primary">
						<!-- 						<img src="../../../../../resources/FileUpload/tri1703.jpg" name=""
							style="width: 200px; height: 200px;"> -->
						<!--form  -->


						<div class="box-body">
							<div class="form-group">
								<input type="hidden" id="custId" name="custId" value="3487">
							</div>
							<div class="form-group">
								<label for="exampleInputName">Tên Giảng Đường:</label>
								<select name="testamphitheater" class="form-control"
									id="sel1">
									<c:if test="${not empty Lista}">
										<c:forEach var="sp" items="${Lista}">
											<option>${sp.amphitheaterName}</option>
										</c:forEach>
									</c:if>
								</select>
							</div>
							<!-- 									<script type="text/javascript">
										var date = new Date("03/25/2015");
										document.getElementById("InputDob").value =date;
									</script> -->
							<div class="form-group">
								<label for="exampleInputName">Tên lớp:</label>
								<form:select path="classroom" class="form-control"
									idxmlns="sel1">
									<c:if test="${not empty Listc}">
										<c:forEach var="sp" items="${Listc}">
											<form:option value="${sp.name}" />
											<%--  <form:options items="${Listdp}" /> --%>
										</c:forEach>
									</c:if>
								</form:select>
							</div>

							<div class="form-group">
								<label for="exampleInputName">Tên phòng:</label>
								<form:select path="schoolroom" class="form-control"
									idxmlns="sel1">
									<c:if test="${not empty Listsh}">
										<c:forEach var="sp" items="${Listsh}">
											<form:option value="${sp.schoolroomnumber}" />
											<%--  <form:options items="${Listdp}" /> --%>
										</c:forEach>
									</c:if>
								</form:select>
							</div>

							<div class="form-group">
								<label for="exampleInputName">Tên Ca:</label>
								<select name="teststudyShift" class="form-control"
									id="sel1">
									<c:if test="${not empty Lists}">
										<c:forEach var="sp" items="${Lists}">
											<option>${sp.nameShift}</option>
										</c:forEach>
									</c:if>
								</select>
							</div>

							<div class="form-group">
								<label for="exampleInputName">Môn:</label>
								<form:select path="course" class="form-control" idxmlns="sel1">
									<c:if test="${not empty Listco}">
										<c:forEach var="sp" items="${Listco}">
											<form:option value="${sp.name}" />
											<%--  <form:options items="${Listdp}" /> --%>
										</c:forEach>
									</c:if>
								</form:select>
							</div>

							<div class="form-group">
								<label for="InputID">Ngày Học:</label>
								<form:input type="date" path="date" class="form-control"
									id="InputDate" />
								<span id="checkDate"></span>
							</div>

							<div class="form-group">
								<label for="exampleInputName">Chú ý:</label>
								<form:select path="des" class="form-control" idxmlns="sel1">
									<form:option value="Lịch Thi" />
									<form:option value="Lịch Học" />
								</form:select>
							</div>
						</div>
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
