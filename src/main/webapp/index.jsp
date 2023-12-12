<%@ page import="modelBEAN.Video" %>
<%@ page import="java.util.List" %>
<%@ page import="modelBEAN.Course" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang chủ</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- CSS FILES -->
    <link rel="preconnect" href="https://fonts.googleapis.com">

    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=League+Spartan:wght@100;300;400;600;700&display=swap" rel="stylesheet">

    <link href="css/bootstrap.min.css" rel="stylesheet">

    <link href="css/bootstrap-icons.css" rel="stylesheet">

    <link href="css/owl.carousel.min.css" rel="stylesheet">

    <link href="css/owl.theme.default.min.css" rel="stylesheet">

    <link href="css/tooplate-gotto-job.css" rel="stylesheet">
</head>
<body class="job-listings-page" id="top">

<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand d-flex align-items-center" href="index.jsp">
            <img src="images/logo.png" class="img-fluid logo-image">

            <div class="d-flex flex-column">
                <strong class="logo-text">Learn</strong>
                <small class="logo-slogan">Elearning Course</small>
            </div>
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav align-items-center ms-lg-5">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Homepage</a>
                </li>
                <li class="nav-item">
                </li>
                <li class="nav-item dropdown">
                </li>
                <li class="nav-item">
                </li>
                <li class="nav-item ms-lg-auto">
                </li>
                <%
                    String name = null;
                    if(name == null){ %>
                    <li class="nav-item">
                        <a class="nav-link custom-btn btn" href="login.jsp">Login</a>
                    </li>
                    <%
                    }
                    else {
                %>
                <li>
                    <a class="nav-link custom-btn btn" href="#"><%=name%></a>
                </li>
                <%}%>
            </ul>
        </div>
    </div>
</nav>

<main>
    <header class="site-header">
        <div class="section-overlay"></div>

        <div class="container">
            <div class="row">

                <div class="col-lg-12 col-12 text-center">
                    <h1 class="text-white">Danh sách các khoá học</h1>

                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center">
                            <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Course listings</li>
                        </ol>
                    </nav>
                </div>

            </div>
        </div>
    </header>
    <section class="job-section section-padding">
        <div class="container">
            <class class="row align-items-center">
                <div class="col-lg-6 col-12 mb-lg-4">
                    <h3>Các khoá học của bạn</h3>
                </div>
                <div class="col-lg-4 col-12 d-flex align-items-center ms-auto mb-5 mb-lg-4">
                </div>

                <%
                    // Lấy danh sách các video từ request
                List<Course> courses = (List<Course>) request.getAttribute("myCourses");
                if(courses != null && courses.size() > 0){
                    for (Course course : courses){
                    %>
                    <div class="col-lg-4 col-md-6 col-12">
                        <div class="job-thumb job-thumb-box">
                            <div class="job-image-box-wrap">
                                <a href="courseControllerSV?courseId=<%= course.getCourse_id() %>">
                                    <img src="images/jobs/sound-engineer-working-studio-with-equipment.jpg" class="job-image img-fluid" alt="">
                                </a>
                            </div>
                            <div class="job-body">
                                <h4 class="job-title">
                                    <a href="courseControllerSV?courseId=<%= course.getCourse_id()%>" class="job-title-link"><%=course.getCourse_name()%></a>
                                </h4>
                                <div class="d-flex align-items-center">
                                    <div class="job-image-wrap d-flex align-items-center bg-white shadow-lg mt-2 mb-4">
                                        <img src="images/avaNull.png" class="job-image me-3 img-fluid" alt="">

<%--                                        <p class="mb-0">Id giảng viên <%=course.getIDGV()%></p>--%>
                                    </div>
                                    <a href="#" class="bi-bookmark ms-auto me-2">
                                    </a>

                                    <a href="#" class="bi-heart">
                                    </a>
                                </div>
                                <div class="d-flex align-items-center border-top pt-3">
                                    <a href="courseControllerSV?courseId=<%= course.getCourse_id() %>" class="custom-btn btn ms-auto">Vào</a>
                                </div>
                            </div>
                        </div>
                    </div>
                        <%}
                    }
                    else {
                    %>
                    <h5>Bạn chưa tham gia khoá học nào</h5>
                    <%}%>
                </div>
            </class>
        </div>
    </section>
</main>

<footer class="site-footer">
    <div class="site-footer-bottom">
        <div class="container">
            <div class="row">

                <div class="col-lg-4 col-12 d-flex align-items-center">
                    <p class="copyright-text">Copyright © Gotto Job 2048</p>

                    <ul class="footer-menu d-flex">
                        <li class="footer-menu-item"><a href="#" class="footer-menu-link">Privacy Policy</a></li>

                        <li class="footer-menu-item"><a href="#" class="footer-menu-link">Terms</a></li>
                    </ul>
                </div>

                <div class="col-lg-5 col-12 mt-2 mt-lg-0">
                    <ul class="social-icon">
                        <li class="social-icon-item">
                            <a href="#" class="social-icon-link bi-twitter"></a>
                        </li>

                        <li class="social-icon-item">
                            <a href="#" class="social-icon-link bi-facebook"></a>
                        </li>

                        <li class="social-icon-item">
                            <a href="#" class="social-icon-link bi-linkedin"></a>
                        </li>

                        <li class="social-icon-item">
                            <a href="#" class="social-icon-link bi-instagram"></a>
                        </li>

                        <li class="social-icon-item">
                            <a href="#" class="social-icon-link bi-youtube"></a>
                        </li>
                    </ul>
                </div>

                <div class="col-lg-3 col-12 mt-2 d-flex align-items-center mt-lg-0">
                    <p>Design: <a class="sponsored-link" rel="sponsored" href="https://www.tooplate.com" target="_blank">Tooplate</a></p>
                </div>

                <a class="back-top-icon bi-arrow-up smoothscroll d-flex justify-content-center align-items-center" href="#top"></a>

            </div>
        </div>
    </div>
</footer>

<!-- JAVASCRIPT FILES -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/counter.js"></script>
<script src="js/custom.js"></script>

</body>
</html>
