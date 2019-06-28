<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>用户中心</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style>
        .story-box{
            border-bottom: 1px solid rgba(0,0,0,0.1);
            padding: 20px 0 40px 0;
        }

        .story-content{
           overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            font-size: 12px;
            color: gray;
        }
        .story-title{
            font-size: 16px;
            padding-top: 15px;
        }
        .story-img{
            float:left;
            width:150px;
            height:100px;
            margin-right: 20px;
        }
        .btn{
            background-color: #fff;
            color: rgb(23, 116, 85);
            border:1px solid  rgb(23, 116, 85);
            font-weight: bolder;
            cursor: pointer;
            outline: none !important;
        }

        .follow{
            position: relative;
            left: 500px;
            top: -50px;
        }
        .followed{
            color: white;
            background-color: rgb(23, 116, 85);
        }
        .title{
            display: inline-block;
            font-weight: bold;
            font-size: 20px;
            margin-bottom: 20px;

        }

    </style>
</head>
<body>
<div class="container"  style="padding-top: 30px">
    <c:if test="${likesList!=null}">
        <p class="title">我的喜欢</p>
        <div style="width:70%">
            <c:forEach items="${likesList}" var="item">
                <div class="story-box">
                    <a href="<%=request.getContextPath()%>/story/getStoryById/${item.story.sid}" target="_blank">
                        <img src="../${item.story.img01}"  class="img-thumbnail story-img">
                    </a>
                    <p class="story-title"><span style="font-weight: bolder;display: inline-block;margin-right: 10px;">
                        <c:choose>
                            <c:when test="${!(item.story.tourCity eq 'false')}">
                                ${item.story.tourCity}
                            </c:when>
                            <c:otherwise>
                                ${item.story.house.city}
                            </c:otherwise>
                        </c:choose>
                </span>${item.story.storyTitle}</p>
                    <p class="story-content">${item.story.storyContent}</p>
                </div>
            </c:forEach>
        </div>
    </c:if>
    <c:if test="${favoritesList!=null}">
        <p class="title">我的收藏</p>
        <div style="width:70%">
            <c:forEach items="${favoritesList}" var="item">
                <div class="story-box">
                    <a href="<%=request.getContextPath()%>/story/getStoryById/${item.story.sid}" target="_blank">
                        <img src="../${item.story.img01}" class="img-thumbnail story-img">
                    </a>
                    <p class="story-title"><span style="font-weight: bolder;display: inline-block;margin-right: 10px;">
                        <c:choose>
                            <c:when test="${!(item.story.tourCity eq 'false')}">
                                ${item.story.tourCity}
                            </c:when>
                            <c:otherwise>
                                ${item.story.house.city}
                            </c:otherwise>
                        </c:choose>
                </span>${item.story.storyTitle}</p>
                    <p class="story-content" style="height: 70px;">${item.story.storyContent}</p>
                </div>
            </c:forEach>

        </div>
    </c:if>
    <c:if test="${follows!=null}">
        <p class="title">我的关注</p>
        <div style="width: 70%;">
            <c:forEach items="${follows}" var="item" varStatus="loop">
                <div style="border-bottom: 1px solid rgba(0,0,0,0.1);margin: 10px; height: 60px">
                    <img src="../${item.userFollower.headPhoto}" style="float:left;width:50px;height:50px;margin-right: 20px;" class="img-circle">
                    <p style="font-weight: bolder;display: inline-block;margin-right: 10px;line-height: 50px;">${item.userFollower.name}</p>
                    <form action="javascript:void(0)" method="post" id="followForm">
                        <c:if test="${followornotList[loop.count-1]==0}">
                            <button type="submit" name="follow"  id="${item.userFollower.id}" class="followList btn" value="0" style="position: relative;left: 450px;top: -40px;">关注</button>
                        </c:if>
                        <c:if test="${followornotList[loop.count-1]>=1}">
                            <button type="submit" name="follow" id="${item.userFollower.id}"  class='followList btn followed' value="1"  style="position: relative;left: 450px;top: -40px;" >已关注</button>
                        </c:if>
                    </form>
                </div>
            </c:forEach>
        </div>
    </c:if>
    <c:if test="${followers!=null}">
        <p class="title">我的粉丝</p>
        <div style="width: 70%;">
            <c:forEach items="${followers}" var="item" varStatus="loop">
                <div style="border-bottom: 1px solid rgba(0,0,0,0.1);margin: 10px; height: 60px;">
                    <img src="../${item.userFollow.headPhoto}" style="float:left;width:50px;height:50px;margin-right: 20px;" class="img-circle">
                    <p style="font-weight: bolder;display: inline-block;margin-right: 10px; line-height: 50px;">${item.userFollow.name}</p>
                    <form action="javascript:void(0)" method="post" id="followerForm">
                        <c:if test="${followornotList[loop.count-1]==0}">
                            <button type="submit" name="follow"  id="${item.userFollow.id}" class="followerList btn" value="0"  style="position: relative;left: 450px;top: -40px;">关注</button>
                        </c:if>
                        <c:if test="${followornotList[loop.count-1]>=1}">
                            <button type="submit" name="follow" id="${item.userFollow.id}"  class='followerList btn followed' value="1"  style="position: relative;left: 450px;top: -40px;" >已关注</button>
                        </c:if>
                    </form>
                </div>
            </c:forEach>
        </div>
    </c:if>
    <c:if test="${mystoryList!=null}">
        <p class="title">我的故事</p>
        <div style="width:70%">
            <c:forEach items="${mystoryList}" var="item">
                <div class="story-box">
                    <a href="<%=request.getContextPath()%>/story/getStoryById/${item.sid}" target="_blank">
                        <img src="../${item.img01}" class="img-thumbnail story-img">
                    </a>
                    <p class="story-title"><span style="font-weight: bolder;display: inline-block;margin-right: 10px;">
                        <c:choose>
                            <c:when test="${!(item.tourCity eq 'false')}">
                                ${item.tourCity}
                            </c:when>
                            <c:otherwise>
                                ${item.house.city}
                            </c:otherwise>
                        </c:choose>
                </span>${item.storyTitle}</p>
                    <p class="story-content" style="height:70px;">${item.storyContent}</p>
                    <a href="<%=request.getContextPath()%>/story/deleteStoryById/${item.sid}" onclick="if(confirm('确定删除?')==false)return false;"  >
                        <button id="delete" class="btn btn-danger btn-small col-sm-offset-7" style="float: right">删除</button>
                    </a>
                </div>
            </c:forEach>
        </div>
    </c:if>
