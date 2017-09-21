<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<style>
	
	* {
		font-family: sans-serif;
	}
	
	#container {
		width: 1000px;
		margin: 0px auto;
	}
	
	table {
	    font-family: arial, sans-serif;
	    border-collapse: collapse;
	    width: 100%;
	}
	
	td, th {
	    border: 1px solid #dddddd;
	    text-align: left;
	    padding: 8px;
	}
	 
	tr:nth-child(even) {
	    background-color: #dddddd;
	}
	</style>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Admin Dashboard</title>
</head>
	<body>
		<div id="container">
			<h1>Welcome ${currentUser.firstName}</h1>
			<table>
			  <tr>
			    <th>Name</th>
			    <th>Email</th>
			    <th>Action</th>
			  </tr>
			<c:forEach items="${users}" var="user" varStatus="loop">
			<tr>    
			    <td><c:out value="${user.firstName}"/></td>
			    <td><c:out value="${user.username}"/></td>				
				<c:choose>
				  <c:when test="${user.checkIfAdmin() == 'true'}">
				   	<td>Admin | <a href="/makeUser/${user.id}">Make User</a></td>
				  </c:when>
				  <c:otherwise>
				    <td><a href="/delete/${user.id}">Delete</a> | <a href="/makeAdmin/${user.id}">Make Admin</a></td>
				  </c:otherwise>
				</c:choose>
			</tr>
			</c:forEach>
			</table> 
			<br>
			    <form id="logoutForm" method="POST" action="/logout">
		    		    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		    	    		<input type="submit" value="Logout" />
			    </form>
		</div>
	</body>
</html>