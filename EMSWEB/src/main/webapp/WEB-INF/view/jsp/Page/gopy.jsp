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
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.2 -->
    <link href="../../../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Morris chart -->
    <link href="../../../../resources/bootstrap/css/morris.css" rel="stylesheet" type="text/css" />
    <!-- jvectormap -->
    <link href="../../../../resources/bootstrap/css/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
    <!-- Daterange picker -->
    <link href="../../../../resources/bootstrap/css/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="../../../../resources/bootstrap/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="../../../../resources/bootstrap/css/_all-skins.min.css" rel="stylesheet" type="text/css" />

  </head>
<body >
	<section class="content-header">
        <h1>
            Góp Ý
        </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Trang Chủ</a></li>
            <li class="active">Thống Kê Học Tập</li>
            <li class="active">Góp Ý</li>            
          </ol>	
	</section>
	<section class="content">
	<form:form action="/save" modelAttribute="room">
		<table id="table1" class="display">

			<thead style="background-color:#4876FF ;color: white">
				<tr>
					<th>Học Kì</th>
					<th>Tên Môn Học</th>
					<th>Tên Giáo Viên</th>
					<th>Góp Ý</th>
				</tr>
			</thead>

			<tbody>
				<c:if test="${not empty List}">
					<c:forEach var="sp" items="${List}">

						<c:url var="updateLink" value="/updateStudyShifttoform">
							<c:param name="id" value="${sp.id}" />
						</c:url>
						<tr>
							<td class="gfgid">1</td>
							<td class="gfgtmh">Kiểm Thử Phần Mềm</td>
							<td class="gfgtgv">Trần Trí</td>
							<td ><button type="button" class="btn btn-info"
									onclick="location.href='${updateLink}';">Góp ý</button>
							</td>							
						</tr>

					</c:forEach>
				</c:if>

			</tbody>

		</table>


	</form:form>	
	</section>
    <script src="../../../../resources/js/jQuery-2.1.3.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="../../../../resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='../../../../resources/js/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="../../../../resources/js/app.min.js" type="text/javascript"></script>
    <!-- Sparkline -->
    <script src="../../../../resources/js/jquery.sparkline.min.js" type="text/javascript"></script>


    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="../../../../resources/js/dashboard2.js" type="text/javascript"></script>

    <!-- AdminLTE for demo purposes -->
    <script src="../../../../resources/js/demo.js" type="text/javascript"></script>       
</body>
</html>    