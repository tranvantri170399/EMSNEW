<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
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

<style type="text/css">
#InputLastname {
	border-color: red;
}


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
		<H1>Điểm Theo Kỳ</H1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Trang Chủ</a></li>
			<li class="active">Thống Kê </li>
			<li class="active">Điểm Theo Kỳ</li>
		</ol>
	</section>
	<section class="content">
	<div class="row">
	<div class="col-sm-6">
	<form action="/mark/followsemester" style="width: 60%;">
	<div class="row">
			
			<div class="form-group col-sm-12">
				
				<select name="namesemester" class="form-control" id="sel1">
					<c:if test="${not empty Lists}">
						<c:forEach var="sp" items="${Lists}">
							<option>${sp.name}</option>
						</c:forEach>
					</c:if>
				</select>		
			</div>
			
	</div>

	<input type="submit" value="Chọn"/>
</form>
</div>
	<div class="col-sm-6">
		<form action="/exportPDFs">		
			<div class="form-group col-sm-12">
				
				<select name="namesemester" class="form-control" id="sel1">
					<c:if test="${not empty Lists}">
						<c:forEach var="sp" items="${Lists}">
							<option>${sp.name}</option>
						</c:forEach>
					</c:if>
				</select>		
			</div>
		<input type="submit" style="float: right;margin-top: 39px" class="btn btn-danger"  value="PDF"/>
	</form>
	</div>
	</div>
<br/>
	<!--Table  -->
	<form:form action="/servlets" modelAttribute="attandence">
		<table id="table1" class="display" style="width: 100%">
			<colgroup>
				<col span="1" style="width: 3%;">
				<col span="1" style="width: 19.4%;">
				<col span="1" style="width: 19.4%;">
				<col span="1" style="width: 19.4%;">
				<col span="1" style="width: 19.4%;">
				<col span="1" style="width: 19.4%;">
				
			</colgroup>
			<thead style="background-color: #4876FF; color: white">

				<tr>
					<th>STT</th>
					<th>Học Kỳ</th>
					<th>Môn</th>
					<th>Mã Môn</th>
					<th>Điểm</th>
					<th>Trạng Thái</th>
				</tr>

			</thead>

			<tbody>
				<c:if test="${not empty List}">
					<c:forEach var="sp" items="${List}">
						<tr>
							<td><form:input path="id" value="${sp.id}" type="hidden" /></td>
							<td>${sp.exam.course.semester.name}</td>
							<td>${sp.exam.course.name}</td>
							<td>${sp.exam.course.id}</td>
							<td>${sp.mark}</td>
							<td> <c:if test="${sp.mark>=5}"><c:out value = "Đạt"/></c:if>
								 <c:if test="${sp.mark<5}"><c:out value = "Chưa Đạt"/></c:if>
							</td>
						</tr>

					</c:forEach>
				</c:if>

			</tbody>

		</table>
	</form:form>
<c:forEach var="sp" items="${List}">
	<c:set var="ageTotal" value="${ageTotal + sp.mark}" /> 
	<c:set var="aver" value="${aver + 1}" /> 
	<c:set var="ageTotals" value="${ageTotal / aver}" /> 
	
	<c:if test="${sp.mark>=5}"><c:set var="a" value="${a + 1}" /></c:if>
	<c:if test="${sp.mark<5}"><c:set var="b" value="${b + 1}" /></c:if>
</c:forEach>
<h4 style="color: blue;">Tổng số Môn: ${aver}</h4>
<h3 style="color: blue;">Điểm Trung Bình: <fmt:formatNumber type="number" maxFractionDigits="2" value="${ageTotals}" /></h3>
 <h3 style="color: blue;">Số Môn: ${a}/${aver} (Đạt/Tổng)</h3>
 </section>
</body>
</html>
