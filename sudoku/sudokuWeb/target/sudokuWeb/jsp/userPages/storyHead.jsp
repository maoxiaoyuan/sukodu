<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>storyHead</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        a{
            color:black;
            text-decoration: none;
        }
        .nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover{
            border: 1px solid #389246;
            border-bottom-color: transparent;
        }
    </style>
</head>
<body>

<div class="header" style="width: 95%">
    <h2>故事</h2>
    <a href="<%=request.getContextPath()%>/story/toEditStory"  target="_parent" class="glyphicon glyphicon-plus" style="color:black;text-decoration: none;float: right;font-size: 20px;margin-right: 120px">有话要说</a>

    <ul class="nav nav-tabs">
        <li role="presentation" class="active"><a href="<%=request.getContextPath()%>/story/toStoryContent" target="contentFrame">精彩故事</a></li>
        <li role="presentation"><a href="<%=request.getContextPath()%>/story/getLikesByUserId" target="contentFrame">我的点赞</a></li>
        <li role="presentation"><a href="<%=request.getContextPath()%>/story/getFavoritesByUserId" target="contentFrame">我的收藏</a></li>
        <li role="presentation"><a href="<%=request.getContextPath()%>/story/getFollows" target="contentFrame">我的关注</a></li>
        <li role="presentation"><a href="<%=request.getContextPath()%>/story/getFollowers" target="contentFrame">我的粉丝</a></li>
        <li role="presentation"><a href="<%=request.getContextPath()%>/story/getStoryByUserId" target="contentFrame">我的故事</a></li>
    </ul>
</div>

</body>
<script>
    function changeStyle(){
        $("[role='presentation']").each(function(){
            $(this).click(function(){
                $("[role='presentation']").each(function(){
                    $(this).removeAttr("class","active");
                });
                $(this).attr("class","active");
            })
        })
    }
    changeStyle();

</script>
</html>
