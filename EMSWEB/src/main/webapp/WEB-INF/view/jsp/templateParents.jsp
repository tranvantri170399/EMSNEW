<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>Education Management System-Parent</title>
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
			<a href="index2.html" class="logo"><b>EMS</b></a>
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
							class="dropdown-toggle" data-toggle="dropdown"> <svg
									width="25px" height="25px" viewBox="0 0 16 16"
									class="bi bi-person" fill="currentColor"
									style="float: left; margin-right: 10px;">
  			<path fill-rule="evenodd"
										d="M10 5a2 2 0 1 1-4 0 2 2 0 0 1 4 0zM8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6 5c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
		</svg> <span class="hidden-xs"> <c:forEach var="sp" items="${Listp}">
													${sp.fname}<%-- 
											<input name="nameuser" value="${sp.username}" type="hidden">
										<c:url var="infoLink" value="Page/INFO">
											<c:param name="nameuserxxx" value="${sp.username}" />
										</c:url>
										<c:url var="updatepassLink" value="Page/UPDATEPASS">
											<c:param name="nameuserxxx" value="${sp.username}" />
										</c:url>
										<c:url var="thoikhoabieu" value="parent/thoikhoabieu">
											<c:param name="userid" value="${sp.userid}" />
										</c:url> --%>
										<input name="nameuser" value="${sp.email}" type="hidden">
										<c:url var="infoLink" value="Page/INFO">
											<c:param name="nameuserxxx" value="${sp.email}" />
										</c:url>
										<c:url var="updatepassLink" value="Page/UPDATEPASS">
											<c:param name="nameuserxxx" value="${sp.email}" />
										</c:url>
										<c:url var="thoikhoabieu" value="parent/thoikhoabieu">
											<c:param name="userid" value="${sp.id}" />
										</c:url>
										<c:url var="diemdanh" value="parent/diemdanh">
											<c:param name="userid" value="${sp.id}" />
										</c:url>
										<c:url var="bangdiem" value="parent/bangdiem">
											<c:param name="userid" value="${sp.id}" />
										</c:url>
									</c:forEach>
							</span>
						</a> <c:forEach var="sp" items="${Listp}">
							<ul class="dropdown-menu">
								<!-- User image -->
								<li class="user-header"><img
									src="../../../../../resources/FileUpload/${sp.image}" class="img-circle"
									alt="User Image" />
									<c:forEach var="sp" items="${Listp}">
													<p style="text-transform: capitalize; font-family:Arial;">${sp.fname}</p>
													<p>${sp.email}</p>
									</c:forEach></li>
								<!-- Menu Body -->
								<!-- Menu Footer-->
								<li class="user-footer">
									<div class="pull-left">
										<form:form method="POST" modelAttribute="student">
											<button onclick="#'">Profile</button>
										</form:form>
									</div>
									<div class="pull-right">
										<form:form method="POST" modelAttribute="student">
											<button onclick="/logout'">Sign out</button>
										</form:form>
									</div>
								</li>
							</ul></c:forEach></li>
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
					<li class="active treeview"><a href="documentation/index.html">
							<i class="fa fa-dashboard"></i> <span>TRANG CỦA BẠN</span> 
					</a></li>
					<li class="treeview"><a href="#"> <i class="fa fa-user"></i>
							<span>Tài khoản</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="${infoLink}" target="frame"><i
									class="fa fa-circle-o"></i>Thông tin tài khoản</a></li>
							<li><a href="${updatepassLink}" target="frame"><i
									class="fa fa-circle-o"></i>Cập nhật mật khẩu</a></li>
						</ul></li>
					<!-- <li class="treeview"><a href="#"> <i
							class="fa fa-calendar"></i> <span>Thông tin sinh viên</span> <span
							class="label label-primary pull-right">4</span>
					</a>
						<ul class="treeview-menu">
							<li><a href="Page/THANHTICH" target="frame"><i
									class="fa fa-circle-o"></i>Thành tích học tập</a></li>
						</ul></li> -->
					<li>
					<li class="treeview"><a href="#"> <i
							class="fa fa-calendar"></i> <span>Học tập</span>
							<i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
<!-- 							<li><a href="Page/LICHHOC" target="frame">lich học</a></li> -->
							<li><a href="${thoikhoabieu}" target="frame">
							<i class="fa fa-circle-o"></i>Thời khóa biểu</a></li>
							<li><a href="${diemdanh}" target="frame"><i class="fa fa-circle-o"></i>Điểm danh</a></li>
							<!-- <li><a href="Page/HOCPHI" target="frame"><i
									class="fa fa-circle-o"></i>Kiểm tra học phí</a></li> -->
						</ul></li>
					<li class="treeview"><a href="#"> <i
							class="fa fa-pie-chart"></i> <span>Thống kê học tập</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<!-- <li><a href="Page/DIEMTHEOKY" target="frame"><i
									class="fa fa-circle-o"></i>Điểm theo kỳ</a></li>
							<li><a href="Page/MONDAHOC" target="frame"><i
									class="fa fa-circle-o"></i>Môn đã học</a></li> -->
							<li><a href="${bangdiem}" target="frame"><i
									class="fa fa-circle-o"></i>Bảng điểm</a></li>
						</ul>
					</li>

				</ul>
			</section>
			<!-- /.sidebar -->
		</aside>

		<!-- Right side column. Contains the navbar and content of the page -->
		<div class="content-wrapper" style="overflow: hidden;min-height: 660px;width:86%; ">
        <iframe src="" name="frame" style="width: 100%;min-height: 660px;overflow-y: scroll;padding-right: 20px;  " 
        ></iframe>                                                                               
        <!-- Content Header (Page header) -->

      </div><!-- /.content-wrapper -->

		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> Beta
			</div>
			<strong>Copyright &copy; 2020 <a href=""> 4TL Team</a>.
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
	<!-- SlimScroll 1.3.0 -->
	<script src="../../../resources/js/jquery.slimscroll.min.js"
		type="text/javascript"></script>

	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="../../../resources/js/dashboard2.js"
		type="text/javascript"></script>

	<!-- AdminLTE for demo purposes -->
	<script src="../../../resources/js/demo.js" type="text/javascript"></script>
</body>
</html>