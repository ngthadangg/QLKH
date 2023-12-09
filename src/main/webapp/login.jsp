<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #f8f9fa;">

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">

                <div style="border: 2px solid #17a2b8; padding: 20px; border-radius: 10px; background-color: #ffffff;">

                    <form action="<%= request.getContextPath() %>/loginServlet" method="post">
                            <h2 class="text-center mb-4">Đăng Nhập</h2>

                            Email: <input type="email" name="email" class="form-control" required><br>
                            Password: <input type="password" name="password" class="form-control" required><br>
                            Role:
                            <select name="role" class="form-control">
                                <option value="sinhvien">SinhVien</option>
                                <option value="giangvien">GiangVien</option>
                                <option value="admin">Admin</option>
                            </select><br>
                            <input type="submit" value="Login" class="btn btn-primary btn-block">
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
