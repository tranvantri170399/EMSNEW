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
	<br />
	<h1>Add new Depart:</h1>
	<form:form action="saveDepart" method="POST" modelAttribute="adddepart">
      	MÃ GV: <form:input path="id" value="${adddepart.id}"/>
		<br />
		<br />
       	Tên Phòng: <form:input path="name" value="${adddepart.name}"/>
		<br />
		<br />
		<input type="submit" value="Submit" />
	</form:form>
</body>
</html>