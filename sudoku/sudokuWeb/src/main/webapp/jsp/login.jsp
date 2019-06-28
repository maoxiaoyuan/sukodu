<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://code.com/c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>登录</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- <link rel="stylesheet" href="styles/register.css"> -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        body{
            background:url('img/d.jpg')  no-repeat center center;
            background-size:cover;
            background-attachment:fixed;
            background-color:#CCCCCC;
        }
        a{
            text-decoration: none;
        }
        a:hover{
            color: rgb(59, 59, 184);
        }
        .banner img{
            margin-left: 20px;
            width:100px;
            height: 100px;
        }
        .banner h3{
            display: inline;
            line-height: 100px;
        }
        .content{
            position: relative;
            top: 150px;
            margin:0 auto;
            padding: 20px 0 100px 0;
            background: white;
            border-radius: 10%;
            width:600px;
            font-size: 16px;
        }
        .content .register-title{
            display: inline-block;     
            margin-bottom: -10px;   
            padding-bottom: 5px; 
            font-size: 30px;
            border-bottom: 3px solid red;

        }
        .content hr{
            margin: 10px 0 40px 0;
        }

        .content .form-control{
            height: 50px;
        }
        .content .form-control-feedback{
            left:20px;
            height: 50px;
            line-height: 50px;
        }
        .content .required{
            padding-left: 40px;
        }
        
        .content .checknext{
            margin-right: 5px;
            zoom: 150%;
            border:1px solid black;
        }
        .content .next,.content .forget{
            position: relative;
            top: -6px;
            font-size: 14px;
        }
        
        .content .btn-danger{
            margin-top: 10px;
            font-size: 20px;
            outline: none;
        }
        

    </style>
    <script>
        function bodyInit() {
            if ('${result}'){
                alert('${result}');
            }
        }
    </script>
</head>
<body onload="bodyInit();">
    <jsp:include page="top.jsp"></jsp:include>
    <div class="container">
        <div class="content">
                <p class="register-title col-sm-offset-2">登录</p>
                <span class="col-sm-offset-3">没有账号，<a href="<%=request.getContextPath()%>/toRegister">立即注册>></a></span>
                <hr class="col-sm-offset-1">
                <div>
                    <form action="<%=request.getContextPath()%>/login"  method="post" class="form-horizontal" role="form" id="form1">
                        <div class="form-group">

                            <div class=" col-sm-offset-2 col-sm-6">
                                <span class='glyphicon glyphicon-user form-control-feedback'></span>
                                <c:if test="${USERNAME == null}">
                                    <input type="text" class="form-control required" id="name" name="name" placeholder="用户名">
                                </c:if>
                                <c:if test="${USERNAME !=null}">
                                    <input type="text" class="form-control required" id="name" name="name" placeholder="用户名" value="${USERNAME}">
                                </c:if>
                            </div>
                            <p class="help-block"></p>
                        </div>
            
                        <div class="form-group has-feedback">
                            <div class=" col-sm-offset-2 col-sm-6">
                                <span class='glyphicon glyphicon-lock form-control-feedback'></span>
                                <input type="password" class="form-control required" id="password" name="password" placeholder="密码">
                                
                            </div>
                            <p class="help-block"></p>
                        </div>
                        
                        <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-6">
                                    <input type="checkbox" class="checknext" name="checknext"><span class="next">下次自动登录</span>
                                    <a class="col-sm-offset-4 forget">忘记密码</a>
                                </div>
                            </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-6">
                                <button type="submit" class="btn btn-danger btn-block" id="submit">立即登录</button>
                            </div>
                        </div>
                
                    </form>
                </div>
        </div>
        
    </div>
    <script>
            
                
        $("#submit").click(function () {
            
            var $parent=$("#password").parent();
            if($("#username").val()==""){
                var errorMessage="请输入用户名";
                $("#username").parent().parent().find(".help-block").empty().append(errorMessage);
                
            }else {
                $("#username").parent().parent().find(".help-block").empty().append("");
            }
            if($("#password").val()==""){
                var errorMessage="请输入密码";   
                $("#password").parent().parent().find(".help-block").empty().append(errorMessage);        
            }else{
                $("#password").parent().parent().find(".help-block").empty().append("");
            }
    
        })

        </script>
    </body>
    
    
</html>