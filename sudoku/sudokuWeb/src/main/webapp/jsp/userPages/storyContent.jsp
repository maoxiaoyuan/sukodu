<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>storyContent</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
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
<div class="container" style="height: 100%;width:100%;padding-top: 50px;">
    <ul style="margin-left: 40px">
        <c:forEach items="${storyList}" var="story" varStatus="loop">
            <li style="float: left;margin-right: 60px;margin-bottom:20px;width: 180px;height:320px;cursor: pointer">
                <a href="<%=request.getContextPath()%>/story/getStoryById/${story.sid}" target="_blank">
                    <img src="../${story.img01}" style="width:180px;height:200px;">
                </a>
                <p style="height:50px;overflow : hidden;text-overflow: ellipsis;display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;">
                    <span style="font-weight: bolder;">
                        <c:choose>
                            <c:when test="${!(story.tourCity eq 'false')}">
                                ${story.tourCity}
                            </c:when>
                            <c:otherwise>
                                ${story.house.city}
                            </c:otherwise>
                        </c:choose>
                            &nbsp;
                </span>${story.storyTitle}</p>
                <img src="../${story.user.headPhoto}" alt="" style="float:left;width:30px;height:30px" class="img-circle story-img">
                <img src="../img/dianzan_after.png" class="story-img" alt="">${sessionScope.storyDetailList[loop.count-1].likeNum}
                <img src="../img/comments.png" style="margin-bottom: -6px;"  class="story-img">${sessionScope.storyDetailList[loop.count-1].commentNum}
            </li>
        </c:forEach>
    </ul>
</div>
</body>
</html>
