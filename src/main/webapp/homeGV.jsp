<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Teacher Home</title>
</head>
<body>

<h3>Thông tin kiểm tra</h3>
<p>Danh sách khóa học:</p>
<c:forEach var="course" items="${courses}">
    <p>ID khóa học: ${course.getCourse_id()}, Tên khóa học: ${course.getCourse_name()}</p>
</c:forEach>


<h2>Danh sách bài giảng</h2>

<table border="1">
    <thead>
        <tr>
            <th>ID Bài giảng</th>
            <th>Tên bài giảng</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="course" items="${courses}">
            <tr>
                <td>${course.getCourse_id()}</td>
                <td>${course.getCourse_name()}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>