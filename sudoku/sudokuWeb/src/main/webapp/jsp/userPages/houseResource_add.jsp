<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://code.com/c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>房屋规格信息</title>
    <link rel="stylesheet" href="../css/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/house/houseBasicInfo.css">
    <script src="../js/jquery-3.3.1.min.js" charset="utf-8"></script>
    <script src="../js/bootstrap.min.js"></script>
    <style>
        *{
            margin: 0px;
            padding:0px;
        }
        input{
            outline: none;
            border:none;
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
            background: #20b2aa;
        }
        .li_font_style{
            font-size:120px;
            color:white;
            position: relative;
            top:-40px;
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
        .radio-box{
            display: inline-block;
            position: relative;
            overflow: hidden;
            color:black;
            width: 60%;
        }
        .radio-btn{
            opacity: 0;
        }

        .subhead{
            width: 65%;
            font-size: 15px;
            margin: auto;
            font-weight: bold;
            margin-top: 50px;
        }
        .symbol{
            background: #dadada;
            color:white;
            border-bottom-left-radius:5px;
            border-top-left-radius: 5px;
            font-size:18px;
            color:black;
        }
        form .house-type table{
            width: 70%;
        }
        form .house-type table tr{
            height:50px;
        }
        form .rent-type table{
            width: 70%;
        }
        form .rent-type table tr{
            height:120px;
        }
        form .other-type table{
            width: 30%;
        }
        form .other-type table tr{
            height:70px;
        }
    </style>
</head>

<body>

<jsp:include page="top.jsp"></jsp:include>
<div class="content">
    <div class="container">
        <ul class="list-unstyled list-inline"style="background: #20b2aa;height:70px;width:100%;margin-left: -16px;" >
            <li class="list-group-item li_style" style="position: relative;top:-132px;background: #20b2aa;">
                <span><img src="../img/add1.png" alt="基本信息" style="padding-left: 10px;width: 60px;height: 50px;"></span>
                <span class="h3" style="padding-left: 10px;margin-top: 5px;">基本信息</span>
            </li>
            <li class="list-group-item li_style" style="background: rgba(27,125,117,0.9);">
                <ul class="list-unstyled list-inline">
                    <li class="glyphicon glyphicon-chevron-right li_font_style" style="position: relative;top:-40px;"></li>
                    <li class="h3 li_content_style">规格信息</li>
                    <li><img src="../img/add2.png" alt="规格信息"class="li_img_style"/></li>
                </ul>
            </li>
            <li class="list-group-item li_style" style="background: #20b2aa;">
                <ul class="list-unstyled list-inline">
                    <li class="glyphicon glyphicon-chevron-right li_font_style" style="position: relative;top:-40px;"></li>
                    <li class="h3 li_content_style">详细信息</li>
                    <li><img src="../img/add3.png" alt="详细信息" class="li_img_style"/></li>
                </ul>
            </li>
            <li class="list-group-item li_style" style="background: #20b2aa;border: 0px;">
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
            <h3 style="margin-left: 350px;">规格信息</h3>
            <hr>
        </div>
        <form:form action="/sudoku/houseResource/add" modelAttribute="houseResource" cssClass="form-group">
            <input type="hidden" name="houseId" value="${houseId}">
         <div>
             <div class="subhead" style="position: relative;top:15px;">房源类型</div>
            <div class="row house-type">
                <table data-toggle="buttons">
                    <tr>
                        <td>
                            <c:if test="${houseResource.houseType != '公寓'||houseResource.houseType == null}">
                                <label class="btn  btn-background radio-box " style="border:1px solid #bebebe;">公寓
                                    <input type="radio" name="houseType" value="公寓" class="radio-btn">
                                </label>
                            </c:if>
                            <c:if test="${houseResource.houseType == '公寓'}">
                            <label class="btn btn-background radio-box" style="border:1px solid #bebebe;">公寓
                                <input type="radio" name="houseType" value="公寓" class="radio-btn active" checked>
                            </label>
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${houseResource.houseType == '别墅'}">
                                <label class="btn  btn-background radio-box active" style="border:1px solid #bebebe;">别墅
                                    <input type="radio" name="houseType" value="别墅" class="radio-btn active" checked>
                                </label>
                            </c:if>
                            <c:if test="${houseResource.houseType != '别墅'||houseResource.houseType == null}">
                                <label class="btn  btn-background radio-box" style="border:1px solid #bebebe;">别墅
                                    <input type="radio" name="houseType" value="别墅" class="radio-btn">
                                </label>
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${houseResource.houseType == '海景房'}">
                                <label class="btn  btn-background radio-box active" style="border:1px solid #bebebe;">海景房
                                    <input type="radio" name="houseType" value="海景房" class="radio-btn active" checked>
                                </label>
                            </c:if>
                            <c:if test="${houseResource.houseType != '海景房'||houseResource.houseType == null}">
                                <label class="btn  btn-background radio-box" style="border:1px solid #bebebe;">海景房
                                    <input type="radio" name="houseType" value="海景房" class="radio-btn">
                                </label>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <c:if test="${houseResource.houseType == '树屋'}">
                                <label class="btn  btn-background radio-box active" style="border:1px solid #bebebe;">树屋
                                    <input type="radio" name="houseType" value="树屋" class="radio-btn active" checked>
                                </label>
                            </c:if>
                            <c:if test="${houseResource.houseType != '树屋'||houseResource.houseType == null}">
                                <label class="btn  btn-background radio-box" style="border:1px solid #bebebe;">树屋
                                    <input type="radio" name="houseType" value="树屋" class="radio-btn">
                                </label>
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${houseResource.houseType == '船屋'}">
                                <label class="btn  btn-background radio-box active" style="border:1px solid #bebebe;">船屋
                                    <input type="radio" name="houseType" value="船屋" class="radio-btn active" checked>
                                </label>
                            </c:if>
                            <c:if test="${houseResource.houseType != '船屋'||houseResource.houseType == null}">
                                <label class="btn  btn-background radio-box" style="border:1px solid #bebebe;">船屋
                                    <input type="radio" name="houseType" value="船屋" class="radio-btn">
                                </label>
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${houseResource.houseType == '露营地'}">
                                <label class="btn  btn-background radio-box active" style="border:1px solid #bebebe;">露营地
                                    <input type="radio" name="houseType" value="露营地" class="radio-btn active" checked>
                                </label>
                            </c:if>
                            <c:if test="${houseResource.houseType != '露营地'||houseResource.houseType == null}">
                                <label class="btn  btn-background radio-box" style="border:1px solid #bebebe;">露营地
                                    <input type="radio" name="houseType" value="露营地" class="radio-btn">
                                </label>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <c:if test="${houseResource.houseType == '民房'}">
                                <label class="btn  btn-background radio-box active" style="border:1px solid #bebebe;">民房
                                    <input type="radio" name="houseType" value="民房" class="radio-btn active" checked>
                                </label>
                            </c:if>
                            <c:if test="${houseResource.houseType != '民房'||houseResource.houseType == null}">
                                <label class="btn  btn-background radio-box" style="border:1px solid #bebebe;">民房
                                    <input type="radio" name="houseType" value="民房" class="radio-btn">
                                </label>
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${houseResource.houseType == '车屋'}">
                                <label class="btn  btn-background radio-box active" style="border:1px solid #bebebe;">车屋
                                    <input type="radio" name="houseType" value="车屋" class="radio-btn active" checked>
                                </label>
                            </c:if>
                            <c:if test="${houseResource.houseType != '车屋'||houseResource.houseType == null}">
                                <label class="btn  btn-background radio-box" style="border:1px solid #bebebe;">车屋
                                    <input type="radio" name="houseType" value="车屋" class="radio-btn">
                                </label>
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${houseResource.houseType == '度假村'}">
                                <label class="btn  btn-background radio-box active" style="border:1px solid #bebebe;">度假村
                                    <input type="radio" name="houseType" value="度假村" class="radio-btn active" checked>
                                </label>
                            </c:if>
                            <c:if test="${houseResource.houseType != '度假村'||houseResource.houseType == null}">
                                <label class="btn  btn-background radio-box" style="border:1px solid #bebebe;">度假村
                                    <input type="radio" name="houseType" value="度假村" class="radio-btn">
                                </label>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3"> <a href="#" style="color:#20b2aa"><strong>更多>></strong></a></td>
                    </tr>
                </table>
            </div>
             <div class="subhead" style="position: relative;top:15px;">出租类型</div>
            <div class="row rent-type">
                <table data-toggle="buttons">
                    <tr>
                        <td>
                            <c:if test="${houseResource.rentType == '合住房间'}">
                                <lable class="btn   btn-rentStyle radio-box active"style="border:1px solid #bebebe;">
                                    <div style="float: left;margin-left: 20px;">
                                        <h5><b>合住房间</b></h5>
                                        <img src="../img/room.png" alt="合住房间">
                                    </div>
                                    <div style="padding-top:20px;">
                                        <p><b>特点：</b>房客和他人共用卧室和</br>其他公共区域。</p>
                                    </div>
                                    <input type="radio" name="rentType" value="合住房间" class="radio-btn active" checked>
                                </lable>
                            </c:if>
                            <c:if test="${houseResource.rentType != '合住房间' || houseResource.rentType == null}">
                                <lable class="btn   btn-rentStyle radio-box" style="border:1px solid #bebebe;">
                                    <div style="float: left;margin-left: 20px;">
                                        <h5><b>合住房间</b></h5>
                                        <img src="../img/room.png" alt="合住房间">
                                    </div>
                                    <div style="padding-top:20px;">
                                        <p><b>特点：</b>房客和他人共用卧室和</br>其他公共区域。</p>
                                    </div>
                                    <input type="radio" name="rentType" value="合住房间" class="radio-btn">
                                </lable>
                            </c:if>
                         </td>
                    </tr>
                    <tr>
                        <td>
                            <c:if test="${houseResource.rentType == '整套房间'}">
                                <lable class="btn  btn-rentStyle radio-box active" style="border:1px solid #bebebe;">
                                    <div style="float: left;margin-left: 20px;">
                                        <h5><b>整套房间</b></h5>
                                        <img src="../img/all-house.png" alt="整套房间">
                                    </div>
                                    <div style="padding-top:20px;">
                                        <p><b>特点：</b>房客独享整个房源。</p>
                                    </div>
                                    <input type="radio" name="rentType" value="整套房间" class="radio-btn active" checked>
                                </lable>
                            </c:if>
                            <c:if test="${houseResource.rentType != '整套房间' || houseResource.rentType == null}">
                                <lable class="btn  btn-rentStyle radio-box " style="border:1px solid #bebebe;">
                                    <div style="float: left;margin-left: 20px;">
                                        <h5><b>整套房间</b></h5>
                                        <img src="../img/all-house.png" alt="整套房间">
                                    </div>
                                    <div style="padding-top:20px;">
                                        <p><b>特点：</b>房客独享整个房源。</p>
                                    </div>
                                    <input type="radio" name="rentType" value="整套房间" class="radio-btn">
                                </lable>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <c:if test="${houseResource.rentType == '独立房间'}">
                                <lable class="btn  btn-rentStyle radio-box active" style="border:1px solid #bebebe;">
                                    <div style="float: left;margin-left: 20px;">
                                        <h5><b>独立房间</b></h5>
                                        <img src="../img/house.png" alt="独立房间">
                                    </div>
                                    <div style="padding-top:20px;">
                                        <p><b>特点：</b>房客拥有自己独立的房间，<br>并且能够使用一些公共区域。</p>
                                    </div>
                                    <input type="radio" name="rentType" value="独立房间" class="radio-btn active" checked >
                                </lable>
                            </c:if>
                            <c:if test="${houseResource.rentType != '独立房间' || houseResource.rentType == null}">
                                <lable class="btn  btn-rentStyle radio-box" style="border:1px solid #bebebe;">
                                    <div style="float: left;margin-left: 20px;">
                                        <h5><b>独立房间</b></h5>
                                        <img src="../img/house.png" alt="独立房间">
                                    </div>
                                    <div style="padding-top:20px;">
                                        <p><b>特点：</b>房客拥有自己独立的房间，<br>并且能够使用一些公共区域。</p>
                                    </div>
                                    <input type="radio" name="rentType" value="独立房间" class="radio-btn" >
                                </lable>
                            </c:if>
                        </td>
                    </tr>
                </table>
            </div>
             <div class="subhead" style="position: relative;top:15px;">其他规格</div>
            <div class="row other-type">
                <table>
                    <tr>
                        <td>
                            <h4>最多容纳房客数</h4>
                        </td>
                        <td>
                            <select name="maxRoomer" class="form-control">
                                    <c:forEach begin="1" end="20" var="s">
                                        <c:if test="${houseResource.maxRoomer == null || houseResource.maxRoomer != s}">
                                            <option>${s}</option>
                                        </c:if>
                                        <c:if test="${houseResource.maxRoomer == s}">
                                            <option selected>${s}</option>
                                        </c:if>
                                    </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h4>出租的房间数量</h4>
                        </td>
                        <td>
                            <select name="roomNumber" class="form-control">
                                <c:forEach begin="1" end="10" var="s">
                                    <c:if test="${houseResource.roomNumber == null || houseResource.roomNumber != s}">
                                        <option>${s}</option>
                                    </c:if>
                                    <c:if test="${houseResource.roomNumber == s}">
                                        <option selected>${s}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h4>床铺数量</h4>
                        </td>
                        <td>
                            <select name="bedNumber" class="form-control">
                                <c:forEach begin="1" end="20" var="s">
                                    <c:if test="${houseResource.bedNumber == null || houseResource.bedNumber != s}">
                                        <option>${s}</option>
                                    </c:if>
                                    <c:if test="${houseResource.bedNumber == s}">
                                        <option selected>${s}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>
             <div class="subhead" style="position: relative;top:15px;">价格设定</div>
             <div class="row" style="position: relative;left: -20%;font-size: 18px;">
                 <div class="row">
                     <div class="col-sm-2">货币类型</div>
                     <div class="col-sm-3">人民币</div>
                 </div>
                 <div class="row">
                     <div class="col-sm-2">每晚价格</div>
                     <div class="col-sm-5">
                         <div class="input-group" style="">
                             <span class="input-group-addon symbol">￥</span>
                             <input  type="text" class="form-control" name="price" style="width: 30%;">&nbsp元
                         </div>
                     </div>
                 </div>
                 <div class="row">
                     <div class="col-sm-5">连续入住超过（含）7天折扣</div>
                     <div class="col-sm-2">
                         <input type="text" name="sevenDiscount" class="form-control text-center" placeholder="9.5">
                     </div>
                     <div class="col-sm-1" style="position: relative;left: -15px;top:2px;">
                         折
                     </div>
                 </div>
                 <div class="row">
                     <div class="col-sm-5">连续入住超过（含）28天折扣</div>
                     <div class="col-sm-2">
                         <input type="text" name="monthDiscount" class="form-control text-center" placeholder="8.6">
                     </div>
                     <div class="col-sm-1" style="position: relative;left: -15px;top:2px;">
                         折
                     </div>
                 </div>
             </div>
             <br><br><br>
            <div class="row">
                <div class="col-lg-4">
                    <label class="control-label form-inline">
                        <a  href="<%=request.getContextPath()%>/houseBasicInfo/toAdd" id="return" type="button" class="btn btn-default btn-danger" onclick="alert()">RETURN</a>
                    </label>
                </div>
                <div class="col-lg-6" >
                    <label class="control-label form-inline">
                        <input type="submit" class="btn btn-default btn-info" value="NEXT"/>
                    </label>
                </div>
            </div>
             </div>
        </form:form>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
<script>

    $(".btn-background").on("click",function () {
        $(".btn-background").css("border","1px solid #bebebe");
        $(".ok").remove();
            $(this).css("border","1.5px solid #20b2aa");
            $(this).after( "<img class='ok' src='../img/ok.png' style='width:30px;height: 30px;position: relative;left: -30px;top:3px;'>");
        console.log($(this));
    })

    $(".btn-rentStyle").on("click",function () {
        $(".btn-rentStyle").css("border","1px solid #bebebe");
        $(".rent-ok").remove();
        $(this).after( "<img class='rent-ok' src='../img/ok.png' style='width:30px;height: 30px;position: relative;left: -30px;top:34px;'>");
        $(this).css("border","1.5px solid #20b2aa");
        console.log($(this));


    })
    function alert() {
        alert("返回将会导致数据丢失");
    }
</script>