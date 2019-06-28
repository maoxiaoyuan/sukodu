<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://code.com/c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>房屋详细信息</title>
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
            background:#1ba6d4 ;
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
        form .room-detail{
            width:50%;
        }
        .panel{
            height:300px;
        }
         .room-detail table{
            width:100%;
        }
         .room-detail table tr{
           height:50px;
        }
        .room-detail table tr h4{
            padding-left:50px;
        }
         .room-detail table tr input{
            width: 70%;
        }
         .facility-detail table{
            width:100%;
        }
        .facility-detail table tr td img{
            width:70px;
            height:50px;
        }
        .checkbox{
            height: 40px;
        }
    </style>
</head>

<body>
<jsp:include page="top.jsp"/>
<div class="content">
    <div class="container">
        <ul class="list-unstyled list-inline"style="background: #20b2aa;height:70px;width:100%;margin-left: -16px;" >
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
            <li class="list-group-item li_style"  style="background: rgba(27,125,117,0.9);">
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
            <h3 style="margin-left: 350px;">详细信息</h3>
            <hr>
        </div>
        <form action="/sudoku/houseDetail/add" method="post" class="form-group" id="form1" >
            <input type="hidden" name="houseId" value="${houseId}">
            <div>
                <div class="row room-detail">
                    <h4><b>房间详情（选填）</b></h4>
                    <c:if test="${list == null}">
                        <div class="panel panel-default">
                            <div class="panel-heading" style="height: 40px;">
                                <button type="button" class="close"  aria-hidden="true">
                                    &times;
                                </button>
                            </div>
                            <div class="panel-body">
                                <table>
                                    <tr>
                                        <td>
                                            <h4 >房间名称：</h4>
                                        </td>
                                        <td>
                                            <input type="text" name="name" class="form-control" style="width: 70%;">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h4>房间价格：</h4></td>
                                        <td>
                                            <input type="text" name="price" class="form-control">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h4>容纳人数：</h4></td>
                                        <td>
                                            <input type="text" name="maxTenants" class="form-control">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h4>描述：</h4>
                                        </td>
                                        <td>
                                            <textarea  name="roomDescribe" class="form-control" style="width: 70%"></textarea>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${ list != null }">
                       <c:forEach var="houseDetail" items="${list}">
                           <div class="panel panel-default">
                               <div class="panel-heading" style="height: 40px;">
                                   <button type="button" class="close"  aria-hidden="true">
                                       &times;
                                   </button>
                               </div>
                               <div class="panel-body">
                                   <table>
                                       <tr>
                                           <td>
                                               <h4 >房间名称：</h4>
                                           </td>
                                           <td>
                                               <input type="text" name="name" class="form-control" style="width: 70%;" value="${houseDetail.name}">
                                           </td>
                                       </tr>
                                       <tr>
                                           <td>
                                               <h4>房间价格：</h4></td>
                                           <td>
                                               <input type="text" name="price" class="form-control" value="${houseDetail.price}">
                                           </td>
                                       </tr>
                                       <tr>
                                           <td>
                                               <h4>容纳人数：</h4></td>
                                           <td>
                                               <input type="text" name="maxTenants" class="form-control" value="${houseDetail.maxTenants}">
                                           </td>
                                       </tr>
                                       <tr>
                                           <td>
                                               <h4>描述：</h4>
                                           </td>
                                           <td>
                                               <textarea  name="roomDescribe" class="form-control" style="width: 70%" >${houseDetail.roomDescribe}</textarea>
                                           </td>
                                       </tr>
                                   </table>
                               </div>
                           </div>
                       </c:forEach>
                   </c:if>
                    <div class="btn btn-info" id="add" style="float:right;background: #20b2aa;">添加</div>
                </div>
            </div>
            <div>
                <div class="row facility-detail">
                    <h4><b>设施详情</b></h4>
                    <div class="row" style="margin-left: -120px;width: 90%;">
                        <table class="table table-striped text-center">
                            <tr>
                                <td width="25%">设施</td>
                                <td width="25%" style="border-right: 1px solid #b5b5b5">数量</td>
                                <td width="25%">设施</td>
                                <td width="25%">数量</td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="../img/wlan.png" alt="wlan">
                                    <small>WLAN</small>
                                </td>
                                <td style="border-right: 1px solid #b5b5b5">
                                    <div class="row input-group" style="margin-left: 15px;margin-top:8px;">
                                        <div class="col-md-3 input-group-btn">
                                            <button type="button" class="btn btn-default minus"><b>-</b></button>
                                        </div>
                                        <div class="col-md-6">
                                            <c:if test="${facility.WLAN == null}">
                                                <input type="text" name="WLAN" id="wlan" class="form-control text-center input-text" value="1"/>
                                            </c:if>
                                            <c:if test="${facility.WLAN != null}">
                                                <input type="text" name="WLAN" id="wlan" class="form-control text-center input-text" value="${facility.WLAN}"/>
                                            </c:if>
                                        </div>
                                        <div class="col-md-3 input-group-btn" style="margin-left: -30px;">
                                            <button type="button" class="btn btn-default plus"><b>+</b></button>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <img src="../img/heating.jpg" alt="热水器">
                                    <small>热水器</small>
                                </td>
                                <td>
                                    <div class="row input-group" style="margin-left: 15px;margin-top:8px;">
                                        <div class="col-md-3 input-group-btn">
                                            <button type="button" class="btn btn-default minus"><b>-</b></button>
                                        </div>
                                        <div class="col-md-6">
                                            <c:if test="${facility.heating == null}">
                                                <input type="text" name="heating" id="heating" class="form-control text-center input-text" value="1"/>
                                            </c:if>
                                            <c:if test="${facility.heating != null}">
                                                <input type="text" name="heating" id="heating" class="form-control text-center input-text" value="${facility.heating}"/>
                                            </c:if>
                                        </div>
                                        <div class="col-md-3 input-group-btn" style="margin-left: -30px;">
                                            <button type="button" class="btn btn-default plus"><b>+</b></button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="../img/airConditioner.jpg" alt="空调">
                                    <small>空调</small>
                                </td>
                                <td style="border-right: 1px solid #b5b5b5">
                                    <div class="row input-group" style="margin-left: 15px;margin-top:8px;">
                                        <div class="col-md-3 input-group-btn">
                                            <button type="button" class="btn btn-default minus"><b>-</b></button>
                                        </div>
                                        <div class="col-md-6">
                                            <c:if test="${facility.airConditioner == null}">
                                                <input type="text" name="airConditioner" id="airConditioner" class="form-control text-center input-text" value="1"/>
                                            </c:if>
                                            <c:if test="${facility.airConditioner != null}">
                                                <input type="text" name="airConditioner" id="airConditioner" class="form-control text-center input-text" value="${facility.airConditioner}"/>
                                            </c:if>
                                        </div>
                                        <div class="col-md-3 input-group-btn" style="margin-left: -30px;">
                                            <button type="button" class="btn btn-default plus"><b>+</b></button>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <img src="../img/fireplace.jpg" alt="壁炉">
                                    <small>壁炉</small>
                                </td>
                                <td>
                                    <div class="row input-group" style="margin-left: 15px;margin-top:8px;">
                                        <div class="col-md-3 input-group-btn">
                                            <button type="button" class="btn btn-default minus"><b>-</b></button>
                                        </div>
                                        <div class="col-md-6">
                                            <c:if test="${facility.fireplace == null}">
                                                <input type="text" name="fireplace" id="fireplace" class="form-control text-center input-text" value="1"/>
                                            </c:if>
                                            <c:if test="${facility.fireplace != null}">
                                                <input type="text" name="fireplace" id="fireplace" class="form-control text-center input-text" value="${facility.fireplace}"/>
                                            </c:if>
                                        </div>
                                        <div class="col-md-3 input-group-btn" style="margin-left: -30px;">
                                            <button type="button" class="btn btn-default plus"><b>+</b></button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="../img/iron.jpg" alt="熨斗">
                                    <small>熨斗</small>
                                </td>
                                <td style="border-right: 1px solid #b5b5b5">
                                    <div class="row input-group" style="margin-left: 15px;margin-top:8px;">
                                        <div class="col-md-3 input-group-btn">
                                            <button type="button" class="btn btn-default minus"><b>-</b></button>
                                        </div>
                                        <div class="col-md-6">
                                            <c:if test="${facility.iron == null}">
                                                <input type="text" name="iron" id="iron" class="form-control text-center input-text" value="1"/>
                                            </c:if>
                                            <c:if test="${facility.iron != null}">
                                                <input type="text" name="iron" id="iron" class="form-control text-center input-text" value="${facility.iron}"/>
                                            </c:if>
                                        </div>
                                        <div class="col-md-3 input-group-btn" style="margin-left: -30px;">
                                            <button type="button" class="btn btn-default plus"><b>+</b></button>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <img src="../img/hairDryer.jpg" alt="吹风机">
                                    <small>吹风机</small>
                                </td>
                                <td>
                                    <div class="row input-group" style="margin-left: 15px;margin-top:8px;">
                                        <div class="col-md-3 input-group-btn">
                                            <button type="button" class="btn btn-default minus"><b>-</b></button>
                                        </div>
                                        <div class="col-md-6">
                                            <c:if test="${facility.hairDryer == null}">
                                                <input type="text" name="hairDryer" id="hairDryer" class="form-control text-center input-text" value="1"/>
                                            </c:if>
                                            <c:if test="${facility.hairDryer != null}">
                                                <input type="text" name="hairDryer" id="hairDryer" class="form-control text-center input-text" value="${facility.hairDryer}"/>
                                            </c:if>
                                        </div>
                                        <div class="col-md-3 input-group-btn" style="margin-left: -30px;">
                                            <button type="button" class="btn btn-default plus"><b>+</b></button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="../img/washingMachine.jpg" alt="洗衣机">
                                    <small>洗衣机</small>
                                </td>
                                <td style="border-right: 1px solid #b5b5b5">
                                    <div class="row input-group" style="margin-left: 15px;margin-top:8px;">
                                        <div class="col-md-3 input-group-btn">
                                            <button type="button" class="btn btn-default minus"><b>-</b></button>
                                        </div>
                                        <div class="col-md-6">
                                            <c:if test="${facility.washingMachine == null}">
                                                <input type="text" name="washingMachine" id="washingMachine" class="form-control text-center input-text" value="1"/>
                                            </c:if>
                                            <c:if test="${facility.washingMachine != null}">
                                                <input type="text" name="washingMachine" id="washingMachine" class="form-control text-center input-text" value="${facility.washingMachine}"/>
                                            </c:if>
                                        </div>
                                        <div class="col-md-3 input-group-btn" style="margin-left: -30px;">
                                            <button type="button" class="btn btn-default plus"><b>+</b></button>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <img src="../img/dryer.jpg" alt="干洗机">
                                    <small>干洗机</small>
                                </td>
                                <td>
                                    <div class="row input-group" style="margin-left: 15px;margin-top:8px;">
                                        <div class="col-md-3 input-group-btn">
                                            <button type="button" class="btn btn-default minus"><b>-</b></button>
                                        </div>
                                        <div class="col-md-6">
                                            <c:if test="${facility.dryer == null}">
                                                <input type="text" name="dryer" id="dryer" class="form-control text-center input-text" value="1"/>
                                            </c:if>
                                            <c:if test="${facility.dryer != null}">
                                                <input type="text" name="dryer" id="dryer" class="form-control text-center input-text" value="${facility.dryer}"/>
                                            </c:if>
                                        </div>
                                        <div class="col-md-3 input-group-btn" style="margin-left: -30px;">
                                            <button type="button" class="btn btn-default plus"><b>+</b></button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="row other-detail">
                    <h4><b>其他</b></h4>
                    <div class="checkbox" style="margin-top: 40px;">
                        <lable style=" margin-left: 50px;">
                            <c:if test="${facility.kitchen == null}">
                                <input type="checkbox" value="0" name="kitchen" style="width: 20px;height: 20px;" />
                            </c:if>
                            <c:if test="${facility.kitchen != null}">
                                <input type="checkbox" value="1" name="kitchen" style="width: 20px;height: 20px;" checked/>
                            </c:if>
                        </lable>
                        <span style="margin-left: 40px;position: relative;top:5px;" class="h4">厨房</span>
                    </div>
                    <div class="checkbox">
                        <lable style="margin-left: 50px;">
                            <c:if test="${facility.bathroom == null}">
                                 <input type="checkbox" value="0" name="bathroom" style="width: 20px;height: 20px;"/>
                            </c:if>
                            <c:if test="${facility.bathroom != null}">
                                <input type="checkbox" value="1" name="bathroom" style="width: 20px;height: 20px;" checked/>
                            </c:if>
                        </lable>
                        <span style="margin-left: 40px;position: relative;top:5px;"  class="h4">浴室</span>
                    </div>
                    <div class="checkbox">
                        <lable style="margin-left: 50px;">
                            <c:if test="${facility.toilet == null}">
                                <input type="checkbox" value="0" name="toilet" style="width: 20px;height: 20px;"/>
                            </c:if>
                            <c:if test="${facility.toilet != null}">
                                <input type="checkbox" value="1" name="toilet" style="width: 20px;height: 20px;" checked/>
                            </c:if>
                        </lable>
                        <span style="margin-left: 40px;position: relative;top:5px;"  class="h4">卫生间</span>
                    </div>
                    <div class="checkbox">
                        <lable style="margin-left: 50px;">
                            <c:if test="${facility.livingRoom == null}">
                                <input type="checkbox" value="0" name="livingRoom" style="width: 20px;height: 20px;"/>
                            </c:if>
                            <c:if test="${facility.livingRoom != null}">
                                <input type="checkbox" value="1" name="livingRoom" style="width: 20px;height: 20px;" checked/>
                            </c:if>
                        </lable>
                        <span style="margin-left: 40px;position: relative;top:5px;"  class="h4">客厅</span>
                    </div>
                    <div class="checkbox">
                        <lable style="margin-left: 50px;">
                            <c:if test="${facility.swimmingPool == null}">
                                <input type="checkbox" value="0" name="swimmingPool" style="width: 20px;height: 20px;"/>
                            </c:if>
                            <c:if test="${facility.swimmingPool != null}">
                                <input type="checkbox" value="1" name="swimmingPool" style="width: 20px;height: 20px;" checked/>
                            </c:if>
                        </lable>
                        <span style="margin-left: 40px;position: relative;top:5px;"  class="h4">游泳池</span>
                    </div>
                    <div class="checkbox">
                        <lable style="margin-left: 50px;">
                            <c:if test="${facility.fitnessRoom == null}">
                                <input type="checkbox" value="0" name="fitnessRoom" style="width: 20px;height: 20px;"/>
                            </c:if>
                            <c:if test="${facility.fitnessRoom != null}">
                                <input type="checkbox" value="1" name="fitnessRoom" style="width: 20px;height: 20px;" checked/>
                            </c:if>
                        </lable>
                        <span style="margin-left: 40px;position: relative;top:5px;"  class="h4">健身房</span>
                    </div>
                </div>
            </div>
        </form>
        <%--</from>--%>
        <div class="row">
            <div class="col-lg-4">
                <label class="control-label form-inline">
                    <a  href="<%=request.getContextPath()%>/houseResource/toAdd" type="button" class="btn btn-default btn-danger">RETURN</a>
                </label>
            </div>
            <div class="col-lg-6" >
                <label class="control-label form-inline">
                    <input type="submit" id="submit" class="btn btn-default btn-info" value="NEXT"/>
                </label>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
