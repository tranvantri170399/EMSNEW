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
<script>
function validate() {
	var lastname = document.myform.InputLastname.value;
	var firstname = document.myform.InputFirstname.value;
	var email = document.myform.InputEmail.value;
	var dob = document.myform.InputDob.value;
	var phone = document.myform.InputPhone.value;
	var address = document.myform.InputAddress.value;
	var statusCheck = document.myform.InputStatus.value;
	var level = document.myform.InputLevel.value;
	var salary = document.myform.InputSalary.value;
	
	var regExp = /^(0[234][0-9]{8}|1[89]00[0-9]{4})$/;
    var atposition = email.indexOf("@");
    var dotposition = email.lastIndexOf(".");
    
	var status = false;
	
	if (lastname.length < 1) {
        document.getElementById("checkName").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Họ!</span> ";
        status = false;
    }else if(firstname.length < 1){
    	document.getElementById("checkName").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Tên!</span> ";
        status = false;
    }else{
    	document.getElementById("checkName").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
    	status = true;
    }
	
	if(email.length < 1){
		document.getElementById("checkEmail").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Email!</span> ";
        status = false;
	}else if(atposition < 1 || dotposition < (atposition + 2)
            || (dotposition + 2) >= email.length){
		document.getElementById("checkEmail").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Email không đúng định dạng!</span> ";
        status = false;
	}
	else{
		document.getElementById("checkEmail").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
	
	if(dob.length < 1){
		document.getElementById("checkDob").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Ngày sinh!</span> ";
		status = false;
	}else{
		document.getElementById("checkDob").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
	
	if(phone.length < 1){
		document.getElementById("checkPhone").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Số điện thoại!</span> ";
        status = false;
	}else if(phone.length < 9 ||phone.length > 13 ) {
		if(regExp.test(phone)){
			document.getElementById("checkPhone").innerHTML = 
	            " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
		}else{
		document.getElementById("checkPhone").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Số điện không đúng định dạng!</span> ";
        status = false;
		}
	}else{
		document.getElementById("checkPhone").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
	
	if(address.length<1){
		document.getElementById("checkAddress").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Địa chỉ!</span> ";
        status = false;
	}else{
		document.getElementById("checkAddress").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
	
	if(statusCheck.length<1){
		document.getElementById("checkStatus").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Trạng thái!</span> ";
        status = false;
	}else{
		document.getElementById("checkStatus").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
	
	if(level.length<1){
		document.getElementById("checkLevel").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Cấp độ!</span> ";
        status = false;
	}else if(!level.match(/^\d+/)){
		document.getElementById("checkLevel").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Cấp độ chỉ được nhập số!</span> ";
        status = false;
	}else{
		document.getElementById("checkLevel").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
	
	if(salary.length<1){
		document.getElementById("checkSalary").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Lương!</span> ";
        status = false;
	}else if(!salary.match(/^\d+/)){
		document.getElementById("checkSalary").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Lương chỉ được nhập số!</span> ";
        status = false;
	}else{
		document.getElementById("checkSalary").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
	
	return status;
	
}

</script>

<style type="text/css">
th.image.sorting {
	width: 50px;
}
</style>
</head>

<body>
	<section class="content-header">
		<h1>
			Danh Sách Giáo Viên
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#myModal">Thêm Giáo Viên</button>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Trang chủ</a></li>
			<li class="active">Quản Lí Nhân Viên</li>
			<li class="active">Danh Sách Giáo Viên</li>
		</ol>
		<hr>
	</section>
	<!--Modalthemnhanvien-->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<form:form action="/newTeacher" modelAttribute="teacherNew"
				enctype="multipart/form-data" onsubmit="return validate()" name="myform">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Thêm Nhân Viên</h4>
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
								<span id="checkName"></span>
							</div>

							<div class="form-group">
								<label for="InputID">Image:</label>
								<div class="custom-file">
									<input type="file" class="custom-file-input" name="files"
										id="InputImage"> <label class="custom-file-label"
										for="InputImage">Choose file</label>
								</div>
							</div>
							<div class="form-group">
								<label for="InputID">Email:</label>
								<form:input type="text" path="email" class="form-control"
									id="InputEmail" />
									<span id="checkEmail"></span>
							</div>

							<div class="form-group">
								<label for="InputID">Ngày sinh</label>
								<form:input type="date" path="dob" class="form-control"
									id="InputDob" min="1980-1-1" max="2020-12-31" />
									<span id="checkDob"></span>
							</div>
							<div class="form-group">
								<label for="InputID">Số Điện Thoại</label>
								<form:input type="text" path="phone" class="form-control"
									id="InputPhone" />
									<span id="checkPhone"></span>
							</div>
							<div class="form-group">
								<label for="InputID">Địa chỉ:</label>
								<form:input type="text" path="address" class="form-control"
									id="InputAddress" />
									<span id="checkAddress"></span>
							</div>
							<div class="form-group">
								<label for="InputID">Trạng Thái:</label>
								<form:input path="status" class="form-control" id="InputStatus"/>
								<span id="checkStatus"></span>
							</div>
							<div class="form-group">
								<label for="InputID">Cấp độ:</label>
								<form:input path="level" class="form-control" id="InputLevel"/>
								<span id="checkLevel"></span>
							</div>
							<div class="form-group">
								<label for="InputID">Lương</label>
								<form:input path="salary" class="form-control" id="InputSalary"/>
								<span id="checkSalary"></span>
							</div>
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
							<div class="form-group">
								<label for="InputID">Chức vụ</label>
								<form:select path="role" class="custom-select" idxmlns="sel1">
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
							value="Lưu">
						<button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
					</div>

				</div>
			</form:form>
		</div>
	</div>

	<!--Table  -->
	<table id="table1" class="display thead-dark">
    	<colgroup>
       		<col span="1" style="width: 5%;">
       		<col span="1" style="width: 10%;">
       		<col span="1" style="width: 10%;">
       		<col span="1" style="width: 11%;">
       		<col span="1" style="width: 14%;">
       		<col span="1" style="width: 10%;">
       		<col span="1" style="width: 16%;">
       		<col span="1" style="width: 10%;">
       		<col span="1" style="width: 14%;">       		       		       		
    	</colgroup>
		<thead style="background-color:#4876FF ;color: white">
			<tr>
				<th>ID</th>
				<th>Tên GV</th>
				<th>Chức vụ</th>
				<th>Phòng Ban</th>
				<th>Email</th>
				<th>SĐT</th>
				<th>Địa chỉ</th>
				<th>Lương</th>
				<th></th>
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
						<td>${list.email}</td>
						<td>${list.phone}</td>
						<td>${list.address}</td>
						<td>${list.salary}</td>
						<td>
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