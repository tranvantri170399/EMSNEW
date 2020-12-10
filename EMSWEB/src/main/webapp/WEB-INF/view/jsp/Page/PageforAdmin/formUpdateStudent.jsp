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
<script>
function validate(){
	var emailUp = document.myform.InputEmail.value;
	var addressUp = document.myform.InputAddress.value;
	var statusUp = document.myform.status.value;
	var idcardUp = document.myform.idcard.value;
	
	var atposition = emailUp.indexOf("@");
    var dotposition = emailUp.lastIndexOf(".");
    
	var status = false;
	
	if(emailUp.length < 1){
		document.getElementById("checkEmail").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Email!</span> ";
        status = false;
	}else if(atposition < 1 || dotposition < (atposition + 2)
            || (dotposition + 2) >= emailUp.length){
		document.getElementById("checkEmail").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Email không đúng định dạng!</span> ";
        status = false;
	}
	else{
		document.getElementById("checkEmail").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
        status = true;
	}
	
	if(addressUp.length<1){
		document.getElementById("checkAddress").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Địa chỉ!</span> ";
        status = false;
	}else{
		document.getElementById("checkAddress").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
	
	if(statusUp.length<1){
		document.getElementById("checkStatus").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Trạng thái!</span> ";
        status = false;
	}else{
		document.getElementById("checkStatus").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
	if(idcardUp.length<1){
		document.getElementById("checkIdcard").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Mã căn cước!</span> ";
        status = false;
	}else if(!idcardUp.match(/^\d+/)){
		document.getElementById("checkIdcard").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Mã căn cước chỉ bằng số!</span> ";
        status = false;
	}
	else{
		document.getElementById("checkIdcard").innerHTML = 
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
				<form:form action="/updateStudent" modelAttribute="student"
					enctype="multipart/form-data" onsubmit="return validate()" name="myform">
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
										<input type="hidden" id="id" name="id" value="${sp.id}">
									</div>

									<div class="form-group">
										<label for="exampleInputFile">Chọn ảnh</label>
										<div class="input-group">
											<input type="File" class="form-control" name="files"
												id="InputImage"> <span class="input-group-btn">
											</span>
										</div>
									</div>
									<div class="form-group">
										<label for="exampleInputEmail">Mail</label>
										<form:input name="email" path="email" value="${sp.email}"
											class="form-control" id="InputEmail"/>
											<span id="checkEmail"></span>
									</div>
									<div class="form-group">
										<label for="exampleInputEmail">Địa chỉ</label>
										<form:input path="address" value="${sp.address}"
											class="form-control" id="InputAddress" />
											<span id="checkAddress"></span>
									</div>
									<div class="form-group">
										<label for="exampleInputEmail">Tình trạng</label>
										<form:input path="status" value="${sp.status}"
											class="form-control" id="status" />
											<span id="checkStatus"></span>
									</div>
									<div class="form-group">
										<label for="exampleInputEmail">Mã căn cước</label>
										<form:input path="idcard" value="${sp.idcard}"
											class="form-control" id="idcard" />
											<span id="checkIdcard"></span>
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
