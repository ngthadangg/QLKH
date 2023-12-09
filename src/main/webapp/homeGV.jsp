<!-- Trang JSP cho home của giảng viên (/WEB-INF/views/teacher/home.jsp) -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Teacher Home</title>
</head>
<body>

<h2>Danh sách bài giảng</h2>

<c:forEach var="course" items="${courses}">
    <h3>${course.courseName}</h3>
    <ul>
        <c:forEach var="video" items="${course.videos}">
            <li>${video.videoName}</li>
        </c:forEach>
    </ul>
</c:forEach>

</body>
</html>
