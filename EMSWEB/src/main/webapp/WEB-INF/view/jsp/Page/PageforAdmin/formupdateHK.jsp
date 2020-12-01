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

<script type="text/javascript">
function validate(){
	var name = document.myform.InputName.value;
	var dSt = document.myform.InputDSt.value;
	var dEnd = document.myform.InputDEnd.value;
	var statusCk = document.myform.InputStatus.value;
	
	var status = false;
	
	if(name.length < 1){
		document.getElementById("checkName").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Tên học kỳ!</span> ";
        status = false;
	}else{
		document.getElementById("checkName").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
            status = true;
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

</head>
<body>
	<section class="content-header">
		<h1>LÍ LỊCH</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Trang chủ</a></li>
			<li class="active">Quản Lí Sinh Viên</li>
			<li class="active">Danh Sách Học Kỳ</li>
			<li class="active">Cập Nhật Học Kỳ</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Info boxes -->
		<!--Thoi Khoa Bieu -->
		<div class="row">
			<div class="col-md-12">
				<form:form action="/newSemester" modelAttribute="semester"
					enctype="multipart/form-data" onsubmit="return validate()" name="myform">
					<div class="box box-primary">
						<!-- 						<img src="../../../../../resources/FileUpload/tri1703.jpg" name=""
							style="width: 200px; height: 200px;"> -->
						<!--form  -->


						<c:if test="${not empty List}">
							<c:forEach var="sp" items="${List}">
								<div class="box-body">
									<div class="form-group">
										<input type="hidden" id="id" name="id" value="${sp.id }">
									</div>
								
									<div class="form-group">
										<label for="InputPhone">Tên học kì</label>
										<form:input path="name" value="${sp.name}" type="text"
											class="form-control" id="InputName" />
											<span id="checkName"></span>
									</div>
										<div class="form-group">
										<label for="InputDob">Thời gian bắt đàu học kì</label>
										<form:input path="starttime" type="date" class="form-control"
											id="InputDSt" min="1980-1-1" max="2020-12-31"
											value="${sp.starttime}" />
											<span id="checkDSt"></span>
									</div>
									<div class="form-group">
										<label for="InputDob">Thời gian kết thúc</label>
										<form:input path="endtime" type="date" class="form-control"
											id="InputDEnd" min="1980-1-1" max="2020-12-31"
											value="${sp.endtime}" />
											<span id="checkDEnd"></span>
									</div>
									<div class="form-group">
										<label for="InputID">Trạng thái</label>
										<form:input path="status" value="${sp.status}"
											class="form-control" id="InputStatus" />
											<span id="checkStatus"></span>
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
