<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EMS | Quản Lí Thiết Bị</title>

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
<!-- Theme style -->
<link href="../../../../../resources/bootstrap/css/AdminLTE.min.css"
	rel="stylesheet" type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the cs/skins 
         folder instead of downloading all of them to reduce the load. -->
<link href="../../../../../resources/bootstrap/css/_all-skins.min.css"
	rel="stylesheet" type="text/css" />

<script type="text/javascript">
function validate(){
	var name = document.myform.InputName.value;
	var number = document.myform.InputNumber.value;
	var statusCk = document.myform.InputStatus.value;
	var price = document.myform.InputPrice.value;
	
	
	var status = false;
	
	if(name.length < 1){
		document.getElementById("checkName").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Tên thiết bị!</span> ";
        status = false;
	}else{
		document.getElementById("checkName").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
            status = true;
	}
	
	if(number.length < 1 || number == "0"){
		document.getElementById("checkNumber").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Số lượng!</span> ";
        status = false;
	}else if(!number.match(/^\d+/)){
		document.getElementById("checkNumber").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Số lượng chỉ nhập bằng số!</span> ";
        status = false;
	}else{
		document.getElementById("checkNumber").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
	
	if(statusCk.length < 1){
		document.getElementById("checkStatus").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Tình trạng!</span> ";
        status = false;
	}else{
		document.getElementById("checkStatus").innerHTML = 
            " <span class='fa fa-check-square' style='color:#3FFF00;'></span>";
	}
	
	if(price.length < 1){
		document.getElementById("checkPrice").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Giá thành!</span> ";
        status = false;
	}else if(!price.match(/^\d+/)){
		document.getElementById("checkPrice").innerHTML = 
            " <span class='fas fa-window-close' style='color:red;'>Giá thành chỉ nhập bằng số!</span> ";
        status = false;
	}else{
		document.getElementById("checkPrice").innerHTML = 
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

}
</style>
</head>
<body>
	<section class="content-header">
		<h1>
			Danh Sách Thiết Bị
			<button type="button" class="btn btn-info" data-toggle="modal"
				data-target="#myModal">Thêm Thiết Bị</button>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Trang Chủ</a></li>
			<li class="active">Quản Lí CSVC</li>
			<li class="active">Quản Lí Thiết Bị</li>
		</ol>
	</section>
	<!--Modalthemnhanvien-->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<form:form action="/save/device" modelAttribute="room" onsubmit="return validate()" name="myform">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Thêm Thiết Bị</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<div>

							<div class="form-group">
								<form:input type="hidden" path="id" />
							</div>
							<div Class="form-group">
								<label for="InputName">Thiết bị:</label>
								<div Class="input-group">
									<div class="input-group-prepend">
										<span Class="input-group-text">Tên</span>
									</div>
									<form:input type="text" path="deviceName" class="form-control"
										id="InputName" />
										
									<div class="input-group-prepend">
										<span Class="input-group-text">Số lượng</span>
									</div>
									<form:input type="text" path="amount" class="form-control"
										id="InputNumber" />
								</div>
								<div class="row">
								<span id="checkName" class="col-sm-5" style=" padding-right: 0px !important;"></span>
								<span id="checkNumber" class="col-sm-7" style=" padding-left: 25px;"></span>
								</div>

							</div>

							<div class="form-group">
								<label for="InputID">Tình Trạng:</label>
								<form:input type="text" path="status" class="form-control"
									id="InputStatus" />
									<span id="checkStatus"></span>
							</div>
							<div class="form-group">
								<label for="InputID">Giá Thành:</label>
								<div class="input-group">
									<form:input type="text" path="price" class="form-control"
										id="InputPrice" />
									<div class="input-group-prepend">
										<span Class="input-group-text">VNĐ</span>
									</div>
								</div>
								<span id="checkPrice"></span>
							</div>

						</div>
					</div>
					<div class="modal-footer">
						<input type="submit" name="btnsave" class="btn btn-info"
							value="Lưu">
						<button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
					</div>

				</div>
			</form:form>
		</div>
	</div>
	<section class="content">
	<!--Table  -->
	<form:form action="/save" modelAttribute="room">
		<table id="table1" class="display">

			<thead style="background-color:#4876FF ;color: white">
				<tr>
					<th>ID</th>
					<th>Tên Thiết Bị</th>
					<th>Số lượng</th>
					<th>Tình Trạng</th>
					<th>Giá Thành(VNĐ)</th>
					<th>Action</th>
				</tr>
			</thead>

			<tbody>
				<c:if test="${not empty List}">
					<c:forEach var="sp" items="${List}">

						<c:url var="updateLink" value="/updateDevice">
							<c:param name="id" value="${sp.id}" />
						</c:url>

						<!-- construct an "delete" link with customer id -->
						<c:url var="deleteLink" value="/deleteDevice">
							<c:param name="id" value="${sp.id}" />
						</c:url>


						<tr style="color: red;">
							<td class="gfgusername">>${sp.id}</td>
							<td class="gfgpp">${sp.deviceName}</td>
							<td class="gfgscores">${sp.amount}</td>
							<td class="gfgarticles">${sp.status}</td>
							<td class="gfgarticles">${sp.price}</td>
							<td>
								<div class="btn-group" role="group" aria-label="Basic example">
									<button type="button" class="btn btn-info"
										onclick="location.href='${updateLink}';">Cập nhật</button>
									<button type="button" class="btn btn-danger"
										onclick="location.href='${deleteLink}'; ">Xóa</button>
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
