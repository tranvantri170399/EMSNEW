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
	var number = document.myform.InputClassNumber.value;
	var dt = document.myform.InputDt.value;
	
	var status = false;
	
	if(name.length < 1){
		 document.getElementById("checkName").innerHTML = 
	            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Tên phòng!</span> ";
	        status = false;
	}else{
		document.getElementById("checkName").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
    	status = true;
	}
	
	if(number.length < 1){
		document.getElementById("checkNumber").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Số phòng!</span> ";
        status = false;
	}else{
		document.getElementById("checkNumber").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
	
	if(dt.length < 1){
		document.getElementById("checkDt").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Diện tích!</span> ";
        status = false;
	}else if(!dt.match(/^\d+/)){
		document.getElementById("checkDt").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Diện tích chỉ nhập bằng số!</span> ";
        status = false;
	}else{
		document.getElementById("checkDt").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
	
	return status;
}
</script>

</head>
<body>
	<section class="content-header">
		<h1>THÔNG TIN</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Trang chủ</a></li>
			<li class="active">Quản lí CSVC</li>
			<li class="active">Danh sách Phòng Học</li>
			<li class="active">Cập nhật Phòng Học</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Info boxes -->
		<!--Thoi Khoa Bieu -->
		<div class="row">
			<div class="col-md-12">
				<form:form action="/updateSchoolRooms" modelAttribute="room" onsubmit="return validate()" name="myform">
					<div class="box box-primary">
<!-- 						<img src="../../../../../resources/FileUpload/tri1703.jpg" name=""
							style="width: 200px; height: 200px;"> -->
						<!--form  -->


						<c:if test="${not empty List}">
							<c:forEach var="sp" items="${List}">
								<div class="box-body">
										<input type="hidden" id="custId" name="id" value="${sp.id}" readonly="readonly" >
									<div class="form-group">
										<label for="exampleInputEmail">Tên</label>
										<form:input path="name" value="${sp.name}"
											class="form-control" id="InputName" />
											<span id="checkName"></span>
									</div>
									<div class="form-group">
										<label for="InputPhone">Số Phòng</label>
										<form:input path="schoolroomnumber" value="${sp.schoolroomnumber}" type="text"
											class="form-control" id="InputClassNumber" />
											<span id="checkNumber"></span>
									</div>
									<div class="form-group">
										<label for="InputPhone">Diện Tích</label>
										<div class="input-group">
										<form:input path="surfacearea" value="${sp.surfacearea}" type="text"
											class="form-control" id="InputDt" />
										<span class="input-group-addon">m<sup>2</sup></span>	
										</div>	
										<span id="checkDt"></span>
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
