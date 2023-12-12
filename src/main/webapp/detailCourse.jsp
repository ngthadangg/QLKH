<%@ page import="modelBEAN.Course" %>
<%@ page import="java.util.List" %>
<%@ page import="modelBEAN.Video" %>
<%@ page import="modelBEAN.SinhVien" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chi tiết khoá học</title>
    <!-- CSS FILES -->
    <link rel="preconnect" href="https://fonts.googleapis.com">

    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=League+Spartan:wght@100;300;400;600;700&display=swap" rel="stylesheet">

    <link href="css/bootstrap.min.css" rel="stylesheet">

    <link href="css/bootstrap-icons.css" rel="stylesheet">

    <link href="css/owl.carousel.min.css" rel="stylesheet">

    <link href="css/owl.theme.default.min.css" rel="stylesheet">

    <link href="css/tooplate-gotto-job.css" rel="stylesheet">
    <style>
        h1 {
            text-align: center;
        }
        .menu {
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
        }

        .menu a {
            text-decoration: none;
            color: #000;
            padding: 10px 0;
            font-size: larger;
            align-self: center;
        }

        .menu a:hover {
            color: #ff0000;
        }

        .menu p {
            font-size: larger;
            align-self: center;
            font-weight: bold;
        }
    </style>
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
                    String name = (String) session.getAttribute("name");
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
                    <h1 class="text-white">Danh sách các bài giảng</h1>

                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center">
                            <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Course listings video</li>
                        </ol>
                    </nav>
                </div>

            </div>
        </div>
    </header>
    <section class="job-section section-padding">
        <div class="container">
            <div class="row">

                <%Course course = (Course) request.getAttribute("course");
                    List<Video> videos = (List<Video>) request.getAttribute("videos");%>
                <div class="col-lg-6 col-12 text-center mx-auto mb-4">
                    <h2>Khoá học: <%=course.getCourse_name()%></h2>
                </div>
                    <% if (videos != null && videos.size() > 0) {
                        int i = 1;
                        for (Video video : videos) {
                    %>
                <div class="col-lg-12 col-12">
                    <div class="job-thumb d-flex">
                        <div class="job-image-wrap bg-white shadow-lg">
                            <img src="images/logos/google.png" class="job-image img-fluid" alt="">
                        </div>

                        <div class="job-body d-flex flex-wrap flex-auto align-items-center ms-4">
                            <div class="mb-3">
                                <h4 class="job-title mb-lg-0">
                                    <a href="videoController?videoID=<%=video.getIDVD()%>" class="job-title-link">Bài <%=i++%>. <%=video.getVideo_title()%></a>
                                </h4>
                            </div>
                            <div class="job-section-btn-wrap">
                                <a href="videoController?videoID=<%=video.getIDVD()%>" class="custom-btn btn">Học ngay</a>
                            </div>
                        </div>
                    </div>
                    <%}
                    }
                    else {
                    %>
                    <h6>Không có bài giảng nào</h6>
                    <%}%>
                </div>
            </div>
        </div>
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

<%--<%Course course = (Course) request.getAttribute("course");--%>
<%--    List<Video> videos = (List<Video>) request.getAttribute("videos");%>--%>
<%--<h1>Khoá học <%=course.getCourse_name()%></h1>--%>
<%--<div class="menu">--%>
<%--    <% if (videos != null && videos.size() > 0) {--%>
<%--        int i = 1;--%>
<%--        for (Video video : videos) {--%>
<%--    %>--%>
<%--    <a href="">Bài <%=i++%>. <%=video.getVideo_title()%><a>--%>
<%--            <% }--%>
<%--        }--%>
<%--        else { %>--%>
<%--        <p>Không có video nao de hien thi.</p>--%>
<%--            <% } %>--%>
<%--</div>--%>
<%--<h2>Danh sách sinh viên</h2>--%>
<%--<br>--%>
<%--<%--%>
<%--    List<SinhVien> sinhViens = (List<SinhVien>) request.getAttribute("sinhViens");--%>
<%--    for(SinhVien sinhVien : sinhViens){--%>
<%--%>--%>
<%--<p><%=sinhVien.getName()%></p>--%>
<%--<br>--%>
<%--<%--%>
<%--    }--%>
<%--%>--%>