<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<a href="/user-list">List Customer</a>
	<br />
	<h1>Add new User:</h1>
	<form:form action="saveTeacher" method="POST" modelAttribute="addteacher">
      	MÃ GV: <form:input path="id" value="${addteacher.id}"/>
		<br />
		<br />
       	Tên Phòng: <form:input path="depart.name" value="${addteacher.depart.name}"/>
		<br />
		<br />
       	Chức vụ: <form:input path="role.roleName" value="${addteacher.role.roleName}"/>
		<br />
		<br />
			Tên: <form:input path="fname" value="${addteacher.fname}"/>
		<br />
		<br />
       	Họ: <form:input path="lname" value="${addteacher.lname}"/>
		<br />
		<br />
       	role: <form:input path="role" value="${addteacher.image}"/>
		<br />
		<br />
			Mail: <form:input path="email" value="${addteacher.email}"/>
		<br />
		<br />
       	Ngày: <form:input path="dob" value="${addteacher.dob}"/>
		<br />
		<br />
       	Số ĐT: <form:input path="phone" value="${addteacher.phone}"/>
		<br />
		<br />
			Địa chỉ: <form:input path="address" value="${addteacher.address}"/>
		<br />
		<br />
			Chú thích: <form:input path="status" value="${addteacher.status}"/>
		<br />
		<br />
			cấp bậc: <form:input path="level" value="${addteacher.level}"/>
		<br />
		<br />
			Lương: <form:input path="salary" value="${addteacher.salary}"/>
		<br />
		<br />
		<input type="submit" value="Submit" />
	</form:form>
</body>
</html>