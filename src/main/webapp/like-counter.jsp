<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Initializing count for demo purposes. Use a database in production to persist count.
    Integer likeCount = (Integer) application.getAttribute("likeCount");
    if (likeCount == null) {
        likeCount = 0;
        application.setAttribute("likeCount", likeCount);
    }

    if (request.getParameter("action") != null && request.getParameter("action").equals("like")) {
        likeCount++;
        application.setAttribute("likeCount", likeCount);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Video Like Counter</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f9f9f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            text-align: center;
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 500px;
        }

        h1 {
            color: #333;
            font-size: 24px;
            margin-bottom: 10px;
        }

        p {
            color: #555;
            font-size: 16px;
        }

        .like-button {
            display: inline-block;
            background: #28a745;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s ease-in-out;
            margin-top: 10px;
        }

        .like-button:hover {
            background: #218838;
        }

        .like-count {
            margin-top: 15px;
            font-size: 18px;
            color: #007bff;
            font-weight: bold;
        }

        .video {
            margin: 15px 0;
        }

        iframe {
            width: 100%;
            max-width: 480px;
            height: 270px;
            border: none;
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Subject: Programming Basics</h1>
        <p>Watch the video below and show your support by liking it!</p>
        <div class="video">
            <!-- Example Video -->
            <iframe src="https://www.youtube.com/embed/vlDzYIIOYmM" allowfullscreen></iframe>
        </div>
        <form method="post">
            <button type="submit" class="like-button" name="action" value="like">Like</button>
        </form>
        <div class="like-count">Likes: <%= likeCount %></div>
    </div>
</body>
</html>
