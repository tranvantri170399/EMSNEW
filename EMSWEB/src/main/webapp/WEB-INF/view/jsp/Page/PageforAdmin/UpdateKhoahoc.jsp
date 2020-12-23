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
<link href="../../../../../resources/css/table.css" rel="stylesheet"
	type="text/css" />


<script>
	$(document).ready(function() {
		$('#table1').DataTable();
	});
	function validate(){
		 
		 var name = document.myform.InputName.value;
		 var ckstatus = document.myform.InputStatus.value;
		 var hp = document.myform.InputHp.value;
		 
		 var status = false;
		 
		 
		 
		 if(name.length < 1){
				document.getElementById("checkName").innerHTML = 
		            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Tên khóa học!</span> ";
		        status = false;
			}else{
				document.getElementById("checkName").innerHTML = 
		            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
		            status = true;
			}
		 
		 if(ckstatus.length < 1){
				document.getElementById("checkStatus").innerHTML = 
		            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Trạng thái!</span> ";
		        status = false;
			}else{
				document.getElementById("checkStatus").innerHTML = 
		            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
			}
		 
		 if(hp.length < 1){
				document.getElementById("checkHp").innerHTML = 
		            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Học phần!</span> ";
		        status = false;
			}else{
				document.getElementById("checkHp").innerHTML = 
		            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
			}
		 
		 return status;
	}
</script>

<style type="text/css">
#InputLastname {
	border-color: red;
}
</style>
</head>
<body>
	<section class="content-header">
		<h1>Danh Sách Khóa Học</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Trang chủ</a></li>
			<li class="active">Quản Lí Lịch Học</li>
			<li class="active">Danh Sách Khóa Học</li>
		</ol>
	</section>


	<!-- Modal content-->
	<form:form action="/newCourse/testupdate" modelAttribute="course"
		enctype="multipart/form-data" onsubmit="return validate()" name="myform">

		<div>
			<c:if test="${not empty List}">
				<c:forEach var="sp" items="${List}">
					<div class="form-group">
						<label for="InputID">Mã Khóa Học:</label>
						<form:input type="text" path="id" class="form-control"
							id="InputEmail" value="${sp.id}" readonly="true" />
					</div>

					<div class="form-group">
						<label for="InputID">Tên Khóa Học:</label>
						<form:input type="text" path="name" class="form-control"
							id="InputName" value="${sp.name}" />
							<span id="checkName"></span>
					</div>

					<div class="form-group">
						<label for="InputID">Học Kì</label> <select name="semesters"
							class="form-control" id="sel1">
							<c:if test="${not empty Lists}">
								<c:forEach var="sp" items="${Lists}">
									<%-- <form:option value="${sp.name}" /> --%>
									<option>${sp.name}</option>
								</c:forEach>
							</c:if>
						</select>
					</div>
					<div class="form-group">
						<label for="InputID">Giáo Viên</label> <select name="teachers"
							class="form-control" id="sel1">
							<c:if test="${not empty Listt}">
								<c:forEach var="sp" items="${Listt}">
									<option>${sp.fname}</option>
								</c:forEach>
							</c:if>
						</select>
					</div>
					<div class="form-group">
						<label for="InputID">Trạng Thái:</label>
						<c:if test="${not empty List}">
				<c:forEach var="sp" items="${List}">
						<form:input path="status" class="form-control" id="InputStatus"
							value="${sp.status}" />
							<span id="checkStatus"></span>
							</c:forEach></c:if>
					</div>
					<div class="form-group">
						<label for="InputID">Học Phần:</label>
						<c:if test="${not empty List}">
				<c:forEach var="sp" items="${List}">
						<form:input path="section" class="form-control"  id="InputHp"
							value="${sp.section}" />
							<span id="checkHp"></span>
							</c:forEach></c:if>
					</div>
				</c:forEach>
			</c:if>
		</div>


		<input type="submit" name="btnsave" class="btn btn-info" value="SAVE">



	</form:form>


</body>
</html>
