<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.mycompany.myapp.board.BoardDAO, com.mycompany.myapp.board.BoardVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정 - 실전프로젝트 회원관리 V1</title>
</head>
<body>

<%-- 
<%
	BoardDAO boardDAO = new BoardDAO();
	String id=request.getParameter("id");	
	BoardVO u=boardDAO.getBoard(Integer.parseInt(id));
%> --%>

<h1>Edit Form</h1>
<form:form commandName="boardVO" method="POST" action="../editok">
	<form:hidden path="seq"/>
	<table id="edit">
		<tr><td>카테고리</td><td><form:input path="category" /></td></tr>
		<tr><td>제목</td><td><form:input path="title" /></td></tr>
		<tr><td>글쓴이</td><td><form:input path="writer" /></td></tr>
		<tr><td>내용</td><td><form:textarea cols="50" rows="5" path="content"/></td></tr>
	</table>
	<input type="submit" value="수정하기"/>	
	<input type="button" value="취소하기" onclick="history.back()"/>
</form:form>

</body>
</html>