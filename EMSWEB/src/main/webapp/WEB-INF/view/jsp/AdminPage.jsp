<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Education Management System</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- Bootstrap 3.3.2 -->
<link href="../../../resources/bootstrap/css/bootstrap.min.css"
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
<link href="../../../resources/bootstrap/css/morris.css"
	rel="stylesheet" type="text/css" />
<!-- jvectormap -->
<link
	href="../../../resources/bootstrap/css/jquery-jvectormap-1.2.2.css"
	rel="stylesheet" type="text/css" />
<!-- Daterange picker -->
<link href="../../../resources/bootstrap/css/daterangepicker-bs3.css"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="../../../resources/bootstrap/css/AdminLTE.min.css"
	rel="stylesheet" type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
<link href="../../../resources/bootstrap/css/_all-skins.min.css"
	rel="stylesheet" type="text/css" />
	
<script type="text/javascript"
	src="../../../resources/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript" src="../../../resources/js/script.js"></script>


<link href="../../../resources/css/style.css" rel="stylesheet"
	type="text/css" />	
</head>
<body class="skin-blue">
	<div class="loader">
		<i class="fa fa-spinner xoay icon" aria-hidden="true"></i>
	</div>
	<div class="wrapper">

		<header class="main-header">
			<!-- Logo -->
			<a href="#" class="logo"><b>EMS</b></a>
			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> <span class="sr-only">Toggle navigation</span>
				</a>
				<!-- Navbar Right Menu -->
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- Messages: style can be found in dropdown.less-->
						<!-- Notifications: style can be found in dropdown.less -->
						<!-- Tasks: style can be found in dropdown.less -->
						<!-- User Account: style can be found in dropdown.less -->
						<li class="dropdown user user-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown">
							<c:forEach var="s" items="${Lists}"> 
							<img src="../../../../../resources/FileUpload/${s.image}" class="user-image" alt="User Image"/>
								</c:forEach>
								<c:forEach var="sp"
									items="${List}">
									<span class="hidden-xs">${sp.username}</span>
								</c:forEach>

						</a>
						<c:forEach var="s" items="${Lists}">
							<ul class="dropdown-menu">
								<!-- User image -->
								<li class="user-header"><img
									src="../../../../../resources/FileUpload/${s.image}" class="img-circle"
									alt="User Image" />
									
													<p style="text-transform: capitalize; font-family:Arial;">${s.fname} ${s.lname}</p>
													<p>${s.email}</p>
									</li>
								<!-- Menu Body -->
								<!-- Menu Footer-->
								<li class="user-footer">
									<div class="pull-left">
										<form:form method="POST" modelAttribute="student" >
										<button onclick="#'">Profile</button>
										</form:form>
									</div>
									<div class="pull-right">
										<form:form method="POST" modelAttribute="student" >
										<button onclick="/logout">Sign out</button>
										</form:form>
									</div>
								</li>
							</ul>
							</c:forEach></li>
					</ul>
				</div>
			</nav>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<!-- Sidebar user panel -->
				<!-- sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu">
					<li class="header">MENU</li>
					<li class="treeview"><a href="#"> <i
							class="fa fa-calendar"></i> <span>Quản Lí Nhân Viên</span> <i
							class="fa fa-angle-right pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="/DSgiaovien" target="frame"><i
									class="fa fa-circle-o"></i>Danh Sách Giáo Viên</a></li>
							<li><a href="/DSnhanvien" target="frame"><i
									class="fa fa-circle-o"></i>Danh Sách CNVC</a></li>
							<li><a href="/DSphongban" target="frame"><i
									class="fa fa-circle-o"></i>Danh Sách Phòng Ban</a></li>
						</ul></li>
					<li>
					<li class="treeview"><a href="#"> <i
							class="fa fa-calendar"></i> <span>Quản Lí Sinh Viên</span> <i
							class="fa fa-angle-right pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="/DShocsinh" target="frame"><i
									class="fa fa-circle-o"></i>Danh Sách Sinh Viên</a></li>
							<li><a href="/DSlophoc" target="frame"><i
									class="fa fa-circle-o"></i>Danh Sách Lớp</a></li>
							<li><a href="/DSmonhoc" target="frame"><i
									class="fa fa-circle-o"></i>Danh Sách Môn</a></li>
							<li><a href="/DSnganh" target="frame"><i
									class="fa fa-circle-o"></i>Danh Sách Chuyên Ngành</a></li>
							<li><a href="/DShocki" target="frame"><i
									class="fa fa-circle-o"></i>Danh Sách học kì</a></li>
							<li><a href="/QLMhocky" target="frame"><i
									class="fa fa-circle-o"></i>Quản lý môn học từng kì</a></li>
						</ul></li>
						<li class="treeview"><a href="#"> <i
							class="fa fa-calendar"></i> <span>Quản Lí Lịch Học</span> <i
							class="fa fa-angle-right pull-right"></i>
					</a>
						<ul class="treeview-menu">
						<li><a href="/DSKhoahocchitiet" target="frame"><i
									class="fa fa-circle-o"></i>Chi Tiết Môn Học</a></li>
							<li><a href="/DScahoc" target="frame"><i
									class="fa fa-circle-o"></i>Danh Sách Ca Học</a></li>
							<li><a href="/DSlichhoc" target="frame"><i
									class="fa fa-circle-o"></i>Danh Sách Lịch Học</a></li>
							
						</ul></li>
					<li class="treeview"><a href="#"> <i
							class="fa fa-calendar"></i> <span>Quản Lí CSVC</span> <i
							class="fa fa-angle-right pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="/DSphonghoc" target="frame"><i
									class="fa fa-circle-o"></i>Danh Sách Phòng Học</a></li>
									<li><a href="/DSthietbi" target="frame"><i
									class="fa fa-circle-o"></i>Danh Sách Thiết Bị</a></li>
							<li><a href="/DSthietbiphonghoc" target="frame"><i
									class="fa fa-circle-o"></i>Danh Sách Thiết Bị Từng Phòng</a></li>
						</ul></li>

				</ul>
			</section>
			<!-- /.sidebar -->
		</aside>

		<!-- Right side column. Contains the navbar and content of the page -->
		<div class="content-wrapper"
			style="overflow: hidden; min-height: 660px; min-width: 86%;">
			<iframe src="/DSnhanvien" name="frame"
				style="width: 100%; min-height: 660px; overflow-y: scroll; overflow-x: scroll; padding-right: 20px;"></iframe>
			<!-- Content Header (Page header) -->

		</div>
		<!-- /.content-wrapper -->

		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> Beta
			</div>
			<strong>Copyright &copy; 2020 <a
				href="">4TL Team</a>.
			</strong> All rights reserved.
		</footer>

	</div>
	<!-- ./wrapper -->

	<!-- jQuery 2.1.3 -->
	<script src="../../../resources/js/jQuery-2.1.3.min.js"></script>
	<!-- Bootstrap 3.3.2 JS -->
	<script src="../../../resources/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<!-- FastClick -->
	<script src='../../../resources/js/fastclick.min.js'></script>
	<!-- AdminLTE App -->
	<script src="../../../resources/js/app.min.js" type="text/javascript"></script>
	<!-- Sparkline -->
	<script src="../../../resources/js/jquery.sparkline.min.js"
		type="text/javascript"></script>
	<!-- iCheck -->
	<script src="../../../resources/js/icheck.min.js"
		type="text/javascript"></script>
	<!-- SlimScroll 1.3.0 -->
	<script src="../../../resources/js/jquery.slimscroll.min.js"
		type="text/javascript"></script>

	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="../../../resources/js/dashboard2.js"
		type="text/javascript"></script>

	<!-- AdminLTE for demo purposes -->
	<script src="../../../resources/js/demo.js" type="text/javascript"></script>
	
	
	
<script>
function myFunction() {
  confirm("Press a button!");
}
</script>
</body>
</html>