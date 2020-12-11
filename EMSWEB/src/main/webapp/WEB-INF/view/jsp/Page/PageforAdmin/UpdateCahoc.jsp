<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EMS | Cập Nhật Phòng Học</title>
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

</head>
<body>
	<section class="content-header">
		<h1>Thông Tin Ca học</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Trang chủ</a></li>
			<li class="active">Quản Lí Lịch Học </li>
			<li class="active">Danh Sách Ca Học</li>
			<li class="active">Cập Nhật Ca Học</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Info boxes -->
		<!--Thoi Khoa Bieu -->
		<div class="row">
			<div class="col-md-12">
				<form:form action="/updateStudyShift" modelAttribute="studyShift" onsubmit="return validate()" name="myform">
					<div class="box box-primary">
<!-- 						<img src="../../../../../resources/FileUpload/tri1703.jpg" name=""
							style="width: 200px; height: 200px;"> -->
						<!--form  -->


						<c:if test="${not empty List}">
							<c:forEach var="sp" items="${List}">
								<div class="box-body">
									<div class="form-group" >
										<input type="hidden" id="custId" name="id" value="${sp.id}" readonly="readonly" >
									</div>

									<div class="form-group">
										<label for="exampleInputEmail">Tên Ca Học</label>
										<form:input path="nameShift" value="${sp.nameShift}"
											class="form-control" id="InputName" />
											<span id="checkName"></span>
									</div>
									<div class="form-group">
										<label for="InputPhone">Thời Gian Bắt Đầu</label>
										<form:input path="startingTime" value="${sp.startingTime}" type="text"
											class="form-control" id="InputTimeSt" />
											<span id="checkTimeSt"></span>
									</div>
									<div class="form-group">
										<label for="InputPhone">Thời Gian Kết Thúc</label>
										<form:input path="endTime" value="${sp.endTime}" type="text"
											class="form-control" id="InputTimeEnd" />
											<span id="checkTimeEnd"></span>
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
	<!-- SlimScroll 1.3.0 -->
	<script src="../../../../../resources/js/jquery.slimscroll.min.js"
		type="text/javascript"></script>


	<!-- AdminLTE for demo purposes -->
	<script src="../../../../../resources/js/demo.js"
		type="text/javascript"></script>
</body>
</html>
