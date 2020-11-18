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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h1>Employee Management System</h1>
		<hr>
		<h2>Update Employee</h2>

		<form:form action="/saveTeacher" modelAttribute="teacher"
			method="POST">

			<!-- Thêm trường biểu mẫu ẩn để xử lý cập nhật -->
			<form:input type="hidden" path="id" value="${teacher.id}" />

			<form:input type="text" path="depart.name"
				value="${teacher.depart.name}" placeholder="Employee First Name"
				class="form-control mb-4 col-4" />

			<form:input type="text" path="role.roleName"
				value="${teacher.role.roleName}"
				placeholder="Employee First Name" class="form-control mb-4 col-4" />

			<form:input type="text" path="fname"
				placeholder="Employee First Name" class="form-control mb-4 col-4" />

			<form:input type="text" path="lname"
				placeholder="Employee last Name" class="form-control mb-4 col-4" />

			<form:input type="text" path="role" value="${teacher.image}"
				placeholder="Employee First Name" class="form-control mb-4 col-4" />

			<form:input type="text" path="email" value="${teacher.email}"
				placeholder="Employee First Name" class="form-control mb-4 col-4" />

			<%-- <form:input type="text" path="dob" value="${teacher.dob}"
				placeholder="Employee First Name" class="form-control mb-4 col-4" /> --%>

			<form:input type="text" path="phone" value="${teacher.phone}"
				placeholder="Employee First Name" class="form-control mb-4 col-4" />

			<form:input type="text" path="address" value="${teacher.address}"
				placeholder="Employee First Name" class="form-control mb-4 col-4" />

			<form:input type="text" path="status" value="${teacher.status}"
				placeholder="Employee First Name" class="form-control mb-4 col-4" />

			<form:input type="text" path="level" value="${teacher.level}"
				placeholder="Employee First Name" class="form-control mb-4 col-4" />

		<%-- 	<form:input type="text" path="salary" value="${teacher.salary}"
				placeholder="Employee First Name" class="form-control mb-4 col-4" /> --%>
				
				<button type="submit" class="btn btn-info col-2"> Update Employee</button>
		</form:form>

		<hr>

		<a href="@{/}"> Back to Employee List</a>
	</div>
</body>
</html>