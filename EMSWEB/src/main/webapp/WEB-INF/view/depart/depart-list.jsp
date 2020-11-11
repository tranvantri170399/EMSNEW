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
		<a href="/new">Create New Product</a> <br /> <br />
		<table cellpadding="10" id="table1" class="display">
			<thead>
				<tr>
					<th>Mã phòng</th>
					<th>Tên Phòng</th>
					<th>views</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty listDepart}">
					<c:forEach var="list" items="${listDepart}">
						<tr>
							<td>${list.id}</td>
							<td>${list.name}</td>
							<td><a href="#">View</a></td>
							<td><a href="#">Edit</a></td>
							<td><a href="#">Delete</a></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	
	<form method="POST" action="/depart-save">
	<div class="linkadd">
    <button type="submit">Thêm GV</button>
    </div>
</form>
</body>
</html>
