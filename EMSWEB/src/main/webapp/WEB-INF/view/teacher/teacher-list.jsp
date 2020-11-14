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

<script>
	$(document).ready(function() {
		$('#table1').DataTable();
	});
</script>
<style type="text/css">
.linkadd{
left: 100px;
}
</style>
</head>
<body>
	<div align="center">
		<h1>List Teacher</h1>
		<table cellpadding="10" id="table1" class="display">
			<thead>
				<tr>
					<th>Mã GV</th>
					<th>Tên GV</th>
					<th>Chức vụ</th>
					<th>Phòng Ban</th>
					<th>Ảnh</th>
					<th>Mail</th>
					<th>Số điện thoại</th>
					<th>Địa chỉ</th>
					<th>Lương</th>
					<th>views</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty listTcher}">
					<c:forEach var="list" items="${listTcher}">
						<tr>
							<td>${list.id}</td>
							<td>${list.lname} &ensp;${list.fname}</td>
							<td>${list.role.roleName}</td>
							<td>${list.depart.name }
							<td>${list.email}</td>
							<td>${list.phone}</td>
							<td>${list.address}</td>
							<td>${list.salary}</td>
							<td>${list.email}</td>
							<td><a href="#">View</a></td>
							<td><a href="#">Edit</a></td>
							<td><a href="#">Delete</a></td>

						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	
	<form method="POST" action="/teacher-save">
	<div class="linkadd">
    <button type="submit">Thêm GV</button>
    </div>
</form>
</body>
</html>
