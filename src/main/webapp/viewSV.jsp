<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="modelBEAN.SinhVien" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách sinh vieen</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
    <h1>Danh sách sinh vien</h1>
    <!-- Nút thêm sinh viên -->
        <button type="button" class="btn btn-primary mt-3" data-toggle="modal" data-target="#addStudentModal">
            Thêm Sinh viên
        </button>
    <%
        // Lấy danh sách các sinhvien từ request
        List<SinhVien> sinhviens = (List<SinhVien>) request.getAttribute("sinhviens");
    %>

    <% if (sinhviens != null && sinhviens.size() > 0) { %>
        <table class="table table-bordered mt-3">
            <thead>
                <tr>
                    <th>ID sinh vien</th>
                    <th>Họ và tên sinh viên</th>
                    <th>Email</th>
                </tr>
            </thead>
            <tbody>
                <% for (SinhVien sinhvien : sinhviens) { %>
                    <tr>
                        <td><%= sinhvien.getIDSV() %></td>
                        <td><%= sinhvien.getName() %></td>
                        <td><%= sinhvien.getEmail() %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    <% } else { %>
        <p>Không có sinh vien  nào tham gia khóa học này.</p>
    <% } %>
    <!-- Modal thêm sinh viên -->
        <div class="modal fade" id="addStudentModal" tabindex="-1" role="dialog" aria-labelledby="addStudentModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addStudentModalLabel">Thêm Sinh viên</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- Form thêm sinh viên vào đây -->
                        <form action="sinhvienController" method="post">
                            <!-- Các trường thông tin sinh viên -->

                            <div class="form-group">
                                <label for="studentEmail">Email</label>
                                <input type="email" class="form-control" id="studentEmail" name="studentEmail" required>
                            </div>

                            <!-- Nút lưu -->
                            <button type="submit" class="btn btn-primary">Them</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
