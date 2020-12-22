<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EMS | Danh sách nhân vien</title>

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
<link	href="../../../../../resources/bootstrap/css/daterangepicker-bs3.css"
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
function validate() {
    var lastname = document.myform.InputLastname.value;
    var firstname = document.myform.InputFirstname.value;
    var emailNv = document.myform.InputEmail.value;
    var dobNv = document.myform.InputDob.value;
    var phoneNv = document.myform.InputPhone.value;
    var addressNv = document.myform.InputAddress.value;
    var statusNv = document.myform.InputStatus.value;
    var levelNv = document.myform.InputLevel.value;
    var salaryNv = document.myform.InputSalary.value;
    
    var atposition = emailNv.indexOf("@");
    var dotposition = emailNv.lastIndexOf(".");
    var regExp = /^(0[234][0-9]{8}|1[89]00[0-9]{4})$/;

    
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
    
    if(emailNv.length < 1){
    	document.getElementById("checkEmail").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Email!</span> ";
        status = false;
	}else if(atposition < 1 || dotposition < (atposition + 2)
            || (dotposition + 2) >= emailNv.length){
		document.getElementById("checkEmail").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Email không đúng định dạng!</span> ";
        status = false;
	}
	else{
		document.getElementById("checkEmail").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}

    if(dobNv.length < 1){
		document.getElementById("checkDob").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Ngày sinh!</span> ";
        status = false;
	}else{
		document.getElementById("checkDob").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
    
    if(phoneNv.length < 1){
		document.getElementById("checkPhone").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Số điện thoại!</span> ";
        status = false;
	}else if(phoneNv.length < 9 ||phoneNv.length > 13 ) {
		if(regExp.test(phoneNv)){
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
    
    if(addressNv.length<1){
		document.getElementById("checkAddress").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Địa chỉ!</span> ";
        status = false;
	}else{
		document.getElementById("checkAddress").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
    
    if(statusNv.length<1){
		document.getElementById("checkStatus").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Trạng thái!</span> ";
        status = false;
	}else{
		document.getElementById("checkStatus").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
    
    if(levelNv.length<1){
		document.getElementById("checkLevel").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Cấp độ!</span> ";
        status = false;
	}else if(!levelNv.match(/^\d+/)){
		document.getElementById("checkLevel").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Cấp độ chỉ được nhập số!</span> ";
        status = false;
	}else{
		document.getElementById("checkLevel").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
    if(salaryNv.length<1){
		document.getElementById("checkSalary").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Lương!</span> ";
        status = false;
	}else if(!salaryNv.match(/^\d+/)){
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
<script>
	$(document).ready(function() {
		$('#table1').DataTable();
	});
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
			Danh Sách Nhân Viên
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#myModal">Thêm nhân viên</button>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Trang Chủ</a></li>
			<li class="active">Quản Lí Nhân Viên</li>
			<li class="active">Danh Sách CNVC</li>
		</ol>
	</section>
	<!--Modalthemnhanvien-->
	<div class="modal" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<form:form action="/save/staff" modelAttribute="staff" enctype="multipart/form-data"  onsubmit="return validate()" name="myform">
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
    								<input type="file" class="custom-file-input" id="inputGroupFile01" id="InputImage">
    								<label class="custom-file-label" for="inputGroupFile01">Choose file</label>
							  	</div>
							</div>
							<div class="form-group">
								<label for="InputID">Email:</label>
								<form:input type="text" path="email" class="form-control" id="InputEmail" />
								<span id="checkEmail"></span>
							</div>
							
							<div class="form-group">
								<label for="InputID">Ngày sinh</label>
								<form:input type="date" path="dob" class="form-control"
									id="InputDob" min="1980-1-1" max="2020-12-31"/>
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
								<form:select path="depart" class="custom-select"
									idxmlns="sel1">
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
								<form:select path="role" class="custom-select"
									idxmlns="sel1">
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
	<section class="content">
	<!--Table  -->
	<form:form action="/save" modelAttribute="staff">
		<table id="table1" class="display table-bordered" style="width: 100%">
    	<colgroup>
       		<col span="1" style="width: 4%;">
       		<col span="1" style="width: 10%;">
       		<col span="1" style="width: 10%;">
       		<col span="1" style="width: 18%;">
       		<col span="1" style="width: 10%;">
       		<col span="1" style="width: 6%;">
       		<col span="1" style="width: 11%;">
       		<col span="1" style="width: 9%;">
       		<col span="1" style="width: 8%;">
       		<col span="1" style="width: 14%;">       		       		       		
    	</colgroup>
			<thead style="background-color:#4876FF ;color: white">
				<tr>
					<th>STT</th>
					<th>Mã</th>
					<th>Họ Tên</th>
					<th>Ngày sinh</th>	
					<th>Địa chỉ</th>									
					<th>Email</th>	
					<th>SĐT</th>									
					<th>Phòng Ban</th>
					<th>Chức Vụ</th>
				<!-- <th>Image</th> -->
				<!-- <th>Status</th> -->
					<th>Cấp độ</th>
					<th></th>
				</tr>
			</thead>

			<tbody>
				<c:if test="${not empty List}">
					<c:forEach var="sp" items="${List}">

						<c:url var="updateLink" value="/updatestaff">
							<c:param name="fname" value="${sp.fname}" />
						</c:url>

						<!-- construct an "delete" link with customer id -->
						<c:url var="deleteLink" value="/deleteTeacher">
							<c:param name="fname" value="${sp.fname}" />
						</c:url>

						
						<tr style="color: black;">
							<td class="input-id" style="text-align: center;"><input  value=" ${sp.id}" type="hidden"></td>
							<td class="gfgusername"><input class="input-id" name="idstaff"
								value=" ${sp.id}"></td>
							<td class="table-name">${sp.fname}&ensp;${sp.lname}</td>
							<%-- <td class="gfgscores">${sp.lname}</td> --%>
							<td >${sp.dob}</td>
							<td class="table-name">${sp.address}</td>	
							<td>${sp.email}</td>	
							<td>${sp.phone}</td>																			
							<td class="table-name">${sp.depart.name}</td>
							<td class="table-name">${sp.role.roleName}</td>
						<%-- <td>${sp.image}</td> --%>
						<%-- <td>${sp.status}</td> --%>
						<td>${sp.level}</td>
							<td >
								<!-- <input  type="button" data-toggle="modal" data-target="#myModal" value="update"> -->
							<div class="btn-group" role="group" aria-label="Basic example">
								<button type="button" class="btn btn-info"
									onclick="location.href='${updateLink}';">Cập nhật</button>
								<button type="button" class="btn btn-danger"
									onclick="location.href='${deleteLink}';">Xóa</button>
							</div>
								<!-- <input type="submit" value="Update">  --> <!-- <input
								class="gfgselect" data-toggle="modal" data-target="#gfgmodal"
								type="button" value="del"> -->

							</td>
						</tr>

					</c:forEach>
				</c:if>

			</tbody>

		</table>


	</form:form>

</section>

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
