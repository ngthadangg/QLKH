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

    <!-- CSS FILES -->
    <link rel="preconnect" href="https://fonts.googleapis.com">

    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=League+Spartan:wght@100;300;400;600;700&display=swap"
          rel="stylesheet">

    <link href="css/bootstrap.min.css" rel="stylesheet">

    <link href="css/bootstrap-icons.css" rel="stylesheet">

    <link href="css/owl.carousel.min.css" rel="stylesheet">

    <link href="css/owl.theme.default.min.css" rel="stylesheet">

    <link href="css/tooplate-gotto-job.css" rel="stylesheet">

    <style>
        @import url('https://fonts.googleapis.com/css?family=Ubuntu:700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Ubuntu', sans-serif;
            text-decoration: none;
        }

        .form {
            background-color: #dec1eb;
            width: 800px;
            height: 600px;
            margin: 50px auto;
            margin-top: inherit;
            padding: 45px 65px;
            background: linear-gradient(to right, #8300cd, #b800c4);
        }
        .container_form{
            background-color: #dec1eb;

        }
        .form__box {
            width: 100%;
            height: 100%;

            justify-content: space-around;
            align-items: center;
            background: #fff;
            border-radius: 40px;

        }

        .form_on {
            height: 100px;
        }

        .form__title_login {
            line-height: 100px;
            font-size: 60px;
            font-weight: bold;
            text-align: center;
        }

        .form__left {
            display: flex;
            align-items: center;
            width: 50%;

        }

        .form__padding {
            width: 300px;
            height: 300px;
            background: #f2f2f2;
            border-radius: 50%;
            margin: 0 auto;
            line-height: 210px;
            position: relative;
        }

        .form__image {
            max-width: 100%;
            width: 60%;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%)
        }

        .form__right {
            display: flex;
            align-items: center;
            line-height: 26px;
            width: 50%;
            justify-content: center;
        }

        .form__padding-right {
            width: 85%;
        }

        .form__title {
            font-size: 18px;
            font-weight: bold;

            text-align: center;
            margin-bottom: 30px;
        }

        .form_login {
            height: 350px;
            display: flex;
        }

        .form__submit-btn {
            background: #1fcc44;
            cursor: pointer;
        }

        .form__submit-btn:hover {
            background-color: #ff3f70;
        }

        .form__email {
            position: relative;
        }

        input {
            display: block;
            width: 100%;
            margin-bottom: 25px;
            height: 50px;
            border-radius: 20px;
            border: none;
            background: #f2f2f2;
            padding: 10px;
            font-size: 14px;
            position: relative;
        }
        select{
            display: block;
            width: 100%;
            margin-bottom: 25px;
            height: 50px;
            border-radius: 20px;
            border: none;
            background: #f2f2f2;
            padding: 10px;
            font-size: 14px;
            position: relative;
        }
    </style>
</head>
<body style="background-color: #f8f9fa;">
    <nav class="navbar navbar-expand-lg" style="background-color: #dec1eb;">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center" href="index.html">
                <img src="images/logo.png" class="img-fluid logo-image">

                <div class="d-flex flex-column">
                    <strong class="logo-text">Learn</strong>
                    <small class="logo-slogan">Elearning Course</small>
                </div>
            </a>
        </div>
    </nav>
    <div class="container_form">
        <div class="form">
            <div class="form__box">
                <div class="form_on">
                    <h1 class="form__title_login">Login</h1>
                </div>
                <div class="form_login">
                    <div class="form__left">
                        <div class="form__padding">
                            <img class="form__image"
                                 src=" https://i.pinimg.com/originals/8b/44/51/8b4451665d6b2139e29f29b51ffb1829.png" alt="">
                        </div>
                    </div>
                    <div class="form__right">
                        <div class="form__padding-right">
                            <form action="<%= request.getContextPath() %>/loginServlet" method="post">
                                <input class="form__email" type="email" name="email" id="" placeholder="Email">
                                <input class="form__password" type="password" name="password" placeholder="******">

                                <select name="role" class="">
                                    <option value="sinhvien">SinhVien</option>
                                    <option value="giangvien">GiangVien</option>
                                    <option value="admin">Admin</option>
                                </select><br>
                                <input class="form__submit-btn" type="submit" value="Login">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>
