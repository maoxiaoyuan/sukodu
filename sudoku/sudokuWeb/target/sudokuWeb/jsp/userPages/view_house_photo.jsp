<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://code.com/c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${title}</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
<style>
    body{
        padding-top: 50px;
        padding-bottom: 50px;
    }

    .imgCss_first{
        width: 870px;
        height: 500px;
        margin: 10px;
    }

    .imgCss_second{
        width: 550px;
        height: 400px;
        margin: 10px;
    }

    .imgCss_three{
        width: 300px;
        height: 400px;
        margin: 10px;
    }

    .imgCss_four{
        width: 420px;
        height: 250px;
        margin: 10px;
    }

    .imgCss_five{
        width: 430px;
        height: 250px;
        margin: 10px;
    }
    .imgCss_six{
        width: 270px;
        height: 300px;
        margin: 10px;
    }
    .imgCss_seven{
        width: 290px;
        height: 300px;
        margin: 10px;
    }
    .imgCss_eight{
        width: 250px;
        height: 300px;
        margin: 10px;
    }
    .imgCss_nine{
        width: 600px;
        height: 300px;
        margin: 10px;
    }
</style>

</head>

<body>
<jsp:include page="top.jsp"></jsp:include>
<div style="position: absolute;top:100px;left:100px;">
    <a href="<%=request.getContextPath()%>/house/detail/${houseId}">
        <ul class="list-inline list-unstyled" style="height: 40px;">
            <%--<li style="height:60px;width: 60px;margin-top: 10px;" ></li>--%>
            <li>
                <span  class="glyphicon glyphicon-chevron-left"></span>
            </li>
            <li>返回房源详情</li>
        </ul>
    </a>
</div>

    <hr>
    <div class="container" style="width: 60%;">
        <div class="row">
            <c:forEach items="${imgTitle}" var="imgTitle">
                <div  class="content">
                    <h3><b>${imgTitle.title}</b></h3>
                    <p>${imgTitle.smallTitle}</p>
                    <c:forEach items="${imgList}" var="imgs">
                        <c:if test="${imgTitle.title==imgs.title}">
                            <img src="../${imgs.imgPath}">
                        </c:if>
                    </c:forEach>
                </div>
            </c:forEach>
            <div>

            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
    var imgArr0=['imgCss_second','imgCss_three','imgCss_six','imgCss_seven','imgCss_six','imgCss_first','imgCss_eight','imgCss_nine','imgCss_four','imgCss_five'];
    var imgArr1=['imgCss_first','imgCss_four','imgCss_five','imgCss_six','imgCss_seven','imgCss_six','imgCss_second','imgCss_three','imgCss_eight','imgCss_nine'];
    var imgArr2=['imgCss_four','imgCss_five','imgCss_eight','imgCss_nine','imgCss_first','imgCss_second','imgCss_three','imgCss_six','imgCss_seven','imgCss_six'];
    var imgArr3=['imgCss_six','imgCss_seven','imgCss_six','imgCss_second','imgCss_three','imgCss_first','imgCss_eight','imgCss_nine','imgCss_four','imgCss_five'];
    var imgArr4=['imgCss_eight','imgCss_nine','imgCss_four','imgCss_five','imgCss_six','imgCss_seven','imgCss_six','imgCss_second','imgCss_three','imgCss_first'];

    $(".content").each(function (i,ele) {
        $(ele).find("img").each(function (index,ele_img) {
            var leng= $(ele).find("img").length;
            if(leng%5 == 0){
                $(ele_img).addClass(imgArr0[index%10]);
            }
            if(leng%5 == 1){
                $(ele_img).addClass(imgArr1[index%10]);
            }
            if(leng%5 == 2){
                $(ele_img).addClass(imgArr2[index%10]);
            }
            if(leng%5 == 3){
                $(ele_img).addClass(imgArr3[index%10]);
            }
            if(leng%5 == 4){
                $(ele_img).addClass(imgArr4[index%10]);
            }
        })
    })

</script>
