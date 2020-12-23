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
<link href="../../../../../resources/css/table.css"
	rel="stylesheet" type="text/css" />


<script>
	$(document).ready(function() {
		$('#table1').DataTable();
	});
</script>

<script>
function validate() {
	//Sinh viên
    var lastnameSt = document.myform.InputLastnameSt.value;
    var firstnameSt = document.myform.InputFirstnameSt.value;
    var emailSt = document.myform.InputEmailSt.value;
    var phoneSt = document.myform.InputPhoneSt.value;
    var dobSt = document.myform.InputDobSt.value;
    var addressSt= document.myform.InputAddressSt.value;
    var statusSt = document.myform.InputStatusSt.value;
    
    //Định dạng form
    var regExp = /^(0[234][0-9]{8}|1[89]00[0-9]{4})$/;
    var atpositionSt = emailSt.indexOf("@");
    var dotpositionSt = emailSt.lastIndexOf(".");

    
    var status = false;

    if (lastnameSt.length == 0) {
        document.getElementById("checkNameSt").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Họ!</span> ";
        status = false;
    }else if(firstnameSt.length == 0){
    	document.getElementById("checkNameSt").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Tên!</span> ";
        status = false;
    }else{
    	document.getElementById("checkNameSt").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
    	status = true;
    }
    
	if(emailSt.length < 1){
		document.getElementById("checkEmailSt").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Email!</span> ";
        status = false;
	}else if(atpositionSt < 1 || dotpositionSt < (atpositionSt + 2)
            || (dotpositionSt + 2) >= emailSt.length){
		document.getElementById("checkEmailSt").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Email không đúng định dạng!</span> ";
        status = false;
	}
	else{
		document.getElementById("checkEmailSt").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
	
	if(phoneSt.length==0){
		document.getElementById("checkPhoneSt").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Số điện thoại!</span> ";
        status = false;
	}else if(phoneSt.length < 9 ||phoneSt.length > 13 ) {
		if(regExp.test(phoneSt)){
			document.getElementById("checkPhoneSt").innerHTML = 
	            " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
		}else{
		document.getElementById("checkPhoneSt").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Số điện không đúng định dạng!</span> ";
        status = false;
		}
	}else{
		document.getElementById("checkPhoneSt").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
	
	if(dobSt.length < 1){
		document.getElementById("checkDobSt").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Ngày sinh!</span> ";
        status = false;
	}else{
		document.getElementById("checkDobSt").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}

	if(statusSt.length<1){
		document.getElementById("checkStatusSt").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Trạng thái!</span> ";
        status = false;
	}else{
		document.getElementById("checkStatusSt").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
	
	if(addressSt.length<1){
		document.getElementById("checkAddressSt").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Địa chỉ!</span> ";
        status = false;
	}else{
		document.getElementById("checkAddressSt").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
	
	//Phụ huynh
	var lnamePr = document.myform.InputLastnamePr.value;
	var fnamePr = document.myform.InputFirstnamePr.value;
	var emailPr = document.myform.InputEmailPr.value;
	var dobPr = document.myform.InputDobPr.value;
	var phonePr = document.myform.InputPhonePr.value;
	var addressPr = document.myform.InputAddressPr.value;
	var statusPr = document.myform.InputStatusPr.value;
	
	//Định dạng form
	var atpositionPr = emailPr.indexOf("@");
    var dotpositionPr = emailPr.lastIndexOf(".");
	if(lnamePr.length <1){
		document.getElementById("checkNamePr").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Họ!</span> ";
        status = false;
	}else{
		document.getElementById("checkNamePr").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
	
	if(fnamePr.length <1){
		document.getElementById("checkNamePr").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Tên!</span> ";
        status = false;
	}else{
		document.getElementById("checkNamePr").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}

	if(emailPr.length==0){
		document.getElementById("checkEmailPr").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Email!</span> ";
        status = false;
	}else if(atpositionPr < 1 || dotpositionPr < (atpositionPr + 2)
            || (dotpositionPr + 2) >= emailPr.length){
		document.getElementById("checkEmailPr").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Email không đúng định dạng!</span> ";
        status = false;
	}
	else{
		document.getElementById("checkEmailPr").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
	
	if(dobPr.length < 1){
		document.getElementById("checkDobPr").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Ngày sinh!</span> ";
        status = false;
	}else{
		document.getElementById("checkDobPr").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
	
	if(phonePr.length==0){
		document.getElementById("checkPhonePr").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Số điện thoại!</span> ";
        status = false;
	}else if(phonePr.length < 9 ||phonePr.length > 13 ) {
		if(regExp.test(phonePr)){
			document.getElementById("checkPhonePr").innerHTML = 
	            " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
		}else{
		document.getElementById("checkPhonePr").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Số điện không đúng định dạng!</span> ";
        status = false;
		}
	}else{
		document.getElementById("checkPhonePr").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
	
	if(addressPr.length<1){
		document.getElementById("checkAddressPr").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Địa chỉ!</span> ";
        status = false;
	}else{
		document.getElementById("checkAddressPr").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
	
	if(statusPr.length<1){
		document.getElementById("checkStatusPr").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Trạng thái!</span> ";
        status = false;
	}else{
		document.getElementById("checkStatusPr").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
	
    return status;
}
</script>
<style type="text/css">
table tr {
	counter-increment: row-num-1;
}

table tr td:first-child::before {
	content: counter(row-num-1) " ";
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
						enctype="multipart/form-data" onsubmit="return validate()" name="myform">
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
																		class="form-control" id="InputLastnameSt" />
																	<div class="input-group-prepend">
																		<span Class="input-group-text">Tên</span>
																	</div>
																	<form:input type="text" path="fname"
																		class="form-control" id="InputFirstnameSt" />
																</div>
																
																<span id="checkNameSt"></span>
															</div>
															<div class="form-group">
																<label for="InputID">Image:</label> <input type="File"
																	class="form-control" name="files" id="InputImage">
																	
															</div>
															<div class="form-group">
																<label for="InputID">Email:</label>
																<form:input type="text" path="email"
																	class="form-control" id="InputEmailSt" />
																	<span id="checkEmailSt"></span>
															</div>

															<div class="form-group">
																<label for="InputID">Ngày sinh:</label>
																<form:input type="date" path="dob" class="form-control"
																	id="InputDobSt" min="1980-1-1" />
																	<span id="checkDobSt"></span>
															</div>
															<div class="form-group">
																<label for="InputID">Số Điện Thoại:</label>
																<form:input type="text" path="phone"
																	class="form-control" id="InputPhoneSt" />
																	<span id="checkPhoneSt"></span>
															</div>
															<div class="form-group">
																<label for="InputID">Địa chỉ:</label>
																<form:input path="address" class="form-control" id="InputAddressSt"/>
																<span id="checkAddressSt"></span>
															</div>

															<div class="form-group">
																<label for="InputID">Trạng Thái:</label>
																<form:input path="status" class="form-control" id="InputStatusSt"/>
																<span id="checkStatusSt"></span>
															</div>
															
															<div class="form-group">
																<label for="InputID">Lớp Học</label>
																<select name="classroomname" class="custom-select" id="sel1">
																	<c:if test="${not empty Listsl}">
																		<c:forEach var="sp" items="${Listsl}">
																			<option>${sp.name}</option>
																		</c:forEach>
																	</c:if>
																<select>
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
																	<input type="text" name="lnamee" class="form-control" id="InputLastnamePr"/>
																	<div class="input-group-prepend">
																		<span Class="input-group-text">Tên</span>
																	</div>
																	<input type="text" name="fnamee" class="form-control" id="InputFirstnamePr"/>
																</div>
																<span id="checkNamePr"></span>
															</div>

															<div class="form-group">
																<label for="InputID">Image:</label> <input type="File"
																	class="form-control" name="filess" id="InputImage">
															</div>

															<div Class="form-group">
																<label for="InputID">Email:</label>
																 <input
																	type="text" name="emaill" class="form-control"
																	id="InputEmailPr" />
																	<span id="checkEmailPr"></span>
															</div>

															<div class="form-group">
																<label for="InputID">Ngày sinh:</label> <input
																	type="date" name="dobb" class="form-control"
																	id="InputDobPr" min="1980-1-1" max="2020-12-31" />
																	<span id="checkDobPr"></span>
															</div>

															<div Class="form-group">
																<label>Số điện thoại:</label> <input type="text" name="phonee"
																	class="form-control" id="InputPhonePr"/>
																	<span id="checkPhonePr"></span>															</div>

															<div Class="form-group">
																<label>Địa chỉ:</label> <input type="text"
																	name="addresss" class="form-control" id="InputAddressPr"/>
																	<span id="checkAddressPr"></span>
															</div>

															<div Class="form-group">
																<label Class="input-group-addon">Tình trạng:</label>
																	<input type="text" name="statuss" class="form-control" id="InputStatusPr"/>
																	<span id="checkStatusPr"></span>
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
	<section class="content">
	<!--Table  -->
	<form:form action="/save" modelAttribute="student">
		<table id="table1" class="display">
			<colgroup>
				<col span="1" style="width: 1%;">
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
					<th>STT</th>
					<th>Mã</th>
					<th>Họ Tên</th>
					<th>Email</th>
					<th>Ngày sinh</th>
					<th>Số điện thoại</th>
					<th>Địa chỉ</th>
					<th>Trạng thái</th>
					<th>test EXport</th>
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
							<td class="input-id" style="text-align: center;"><input value=" ${list.id}" type="hidden"></td>
							<td class="input-id">${list.id}</td>
							<td class="table-name">${list.lname}&ensp;${list.fname}</td>
							<td >${list.email}</td>
							<td>${list.dob}</td>
							<td>${list.phone}</td>
							<td class="table-name">${list.address}</td>
							<td class="table-name">${list.status}</td>
							<td><a  href="<spring:url value='/exportPDF' />">Export to PDF</a>
							</td>
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


	</form:form>

</section>
</body>
</html>
