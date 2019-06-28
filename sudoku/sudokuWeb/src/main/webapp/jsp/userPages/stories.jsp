<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- <link rel="stylesheet" href="styles/register.css"> -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>

        .story-img{
            width:20px;
            height:20px;
            margin-right: 10px;
        }
        li{
            list-style: none;
            float: right;
        }
    </style>
</head>
<body>
<div class="story container">
    <div style="width: 100%;height: 300px;">
    <ul>
        <c:forEach items="${storyList}" var="story" varStatus="loop">
            <li class="col-sm-offset-1"style="float: left;width: 150px;">
                <a href="getStoryById/${story.sid}">
                    <img src="../${story.img01}" style="width:150px;height:150px;">
                </a>
                <p><span style="font-weight: bolder;">${story.tourCity}&nbsp;</span>${story.storyTitle}</p>
                <img src="../${story.user.idImg}" alt="" style="float:left;width:30px;height:30px" class="img-circle story-img">
                <img src="../img/dianzan_after.png" class="story-img" alt="">${storyDetailList[loop.count-1].likeNum}
                <img src="../img/comments.png" style="margin-bottom: -6px;"  class="story-img">${storyDetailList[loop.count-1].commentNum}
            </li>
        </c:forEach>
    </ul>
    </div>


</div>
</body>
</html>