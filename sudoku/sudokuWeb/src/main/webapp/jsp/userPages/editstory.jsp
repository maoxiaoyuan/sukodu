<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>编辑故事</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        .container{
            margin:0 auto;
            position: relative;
            top: 70px;
        }
        .header h1{
            font-size: 60px;
            font-family: "华文新魏", "STXinwei";
        }
        .header h4{
            margin-left: 10px;
        }
        .content{
            margin-top:50px;
        }

        .content label{
            font-size: 18px;
        }

        .content .thumb-image{
            width:650px;
            height:500px;
        }
        .image-holder{
            padding: 20px;
            border: 1px solid rgba(0, 0, 0, 0.5);
            border-radius: 20px;

        }
        .content .img-div{
            padding-bottom: 10px;
        }
        .content .close{
            font-size: 40px;
        }

        .content #story-content,#story-title{
            font-size: 18px;
            resize: none;
        }
        .content .btn-danger{
            width:200px;
            font-size: 20px;
            outline: none;
        }
        .dropdown-menu li img{
            width:50px;
            height: 50px;
            border-radius: 5px ;
            margin-right: 10px;
            float: left;
            margin-left: 10px;
        }
    </style>
</head>

<body>
<jsp:include page="top.jsp"/>
<div class="container">
    <div class="header">
        <h1>编辑故事</h1>
        <h4>快来写下你的故事吧......</h4>
    </div>
    <div class="user"></div>
    <div class="content">
        <div>
            <form action="<%=request.getContextPath()%>/story/editStory" enctype="multipart/form-data" method="post" class="form-horizontal" role="form" id="storyForm">
                <div class="form-group">
                    <label for="uploadFile" class="col-sm-2 control-label">添加图片</label>
                    <div class="col-sm-8" >
                        <div id="image-holder" class="col-sm-12" style="display:inline">
                            <label for="uploadFile"><span class="glyphicon glyphicon-picture" style="font-size: 40px;opacity: 0.75;"></span></label>
                            <p id="choose-pic" class="pull-right" style="display:inline-block;line-height:40px;margin-right:70px;">请选择图片（最多6张图片）</p>
                            <input type="file" class="form-control" id="uploadFile" name="uploadFile" multiple style="display: none;"><br>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="chooseHouse" class="col-sm-2 control-label">关联房源</label>
                    <div class="col-sm-8">
                        <select class="form-control" id="chooseHouse" name="house.hid">
                            <option value="0">请选择房源</option>
                            <%--<c:if test="${orders!=null}">--%>
                                <%--<c:forEach items="${orders}" var="item" varStatus="loop">--%>
                                    <%--<option value="${item.houseid}">--%>
                                            <%--${item.house.city} 订单日 ${timeList[loop.count-1]}--%>
                                    <%--</option>--%>
                                <%--</c:forEach>--%>
                            <%--</c:if>--%>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="tourCity" class="col-sm-2 control-label">旅游地点</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="tourCity" name="tourCity">
                    </div>
                </div>
                <div class="form-group">
                    <label for="story-title" class="col-sm-2 control-label">故事标题</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="story-title" name="storyTitle" placeholder="20字以内...">
                    </div>
                </div>
                <div class="form-group">
                    <label for="story-content" class="col-sm-2 control-label">故事内容</label>
                    <div class="col-sm-8">
                        <textarea rows="10" class="form-control" id="story-content" name="storyContent"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-5">
                        <button type="submit" class="btn btn-danger" id="submit">立即发布</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
<script>
    //上传图片
    $("#uploadFile").on('change', function () {
        if (typeof (FileReader) != "undefined") {

            var image_holder = $("#image-holder");
            var $close_img="<span class='close' aria-hidden='true'>&times;</span>"

            // var file = this.files[0];
            var fileList=this.files;
            console.log(fileList);
            //对文件组进行遍历，可以到控制台打印出fileList去看看
            for(var i=0;i<fileList.length;i++) {
                var reader = new FileReader();
                reader.readAsDataURL(fileList[i]);
                reader.onload = function (e) {
                    //限定上传文件的类型，判断是否是图片类型
                    // if (!/image\/\w+/.test(fileList[i].type)) {
                    //     alert("只能选择图片");
                    //     return false;
                    // }
                    var img_div=$("<div class='img-div'></div>");
                    img_div.appendTo(image_holder);
                    $("<img />", {
                        "src": e.target.result,
                        "class": "thumb-image img-rounded"
                    }).appendTo(img_div);
                    img_div.append($close_img);
                    var num=$('.img-div').length;
                    $('#choose-pic').empty().append("已选择"+num+"张图片");
                    $('.close').click(function(){
                        // alert("确定关闭吗？");
                        $(this).parent().remove();
                        // alert(num)
                        $('#choose-pic').empty().append("已选择"+$('.img-div').length+"张图片" +
                            "" +
                            "");
                        if($('.img-div').length<=0){
                            // alert("没有图片了");
                            image_holder.removeClass("image-holder");
                            $('#choose-pic').empty().append("请选择图片（最多6张图片）");
                        }
                    })

                }

            }
            if($('.img-div').length>5){
                alert("您选择的图片已达上限");
                return false;
            }
            image_holder.show().addClass("image-holder");


        } else {
            alert("你的浏览器不支持FileReader.");
        }
    });



    // $("#submit").click(function(){
    //     $(".form-group").each(function(){
    //         if($(this).find("input").innerText==""||$(this).find("textarea").innerText==""){
    //             $("#submit").addClass("disabled");
    //             $("#submit").attr("title","请完善信息");
    //             return false;
    //         }else{
    //             $("#storyForm").attr("action","/story/insertStory");
    //             $("#storyForm").submit();
    //         }
    //     })
    //
    // })


</script>
</html>