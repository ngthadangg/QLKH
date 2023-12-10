<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Teacher Home</title>
</head>
<body>

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