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
    <link rel="stylesheet" href="css/ssi-uploader.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="js/ssi-uploader.min.js"></script>
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
            padding-top: 10px;
            background: white;
            width:700px;
            height:700px;
            border-radius: 5%;
            font-size: 16px;
        }
        .content .form-group{
            margin-bottom: 30px;
        }
        .content form{
            width: 85%;
            margin-left: 100px;
        }
        .content .register-title{
            display: inline-block;     
            margin-bottom: -10px;   
            padding-bottom: 5px; 
            font-size: 30px;
            border-bottom: 3px solid red;
        }

        .content hr{
            margin-top: 10px;
        }
        .content .high{
            /* text-align: center; */
            vertical-align:middle;
            font-size: 20px;
            color:red;
        }
        .content .help-block{
            /*display: inline;*/
            position: relative;
            left:-160px;
            font-size: 13px;
        }
        .content .btn-danger{
            width:200px;
            font-size: 20px;
            outline: none;
        }
        .content .sex-choice{
            margin-right: 5px;
            zoom: 150%;
        }
        .content .sex-one{
            position: relative;
            top: -5px;
        }
        .content .agreement{
            margin-right: 5px;
            zoom: 200%;
        }
        .content .read{
            position: relative;
            top: -6px;
        }
        .thumb-image{
            height:50px;
            width: 50px;
        }


    </style>
    <script>
        $(document).ready(function () {
            $("#sendEmail").on("click",function () {
                console.log($("#email").val());
                $.ajax({
                    "url":"<%=request.getContextPath()%>/sendEmail",
                    "type":"get",
                    "data":{"email":$("#email").val()},
                    "dataType":"json",
                    "success":function (json) {
                        for (var i=0;i<json.length;i++){
                           console.log(json);
                           $("#realYanzhengma").val(json);
                        }
                    }
                });
            });
        });
    </script>
