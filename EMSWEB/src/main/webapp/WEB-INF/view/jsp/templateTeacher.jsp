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
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.2 -->
    <link href="../../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="../../../resources/bootstrap/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link href="../../../resources/bootstrap/css/_all-skins.min.css" rel="stylesheet" type="text/css" />
    
    
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
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
          </a>
          <!-- Navbar Right Menu -->
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <!-- Messages: style can be found in dropdown.less-->
              <!-- Notifications: style can be found in dropdown.less -->
              <!-- Tasks: style can be found in dropdown.less -->
              <!-- User Account: style can be found in dropdown.less -->
              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <c:forEach var="sp" items="${Listt}">
                  <img src="../../../../../resources/FileUpload/${sp.image}" class="user-image" alt="User Image"/>
                  </c:forEach>
                  <span class="hidden-xs">
                  	<c:forEach var="sp" items="${Listt}">${sp.fname}
						<c:url var="infoschedule" value="teacher/thoikhoabieu">
							<c:param name="teacherid" value="${sp.id}" />
						</c:url>
						<c:url var="infostudent" value="teacher/liststudent">
							<c:param name="teacherid" value="${sp.id}" />
						</c:url>		
						<c:url var="infoteacher" value="Page/INFOTeacher">
							<c:param name="teacherid" value="${sp.id}" />
						</c:url>	
						<!--  -->
						<c:url var="updatepass" value="Page/UpdatepassTeacher">
							<c:param name="teacherid" value="${sp.id}" />
						</c:url>	
						<c:url var="diemdanh" value="Page/diemdanh">
							<c:param name="teacherid" value="${sp.id}" />
						</c:url>
						<c:url var="bangdiem" value="Page/bangdiem">
							<c:param name="teacherid" value="${sp.id}" />
						</c:url>
					</c:forEach>
                  </span>
                </a>
                <c:forEach var="sp" items="${Listt}">
                <ul class="dropdown-menu">
                  <!-- User image -->
                  <li class="user-header">
                    <img src="../../../../../resources/FileUpload/${sp.image}" class="img-circle" alt="User Image" />
                    
													<p style="text-transform: capitalize; font-family:Arial;">${sp.fname}</p>
													<p>${sp.email}</p>
									
                  </li>
                  <!-- Menu Body -->
                  <!-- Menu Footer-->
                  <li class="user-footer">
									<div class="pull-left">
										<form:form>
										<a href="${infoteacher}">Profile</a>
										</form:form>
									</div>
									<div class="pull-right">
										<form:form method="POST" modelAttribute="student" >
										<button onclick="/logout'">Sign out</button>
										</form:form>
									</div>
								</li>
                </ul></c:forEach>
              </li>
            </ul>
          </div>
        </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <!-- search form -->
          <!-- /.search form -->
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
              <li class="header">MENU</li>
              <li class="active treeview">
              </li>
              <li class="treeview">
                  <a href="#">
                      <i class="fa fa-user"></i>
                      <span>Thông tin Tài khoản</span>
                      <i class="fa fa-angle-left pull-right"></i>
                  </a>
                  <ul class="treeview-menu">
                      <li><a href="${infoteacher}" target="frame"><i class="fa fa-circle-o"></i>Thông tin người dùng</a></li>
                      <li><a href="${updatepass}" target="frame"><i class="fa fa-circle-o"></i>Cập nhật mật khẩu</a></li>
                  </ul>
              </li>
              <li class="treeview">
                  <a href="#">
                      <i class="fa fa-calendar"></i>
                      <span>Thông tin giảng dạy</span>
                      <i class="fa fa-angle-left pull-right"></i>
                  </a>
                  <ul class="treeview-menu">
                      <li><a href="${infoschedule}" target="frame"><i class="fa fa-circle-o"></i>Thời khóa biểu</a></li>                    
                      <li><a href="${infostudent}" target="frame"><i class="fa fa-circle-o"></i>Danh sách lớp học</a></li>
                  </ul>
              </li>
              <li>
              <li class="treeview">
                  <a href="#">
                      <i class="fa fa-calendar"></i>
                      <span>Học tập</span>
                      <i class="fa fa-angle-left pull-right"></i>
                  </a>
                  <ul class="treeview-menu">
                      <!-- <li><a href="Page/diemdanh.html" target="frame"><i class="fa fa-circle-o"></i>Tài liệu học tập</a></li> -->
                     <!--  đánh dấu lại làm sao -->
                      <li><a href="${bangdiem}" target="frame"><i class="fa fa-circle-o"></i>Bảng điểm</a></li>
                      <li><a href="${diemdanh}" target="frame"><i class="fa fa-circle-o"></i>Điểm Danh</a></li>
                  </ul>
              </li>

          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>

      <!-- Right side column. Contains the navbar and content of the page -->
      <div class="content-wrapper" style="overflow: hidden;min-height: 660px;min-width:86%; ">
        <iframe src="" name="frame" style="min-width: 100%;min-height: 660px;overflow-y: scroll;padding-right: 20px;  " 
        ></iframe>                                                                               
        <!-- Content Header (Page header) -->

      </div><!-- /.content-wrapper -->

      <footer class="main-footer">
        <div class="pull-right hidden-xs">
          <b>Version</b> Beta
        </div>
        <strong>Copyright &copy; 2020<a href=""> 4TL Team</a>.</strong> All rights reserved.
      </footer>

    </div><!-- ./wrapper -->

    <!-- jQuery 2.1.3 -->
    <script src="../../../resources/js/jQuery-2.1.3.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="../../../resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='../../../resources/js/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="../../../resources/js/app.min.js" type="text/javascript"></script>
    <!-- Sparkline -->
    <script src="../../../resources/js/jquery.sparkline.min.js" type="text/javascript"></script>  
    <!-- iCheck -->
    <script src="../../../resources/js/icheck.min.js" type="text/javascript"></script>
    <!-- SlimScroll 1.3.0 -->
    <script src="../../../resources/js/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- ChartJS 1.0.1 -->
    <script src="../../../resources/js/Chart.min.js" type="text/javascript"></script>

    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="../../../resources/js/dashboard2.js" type="text/javascript"></script>

    <!-- AdminLTE for demo purposes -->
    <script src="../../../resources/js/demo.js" type="text/javascript"></script>
  </body>
</html>