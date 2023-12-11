<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="modelBEAN.Video" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Danh sách các video</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+WyOVYO9iBE6dZCVJ+uaJw5C6DyJtr5SzkM"
          crossorigin="anonymous">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
            <%

                // Lấy danh sách các video từ request
                List<Video> videos = (List<Video>) request.getAttribute("videos");
            %>
    <div class="container">
        <button onclick="goBack()" class="btn btn-secondary">Quay lại</button>

        <h1>Danh sách các video: </h1>



        <% if (videos != null && videos.size() > 0) { %>
            <table class="table table-bordered mt-3">
                <thead>
                    <tr>
                        <th>ID video</th>
                        <th>Tiêu đề video</th>
                        <th>Đường dẫn</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Video video : videos) { %>
                        <tr>
                            <td><%= video.getIDVD() %></td>
                            <td><%= video.getVideo_title() %></td>
                            <td><a href="<%= video.getFile_path() %>"><%= video.getFile_path() %></a></td>

                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } else { %>
            <p>Không có video nào cho khóa học này.</p>
        <% } %>
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addVideoModal">
            Thêm Video
        </button>


        <!-- Modal -->
        <div class="modal fade" id="addVideoModal" tabindex="-1" role="dialog" aria-labelledby="addVideoModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addVideoModalLabel">Thêm Video</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="courseController" method="post">

                            <div class="form-group">
                                <label for="videoTitle">Tiêu đề Video</label>
                                <input type="text" class="form-control" id="videoTitle" name="videoTitle" required>
                            </div>
                            <div class="form-group">
                                <label for="videoPath">Đường dẫn Video</label>
                                <input type="text" class="form-control" id="videoPath" name="videoPath" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Thêm Video</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function goBack() {
            window.history.back();
        }
    </script>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-Z9AtgHkPxUKs1mmEjV9pKGIXVTwZHO1GPqDGO8LYvJS1Ua3J5iqheZEgMxie1YQb"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+WyOVYO9iBE6dZCVJ+uaJw5C6DyJtr5SzkM"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