<script>

    $(document).ready(function () {
        //房屋详情添加与删除操作
        close();
        $("#add").on("click",function () {
            var div_parent=$("<div class='panel panel-default'></div>");
            var div_children1=div_parent.append("<div class='panel-heading' style='height: 40px;'>" +
                "<button type='button' class='close' aria-hidden='true'>&times;" +
                "</button>" +
                "</div>");

            var div_children2=div_parent.append("<div class='panel-body'></div>");
            div_children2.append("<table>" +
                    "<tr>" +
                        "<td><h4 >房间名称：</h4></td>" +
                        "<td><input type='text' name='name' class='form-control'></td>" +
                    "</tr>" +
                    "<tr>" +
                        "<td><h4 >房间价格：</h4></td>" +
                        "<td><input type='text' name='price' class='form-control'></td>" +
                    "</tr>" +
                    "<tr>" +
                        "<td><h4 >容纳人数：</h4></td>" +
                        "<td><input type='text' name='maxTenants' class='form-control'></td>" +
                    "</tr>" +
                    "<tr>" +
                        "<td><h4 >描述：</h4></td>" +
                        "<td><textarea  name='roomDescribe' class='form-control' style='width: 70%'></textarea></td>" +
                    "</tr>" +
                "</table>");

            $(this).before(div_parent);
            close();
        })
            function  close() {
                $(".close").on("click",function () {
                    $(this).parent().parent().remove();
                })
            }

        //房屋详情添加与删除操作完毕

        //设施数量加减操作
        $(".minus").on("click",function(){
            var text=$(this).parent().next().children();
            var num=parseInt(text.val());
            if( num <=0){
                text.val(0);
            }else{
                text.val(num-1);
            }
        })
        $(".plus").on("click",function(){
            var text=$(this).parent().prev().children();
            var num=parseInt(text.val());
                text.val(num+1);
        })
        //设施数量加减操作完毕

        //多选框设值：选中1，未选中0
        $("input[type=checkbox]").on("click",function () {
            if ($(this).is(':checked')){
                $(this).val(1);
                console.log($(this).val());
            }else{
                $(this).val(0);
                console.log($(this).val());
            }
        })

        $("#submit").on("click",function(){
            $("#form1").submit();
        })
       
    });
  </script>