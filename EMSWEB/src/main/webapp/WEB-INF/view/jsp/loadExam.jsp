<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html>
<head>
<meta charset="utf-8" />
<title>Product Manager</title>
</head>
<body>
	<div align="center">
		<h1>Amphi List</h1>
		<a href="/new">Create New Product</a> <br /> <br />
		<table border="1" cellpadding="10">
			<thead>
				<tr>
<!-- 					<th> ID</th> -->
					<th>Name</th>
					<th>day</th>
<!-- 					<th>endday</th> -->
					<th>tên bai</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty List}">
					<c:forEach var="sp" items="${List}">
						<tr>
<%-- 							<td>${sp.id}</td> --%>
							<td>${sp.name}</td>
							<td>${sp.startDate}</td>
<%-- 							<td>${sp.endDate}</td> --%>
							<td>${sp.course.id}</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
</body>
</html>