</div>
</body>
<script>
    $('.followerList').each(function () {
        $(this).click(function () {
            // alert($(this).attr('id'));
            var followId=$(this).attr('id');
            if($(this).val()=='0'){
                $(this).empty().html("已关注").val('1').addClass('followed');
                $('#followerForm').attr("action","/story/insertFollower/"+followId);
                $('#followerForm').submit();
                return false;
            }else{
                $(this).empty().html("关注").val('0').removeClass('followed');
                $(this).hover(function(){
                    $(this).css("color","rgba(23, 116, 85, 0.42);")
                },function(){
                    $(this).css("color","rgb(23, 116, 85)")
                });
                $('#followerForm').attr("action","/story/deleteFollower/"+followId);
                $('#followerForm').submit();
                return false;
            }
        })
    });
    $('.followList').each(function () {
        $(this).click(function () {
            // alert($(this).attr('id'));
            var followId=$(this).attr('id');
            $(this).empty().html("关注").val('0').removeClass('followed');
            $(this).hover(function(){
                $(this).css("color","rgba(23, 116, 85, 0.42);")
            },function(){
                $(this).css("color","rgb(23, 116, 85)")
            });
            $('#followForm').attr("action","/story/deleteFollow/"+followId);
            $('#followForm').submit();
            return;

        })
    });
</script>
</html>
