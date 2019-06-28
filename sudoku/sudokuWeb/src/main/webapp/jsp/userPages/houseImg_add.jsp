<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://code.com/c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>上传图片</title>
    <link rel="stylesheet" href="../css/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/house/houseBasicInfo.css">
    <script src="../js/jquery-3.3.1.min.js" charset="utf-8"></script>
    <script src="../js/bootstrap.min.js"></script>
    <style>
        *{
            margin: 0px;
            padding:0px;
        }
        .container-fluid .logo img{
            width:55%;
            height:70%;
        }
        .content{
            margin-top: 170px;
        }
        .content .container .row{
            /*border:1px solid black;*/
            margin-top: 30px;
            margin-left: 200px;
        }
        .content .container .row lable span{
            margin-right: 20px;
        }
        .content .container .row select{
            margin-right: 5px;
            line-height: 30px;
            font-size: 15px;
        }
        .li_style{
            height:70px;
            width:230px;
            border: 0px;
            #background: #20b2aa;
        }
        .li_font_style{
            font-size:120px;
            color:white;
            position: relative;
            top:-39px;
            left:-80px;
        }
        .li_content_style{
            position: relative;
            top:-135px;
            left:90px;
        }
        .li_img_style{
            position: relative;
            top:-140px;
            left: -70px;
            width: 40px;
            height: 40px;
        }
        .file-box{
            display: inline-block;
            position: relative;
            top:0px;
            overflow: hidden;
            color:#fff;
            /*background-color: #ccc;*/
        }
        .file-btn{
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            outline: none;
            background-color: transparent;
            filter:alpha(opacity=0);
            -moz-opacity:0;
            -khtml-opacity: 0;
            opacity: 0;
        }
        .photo{
            width:100px;
            height:100px;
            margin: 5px;
        }
        /*.smallAdd{*/
            /*margin-top:50px;*/
        /*}*/
    </style>
    <script>
        function saveImgs() {
            var JSONObj=new Object();//为JSON对象
            var img=new Object();//生成对象（保存Img）
            JSONObj.imgs=JSON.stringify(img);//将对象转成JSON

            var imgs_list="[";//生成集合（保存多个Img）
            var obj=null;//保存图片
            $(".operatorBody").each(function (index,element) {

            var title=$(element).find("[name='title']");
            var smallTitle=$(element).find("[name='smallTitle']");

            $(element).find("[name='image']").each(function (i,img) {
            if ($(img).val()!=""){
                obj=new Object();//生成一个Img对象
                obj.title = title.val();
                obj.smallTitle=smallTitle.val();
                obj.imgPath=$(img).val();
                var imgStr=obj.title+";"+obj.smallTitle+";"+obj.imgPath+";";
                imgs_list=imgs_list+imgStr+"],[";
            }
            });
            })
            $("#imgList").val(imgs_list);
            console.log("--"+$("#imgList").val());

        }
    </script>
</head>

