<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
table, th, td, tr {
	border: 1px solid black;
}

td {
	padding-right: 30px;
}
</style>
</head>
<body>
	<h1>List Customer:</h1>
	<a href="/user-save">Add Customer</a>
	<br />
	<br />
	<table>
		<tr>
			<th>username</th>
			<th>password</th>
			<th>role</th>
			<th>views</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		<tbody>
			<c:if test="${not empty listUser}">
				<c:forEach var="list" items="${listUser}">
					<tr>
						<td>${list.username}</td>
						<td>${list.password}</td>
						<td>${list.role}</td>
						<td><a href="/user-view/ + ${list.username}">View</a></td>
						<td><a href="/user-update/ + ${list.username}">Edit</a></td>
						<td><a href="/userDelete/ + ${list.username}">Delete</a></td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</body>

</html>