</head>
<body>
    <jsp:include page="top.jsp"></jsp:include>
    <div class="container">
        <div class="content">
                <p class="register-title col-sm-offset-2">注册</p>
                <span class="col-sm-offset-5">已有账号，<a href="<%=request.getContextPath()%>/toLogin">去登录>></a></span>
                <hr class="col-sm-offset-1">
                <div>
                    <form:form action="/sudoku/register" modelAttribute="user" cssClass="form-horizontal" role="form" id="form1" enctype="multipart/form-data" onsubmit="return check()">
                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label">用户名</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control required" id="name" name="name">
                            </div>
                        </div>
            
                        <div class="form-group has-feedback check">
                            <label for="password" class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control required" id="password" name="password">
                                <span class='glyphicon form-control-feedback'></span>
                            </div>
                            <p class="help-block"></p>
                        </div>
                        <div class="form-group has-feedback check">
                            <label for="sure-password" class="col-sm-2 control-label">确认密码</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control required" id="sure-password" name="sure-password">
                                <span class='glyphicon form-control-feedback'></span>
                            </div>
                            <p class="help-block"></p>
                        </div>
                        <%--<div class="form-group">--%>
                            <%--<label class="col-sm-2 control-label">性别</label>--%>
                            <%--<div class="col-sm-2" class="required">--%>
                                <%--<input type="radio" id="male" name="sex" class="sex-choice" value="男"><span class="sex-one">男</span>--%>
                            <%--</div>--%>
                            <%--<div class="col-sm-2">--%>
                                <%--<input type="radio" id="female" name="sex" class="sex-choice" value="女"><span class="sex-one">女</span>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="form-group">--%>
                            <%--<label for="age" class="col-sm-2 control-label">年龄</label>--%>
                            <%--<div class="col-sm-6">--%>
                                <%--<input type="text" class="form-control required" id="age" name="age">--%>
                            <%--</div>--%>
                            <%--<p class="help-block"></p>--%>
                        <%--</div>--%>
                        <%--<div class="form-group has-feedback check">--%>
                            <%--<label for="phone" class="col-sm-2 control-label">手机号</label>--%>
                            <%--<div class="col-sm-6">--%>
                                <%--<input type="text" class="form-control required" id="phone" name="phone">--%>
                                <%--<span class='glyphicon form-control-feedback'></span>--%>
                            <%--</div>--%>
                            <%--<p class="help-block"></p>--%>
                        <%--</div>--%>
                        <%--<div class="form-group  has-feedback check">--%>
                            <%--<label for="idNumber" class="col-sm-2 control-label">身份证号</label>--%>
                            <%--<div class="col-sm-6">--%>
                                <%--<input type="text" class="form-control" id="idNumber" name="idNumber">--%>
                                <%--<span class='glyphicon form-control-feedback'></span>--%>
                            <%--</div>--%>
                            <%--<p class="help-block"></p>--%>
                        <%--</div>--%>
                        <div class="form-group has-feedback check">
                            <label for="email" class="col-sm-2 control-label">邮箱</label>
                            <div class="col-sm-6">
                                <span><input type="text" class="form-control" id="email" name="email"></span>
                                <span class='glyphicon form-control-feedback'></span>
                            </div>
                            <p class="help-block"></p>
                        </div>
                        <div class="form-group  has-feedback check" >
                            <label class="col-sm-2 control-label">验证码</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="yanzhengma" name="yanzhengma" style="width: 180px;">
                                <span class='glyphicon form-control-feedback' ></span>
                                <button id="sendEmail" style="border:1px solid #dadada;position: relative;top:-33px;left:190px;height:30px;line-height: 30px;width: 100px;border-radius: 5px;text-align: center;background: #dadada;color: white">发送验证码</button>
                                <input type="hidden" id="realYanzhengma" value=""/>
                            </div>
                            <p class="help-block" style="position: relative;top:30px;left: -80px;"></p>
                        </div>
                        <div class="form-group">
                            <label for="file" class="col-sm-2 control-label">上传头像</label>
                            <div class="col-sm-6" >
                                <label for="file" class="lable-span"><span class="glyphicon glyphicon-picture" style="font-size: 30px;"></span></label>
                                <input type="file" class="form-control" id="file" name="file" style="display: none">
                                <div id="image-holder" style="display:inline"></div>
                            </div>
                        </div>
            
                        <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-8">
                                    <p><strong class='high'>*</strong>为用户必填项,请正确填写</p>
                                    <input type="checkbox" class="agreement"><span class="read">我已阅读并同意<a>《九宫格用户服务条款》</a></span>
                                </div>
                            </div>
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-6">
                                <button type="submit" class="btn btn-danger disabled" id="submit">立即注册</button>
                            </div>
                        </div>
                    </form:form>
                </div>
            <div style="height: 100px;"></div>
        </div>
        
    </div>
    <script>
        // 头像上传
        $("#file").on('change', function () {

            if (typeof (FileReader) != "undefined") {

                var image_holder = $("#image-holder");
                image_holder.empty();
                $(".lable-span").empty();
                var $close_img="<span class='close col-sm-10'  aria-hidden='true' style='position: relative;top:-55px;'>&times;</span>"
                var reader = new FileReader();
                reader.onload = function (e) {

                    $("<img />", {
                        "src": e.target.result,
                        "class": "thumb-image"
                    }).appendTo(image_holder);
                    image_holder.append($close_img)
                    $('.close').click(function(){
                        // alert("确定关闭吗？");
                        $(".lable-span").append("<span class='glyphicon glyphicon-picture' style='font-size: 30px;'></span>");
                        image_holder.hide();
                        $("#file").val("");
                        })    
                }
                
                image_holder.show();
                reader.readAsDataURL($(this)[0].files[0]);
            } else {
                alert("你的浏览器不支持FileReader.");
            }
            });
        //添加必填的*
        $("form :input.required").each(function () {
            //创建一个元素
            var $required=$("<strong class='high'>*</strong>");
            $(this).parent().after($required)
            // after("<p class='help-block'></p>");
        })
        //验证出错样式
        isFalse=function(praObject,errorMessage){
            praObject.parent().removeClass("has-success").addClass("has-error");
            praObject.parent().find(".help-block").empty().append(errorMessage);
            praObject.find(".glyphicon").removeClass("glyphicon-ok").addClass("glyphicon-remove");
        }
        //验证正确样式
        isTrue=function(praObject){
            praObject.parent().removeClass("has-error").addClass("has-success");
            praObject.parent().find(".help-block").empty().append("");
            praObject.find(".glyphicon").removeClass("glyphicon-remove").addClass("glyphicon-ok");
        }
        //清空验证样式
        cleanStyle=function(praObject){
            praObject.parent().removeClass("has-error").removeClass("has-success");
            praObject.parent().find(".help-block").empty().append("");
            praObject.find(".glyphicon").removeClass("glyphicon-remove").removeClass("glyphicon-ok");
        }
        //分别对表单内容进行验证
        $("form :input").blur(function () {
                //验证密码
                if($(this).is("#password")){
                    var $parent=$("#password").parent();
                    if($("#password").val()==""){
                        var errorMessage="请输入密码";
                        isFalse($parent,errorMessage);
                    }else {
                        var re=/([A-z]|[0-9]|[.,?\/!@#$%^&*+=-~·]){6,16}/;
                        if(re.test($("#password").val())){
                            isTrue($parent);
                         }else{
                            var errorMessage="请输入6-16位密码";
                            isFalse($parent,errorMessage);
                        }
                    }
                }
                //确认密码
                if($(this).is("#sure-password")){
                    var $parent=$("#sure-password").parent();
                    if($("#sure-password").val()==""||$("#sure-password").val()!=$("#password").val()){
                        var errorMessage="两次密码输入不一致";
                        isFalse($parent,errorMessage);
                    }else{
                        isTrue($parent);
                    }
                }

            //确认验证码
            if($(this).is("#yanzhengma")){
                var $parent=$("#yanzhengma").parent();
                if($("#yanzhengma").val()==""){
                    var errorMessage="验证码不能为空";
                    isFalse($parent,errorMessage);
                }else if ($("#yanzhengma").val().toLocaleLowerCase()!=$("#realYanzhengma").val().toLocaleLowerCase()){
                    var errorMessage="验证码错误";
                    isFalse($parent,errorMessage);
                } else{
                    isTrue($parent);
                }
            }

                 //验证年龄
                 if($(this).is("#age")){
                    var $parent=$("#age").parent();
                    if($("#age").val()==""){
                        var errorMessage="请输入年龄";
                        isFalse($parent,errorMessage);
                    }else{
                        cleanStyle($parent);

                    }
                }

                //验证手机号
                if($(this).is("#phone")){
                    var $parent=$("#phone").parent();
                    if($("#phone").val()==""||$("#phone").val().length<11){
                        var errorMessage="请输入正确的11位手机号";
                        isFalse($parent,errorMessage);
                    }else{
                        isTrue($parent);
                    }
                }
                //验证身份证
                if($(this).is("#idNumber")){
                    var $parent=$("#idNumber").parent();
                    if ($("#idNumber").val()!=""){
                        if($("#idNumber").val().length != 18){
                            var errorMessage="请输入正确的18位身份证号";
                            isFalse($parent,errorMessage);
                        }else{
                            isTrue($parent);
                        }
                    }else{
                        cleanStyle($parent);
                    }

                }
                //验证邮箱
                if($(this).is("#email")){
                    var $parent=$("#email").parent();
                    if($("#email").val()!=""){
                        if($("#email").val()!=""&& !/.+@.+\.[a-zA-Z]{2,4}$/.test($("#email").val())) {
                            var errorMessage = "请输入正确的邮箱格式";
                            isFalse($parent, errorMessage);
                        }else{
                            isTrue($parent);
                        }
                    }else{
                        cleanStyle($parent);
                    }
                }
        
            })


        $("#submit").hover(function(){


            $(".required").each(function(){
                if($(this).val() == ""){
                    $("#submit").addClass("disabled");
                    $("#submit").attr("title","请填写正确信息");
                }else{
                    $(".check").each(function () {
                        if ($(this).hasClass("has-error")){
                            console.log("有错误");
                            $("#submit").addClass("disabled");
                            $("#submit").attr("title","请填写正确信息");
                        } else {
                            $("#submit").addClass("disabled");
                            $("#submit").attr("title","请填写正确信息");
                            if ($(".agreement").prop("checked")==true) {
                                $("#submit").removeClass("disabled");
                            }
                        }

                    })

                }
            })

        },function(){
            $("#submit").addClass("disabled");
            $("#submit").attr("title","请填写正确信息");
        })

        function check(){
            if ($("#submit").hasClass("disabled")){
                return false;
            }else{
                return true;
            }
        }
    </script>
    </body>
    
    
</html>