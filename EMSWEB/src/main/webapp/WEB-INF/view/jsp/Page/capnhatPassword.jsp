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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style type="text/css">
body{
	background-color: #e1e1ef;
}
.row.form-info{
	margin-left: 15px;
    margin-top: 10px;
}
.info {
    margin-right: 5px;
    margin-left: 5px;
    border-radius: 3px ;
}
hr{
	margin-top:5px !important;
}
.title{
	margin-top: 10px;
	font-size: 1.2rem;
	font-weight: 500;
	color: #48465b;
}
.role{
	font-size: 13px;
	display: block;
	color: #74788d;
}
.get-info{
	
    padding-bottom: 0.5rem;
}
.info-student-ct{
	font-size: 20px;
	color: inherit;
	padding-left: 20px;
}
.info.col-sm-3{
	height: fit-content;
	
}
.info-student{
	margin-bottom: 20px;
	padding:10px;
}
.name-parents{
	font-size: 19px;
	font-weight: 500;
}
.info-form-label{
	padding-top: 4px;
    margin-bottom: 0;
    font-size: inherit;
    line-height: 1.5;
}
.form-control{
	font-size: 1rem;
	font-weight: 400;
	color: #495057;
	display: block;
	
}
.form-control[readonly]{
	background-color: white;
}
.save-edit{
	font-size: 1rem;
	font-weight: 400;
	color: #495057;
	display: block;
	width: 100%;
	background-color: #fff;
	border: 1px solid #ced4da;
    border-radius: .25rem;;
    padding: .375rem .75rem;
}
.save-edit:hover {
	font-size: 1rem;
	font-weight: 400;
	color: white;
	display: block;
	width: 100%;
	background-color: #0080FF;
	border: 1px solid #ced4da;
    border-radius: .25rem;;
    padding: .375rem .75rem;
}
</style>
</head>
<body>
<div class="row form-info">
    <div class="info col-sm-3" style="background-color:white;">
    <div class="title">
    Thông tin cá nhân
    </div>
    <hr>
    <div class="info-header row">
    <div class="col-xl-3"></div>
    <div class="col-lg-9 col-xl-8">
    <span class="hidden-xs">
      	<div class="name-parents"><c:forEach var="sp" items="${List}">${sp.fname} ${sp.lname}
		</c:forEach>
		</div>
		<a class="role"> Phụ huynh</a>
    </span>
    </div>
    </div>
    <div class="info-body">
    <span class="hidden-xs">
    <div class="get-info">
    	<a>Email:</a> 
    	<div>
    		<c:forEach var="sp" items="${List}">${sp.email}
			</c:forEach>
		</div>
	</div>
	<div class="get-info ">
		<a>Số điện thoại:</a> 
		<div>
			<c:forEach var="sp" items="${List}">${sp.phone}
			</c:forEach>
		</div>
	</div>
    </span>
    </div>
    </div>
    <div class="info col-sm-8" style="background-color:white;">
	<div class="title">
	Đổi mật khẩu
	</div>
	<hr>
	<div class="info-student">
	<div class="form-info row">
	<label class="col-xl-3 col-lg-3 info-form-label">Tên đăng nhập</label>
	<div class="col-lg-9 col-xl-6">
		<input type="text" value="${sp.username}" class="form-control" readonly>
	</div>
	</div>
	<div class="form-info row">
	<label class="col-xl-3 col-lg-3 info-form-label">Mật khẩu cũ</label>
	<div class="col-lg-9 col-xl-6">
		<input type="text" class="form-control">
	</div>
	</div>
	<div class="form-info row">
	<label class="col-xl-3 col-lg-3 info-form-label">Mật khẩu mới</label>
	<div class="col-lg-9 col-xl-6">
		<input type="text" class="form-control">
	</div>
	</div>
	<div class="form-info row">
	<label class="col-xl-3 col-lg-3 info-form-label">Nhập lại mật khẩu</label>
	<div class="col-lg-9 col-xl-6">
		<input type="text" class="form-control">
	</div>
	</div>
	<div class="form-info row">
	<label class="col-xl-3 col-lg-3 info-form-label"></label>
	<div class="col-lg-9 col-xl-6">
		<button type="submit" class="save-edit">Lưu thay đổi</button>
	</div>
	</div>
	
	
	</div>
	</div>
  </div>
	
</body>
</html>
