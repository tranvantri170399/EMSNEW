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
</style>
</head>
<body>

	<table id="table1" class="display">

		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Desc</th>
				<th>Action</th>
			</tr>
		</thead>

		<tbody>
			<c:if test="${not empty List}">
				<c:forEach var="sp" items="${List}">
					<tr>
						<td>${sp.id}</td>
						<td>${sp.name}</td>
						<td></td>
						<td style="text-align:center;"><input type="button" value="update"><input type="button" value="del"></td>
					</tr>
				</c:forEach>
			</c:if>
					
		</tbody>


	</table>
	<div>
		<form:form action="/save" modelAttribute="depart">
				<div style="width: 500px; height: 100px; margin-left: 100px;">
					<div style="float: none;">id</div>
					<div style="float: left;">
						<form:input path="id"  cssStyle="width: 300px; height: 60px;" />
					</div>
				</div>
				<div style="width: 500px; height: 100px; margin-left: 100px;">
					<div style="float: none;">name:tritran</div>
					<div style="float: left;">
						<form:input path="name"  cssStyle="width: 300px; height: 60px;" />
					</div>
				</div>
				<br>
<%-- 				<div
					style="width: 500px; height: 60px; margin-bottom: 50px; margin-left: 100px;">
					<div style="float: none;">desc</div>
					<div style="float: left;">
						<form:input  path="desc"  cssStyle="width: 300px; height: 60px;" />
					</div>
				</div> --%>

				<div style="margin-left: 50px;">
					<input type="submit" name="btnsave" value="SAVE">
		
				</div>
			</form:form>
	</div>
</body>
</html>
