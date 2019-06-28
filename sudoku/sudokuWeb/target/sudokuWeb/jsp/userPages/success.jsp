<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://code.com/c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>九宫格民宿【每一家民宿都是独特的个性表达】</title>
    <link rel="stylesheet" href="css/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/house/houseBasicInfo.css">
    <script  src="js/jquery-3.3.1.min.js" charset="utf-8"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
        onload=function(){
            setInterval(go, 1000);
        };
        var x=3;
        function go(){
            x--;
            if(x>0){
                document.getElementById("sp").innerHTML=x;
                //每次设置的x的值都不一样了。
            }else{
                location.href='<%=request.getContextPath()%>/house/houseList';
            }
        }
    </script>
    <style>
        *{
            margin: 0px;
            padding:0px;
        }

        .content{
            margin-top: 170px;
        }

        a{
            text-decoration: underline;
            color:#20b2aa;
        }

    </style>
</head>

<body>
<div class="content">
    <div class="container">
        <div class="panel panel-default text-center" style=" width: 60%;height: 180px;margin-top:20px;margin-left: 200px;">
            <div class="panel-body">
                <h2 style="color:red">提交成功，等待管理员审核 </h2>
                <br>
                <h3 style="color:#20b2aa">
                    <span id="sp">3</span>秒后回首页
                    <small><a href="<%=request.getContextPath()%>/house/houseList">立即返回</a></small>
                </h3>

            </div>
        </div>
    </div>
</div>
</body>
</html>