<body>
<jsp:include page="top.jsp"/>
<div class="content">
    <div class="container">
        <ul class="list-unstyled list-inline"style="background: rgba(27,125,117,1);height:70px;width:100%;margin-left: -16px;" >
            <li class="list-group-item li_style" style="position: relative;top:-132px;background: #20b2aa;">
                <span><img src="../img/add1.png" alt="基本信息" style="padding-left: 10px;width: 60px;height: 50px;"></span>
                <span class="h3" style="padding-left: 10px;margin-top: 5px;">基本信息</span>
            </li>
            <li class="list-group-item li_style" style="background: #20b2aa;">
                <ul class="list-unstyled list-inline">
                    <li class="glyphicon glyphicon-chevron-right li_font_style" style="position: relative;top:-40px;"></li>
                    <li class="h3 li_content_style">规格信息</li>
                    <li><img src="../img/add2.png" alt="规格信息"class="li_img_style"/></li>
                </ul>
            </li>
            <li class="list-group-item li_style"  style="background: #20b2aa;">
                <ul class="list-unstyled list-inline">
                    <li class="glyphicon glyphicon-chevron-right li_font_style" style="position: relative;top:-40px;"></li>
                    <li class="h3 li_content_style">详细信息</li>
                    <li><img src="../img/add3.png" alt="详细信息" class="li_img_style"/></li>
                </ul>
            </li>
            <li class="list-group-item li_style" style="background: rgba(27,125,117,0.9);border: 0px;">
                <ul class="list-unstyled list-inline">
                    <li class="glyphicon glyphicon-chevron-right li_font_style" style="position: relative;top:-40px;"></li>
                    <li class="h3 li_content_style">上传图片</li>
                    <li><img src="../img/add4.png" alt="上传图片" class="li_img_style"/></li>
                </ul>
            </li>
            <li class="list-group-item li_style"style="width:200px;position: relative;left:32px;background: #20b2aa;">
                <ul class="list-unstyled list-inline">
                    <li class="glyphicon glyphicon-chevron-right li_font_style" style="position: relative;top:-40px;"></li>
                    <li class="h3 li_content_style">提交审核</li>
                    <li><img src="../img/add5.png" alt="提交审核" class="li_img_style"/></li>
                </ul>
            </li>
        </ul>
        <div class="row" style="width:70%;margin-left: 130px;" >
            <h3 style="margin-left: 350px;">上传图片</h3>
            <hr>
        </div>
        <form:form action="/sudoku/houseImg/add" cssClass="form-group" enctype="multipart/form-data">
            <input type="hidden"  value="" name="imageList" id="imgList"/>
            <input type="hidden" name="houseId" value="${houseId}">
            <div class="operatorBody">
                <div class="row form-inline">
                    <lable><span class="h4">标签：</span>
                        <input type="text" name="title" class="form-control" style="font-weight: bold">
                    </lable>
                    <lable><span>—</span></lable>
                    <input type="text" name="smallTitle" class="form-control" style="position:relative;left: -20px;">
                    <br>
                    <div>
                        <span style="color:#20b2aa; ">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp独立卧室—加大双人床</span>
                        <span style="color:#20b2aa; ">&nbsp&nbsp&nbsp&nbsp全功能卫生间—浓厚的艺术气息</span>
                        <span style="color:#20b2aa;">&nbsp&nbsp&nbsp&nbsp客厅—智能电视，空调，阳台</span>
                        <br>
                        <span style="color:#20b2aa; ">&nbsp&nbsp&nbsp&nbsp设施齐全的厨房—小冰箱</span>
                        <span style="color:#20b2aa; ">&nbsp&nbsp&nbsp&nbsp卧室—标准双人床、小号双人床、双垫层床垫</span>
                        <span style="color:#20b2aa;">&nbsp&nbsp&nbsp&nbsp......</span>
                    </div>
                </div>
                <div class="row" style="border: 1px solid #c4c4c4;width: 65%;height: 350px;">
                    <div style="float: left;">
                        <div class="file-box">
                            <input type="file" name="image" class="file-btn" onclick="changePhoto(this)">
                            <img src="../img/add.png" class="photo" >
                            <a href="#">上传图片</a>
                        </div>
                    </div>
                </div>
                <div style="height: 50px;"></div>
            </div>
            <span  id="add" style="font-size:20px;color:#20b2aa;;position: relative;left: 85%;top:-50px;">
                <span class="glyphicon glyphicon-plus"></span>
            </span>
            <div class="row">
                    <div class="col-lg-5">
                        <label class="control-label form-inline">
                            <input id="return" type="button" class="btn btn-default btn-danger" value="RETURN"/>
                        </label>
                    </div>
                    <div class="col-lg-7" >
                        <label class="control-label form-inline">
                            <input type="submit" id="submit" class="btn btn-default btn-info"  onmouseover="saveImgs()" value="NEXT"/>
                        </label>
                    </div>
                </div>
        </form:form>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
<script>
    $(document).ready(function () {
        $("#add").on("click",function () {
            $(this).prev().after("<div class='operatorBody' style='clear: both'>" +
                "<div class='row form-inline'>" +
                "<label><span class='h4'>图片描述：</span><input name='title' type='text' class='form-control' style='font-weight: bold'/></label>" +
                "<label><span> &nbsp—&nbsp </span></label><input name='smallTitle' type='text' class='form-control' style='position:relative'><br>" +
                "<div>" +
                "<span style='color:#20b2aa;'>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp独立卧室—加大双人床</span><span style='color:#20b2aa; '>&nbsp&nbsp&nbsp&nbsp全功能卫生间—浓厚的艺术气息</span>"+
                " <span style='color:#20b2aa; '>&nbsp&nbsp&nbsp&nbsp客厅—智能电视，空调，阳台</span><br><span style='color:#20b2aa;'>&nbsp&nbsp&nbsp&nbsp设施齐全的厨房—小冰箱</span>"+
                "<span style='color:#20b2aa; '>&nbsp&nbsp&nbsp&nbsp卧室—标准双人床、小号双人床、双垫层床垫</span><span style='color:#20b2aa; '>&nbsp&nbsp&nbsp&nbsp......</span>" +
                "</div>" +
                "</div>" +
                "<div class='row' style='border: 1px solid #c4c4c4;width: 65%;height: 350px;'>"+
                "<div style='float: left;'>"+
                "<div class='file-box'>"+
                " <input type='file' name='image' class='file-btn' onclick='changePhoto(this)'>"+
                "<img src='../img/add.png' class='photo'>"+
                "<a href=''#'>上传图片</a>"+
                "</div>"+
                "</div>"+
                "</div>" +
                "<div style='height: 50px;'></div>" +
                "</div>");
        })
    });
    function changePhoto(ele_photo) {
        var photo=$(ele_photo).parent();
        $(photo).on("change", "input[type=file]", function () {
            $(this).next().next().remove();
            var img = $(this).next();
            img.attr("class", "photo");
            var fil = this.files;
            for (var i = 0; i < fil.length; i++) {
                console.log(fil[i]);
                var reader = new FileReader();
                reader.readAsDataURL(fil[i]);
                reader.onload = function () {
                    img.attr("src", reader.result);
                };
            }
            //添加input标签
            $(this).parent().parent().parent().append("<div  style='float: left;'>" +
                "<div class='file-box'>" +
                "<input type='file' name='image' class='file-btn' onclick='changePhoto(this)'/> " +
                "<img src='../img/add.png' class='photo'>" +
                "</div>" +
                "</div>");
        });

    }
</script>