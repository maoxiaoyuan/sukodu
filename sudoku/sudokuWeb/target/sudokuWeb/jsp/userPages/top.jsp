<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://code.com/c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>注册</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/ssi-uploader.min.css">

    <link rel="stylesheet" type="text/css" href="../css/nav.css"/>
    <link rel="stylesheet" type="text/css" href="../css/responsive.css"/>
    <!-- <link rel="stylesheet" href="styles/register.css"> -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="../js/ssi-uploader.min.js"></script>
</head>
<body>
    <header class="main_menu_area" style="background: rgba(144, 144, 144,0.8);">
    <nav class="navbar navbar-expand-lg navbar-light bg-light" >
        <a class="navbar-brand" href="<%=request.getContextPath()%>/house/houseList" style="height: 100%;margin-top: -10px;"><img src="../img/logo11.png" alt=""></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span></span>
            <span></span>
            <span></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav">
                <c:if test="${USER == null}">
                    <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/toLogin">登录</a></li>
                    <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/toRegister">注册</a></li>
                </c:if>
                <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/houseBasicInfo/toAdd">成为房东</a></li>
                <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/story/toStory">故事</a></li>
                <li class="nav-item"><a class="nav-link" href="contact.html">帮助</a></li>
                <li class="nav-item dropdown submenu">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        个人中心
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li class="nav-item"><a class="nav-link" href="blog.html">我的订单</a></li>
                        <li class="nav-item"><a class="nav-link" href="single-blog.html">在租房源</a></li>
                        <li class="nav-item"><a class="nav-link" href="elements.html">个人资料</a></li>
                    </ul>
                </li>
                <c:if test="${USER !=null}">
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                        <div style="width:50px;height:50px;float: left;border-radius: 50%;position: relative;top:5px;"><img src="../${USER.headPhoto}" class="img-circle" style="width: 100%;height: 100%;" ></div>
                        </a>
                        <div style="float: left;margin-left: 10px;"><a href="<%=request.getContextPath()%>/quit">退出</a></div>
                    </li>
                </c:if>
            </ul>
        </div>
    </nav>
</header>

</body>
</html>