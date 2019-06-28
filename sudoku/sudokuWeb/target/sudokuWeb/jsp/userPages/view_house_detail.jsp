<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://code.com/c" %>
<%@taglib prefix="fn" uri="http://code.com/fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${houseBasic.title}</title>
    <link rel="stylesheet" href="../../css/ssi-uploader.min.css">
    <link rel="stylesheet" type="text/css" href="../../css/nav.css"/>
    <link rel="stylesheet" type="text/css" href="../../css/responsive.css"/>
    <link rel="stylesheet" type="text/css" href="../../css/footer.css"/>
    <script src="../../js/theme.js" charset="UTF-8"></script>
    <link rel="stylesheet" href="../../css/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script  src="../../js/jquery-3.3.1.min.js" charset="utf-8"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <script src="../../My97DatePicker/WdatePicker.js"></script>
    <script>
        $(function() {
            var houseId=${houseId};
            $("#pre").on("focus",function(){
                var validate_date_Array=new Array();
                //查询所有有效的日期
                $.ajax({
                    "url": "<%=request.getContextPath()%>/dateList",
                    "type": "get",
                    "data": {"houseId": houseId},
                    "dataType": "json",
                    async:false,
                    success: function(data){
                        console.log("data="+data);
                        //循环得到的List集合，放入数组中
                        $.each(data,function(index,obj){
                            validate_date_Array[index]=obj.toString();
                        });
                    }
                });
                console.log("---1---"+this.value);
                $(".bookStartTime").val($(this).val());
                WdatePicker({
                    el:this,
                    opposite:false,//如果不设置则disabledDates参数中的值会是“无效日期”
                    disabledDates:validate_date_Array,//绑定数组
                    minDate:'%y-%M-{%d+1}',
                    maxDate:'#F{$dp.$D(\'next\')}'
                });
            });

            $("#next").on("focus",function(){
                var validate_date_Array=new Array();
                //查询所有有效的日期
                $.ajax({
                    "url": "<%=request.getContextPath()%>/dateList",
                    "type": "get",
                    "data": {"houseId": houseId},
                    "dataType": "json",
                    async:false,
                    success: function(data){
                        console.log("data="+data);
                        //循环得到的List集合，放入数组中
                        $.each(data,function(index,obj){
                            validate_date_Array[index]=obj.toString();
                        });
                    }
                });
                console.log("---1---"+this.value);
                $(".bookEndTime").val($(this).val());
                WdatePicker({
                    el:this,
                    opposite:false,//如果不设置则disabledDates参数中的值会是“无效日期”
                    disabledDates:validate_date_Array,//绑定数组
                    minDate:'#F{$dp.$D(\'pre\')||\'%y-%M-{%d+1}\'}'
                });
            });

        });
    </script>
<style>
    body{
        padding-top: 50px;
        padding-bottom: 50px;
        position:relative;
    }
    a{
        color: black;
    }

    #bignav{
        display: none;
    }
    .content-left{
        float: left;
         width: 50%;
         margin-left: 200px;
    }
     .content-left table tr{
        height: 50px;
        font-size: 18px;
    }
    .content-left .content-detail{
        margin-top: 100px;
    }
    .content-right{
        background: white;
        float: left;
        width: 30%;
        height: 450px;
        margin: 100px 20px 20px 40px;
        border: 1px solid #d2d2d2;
    }
    .content-right .date-style{
        height: 35px;
        border: 0px;
        line-height: 35px;
        text-align: center
    }

    .check-all-photos{
        clear:both;
        border: 1px solid black;
        width: 150px;
        height: 50px;
        top:-60px;
        left:89%;
        background: white;
        text-align: center;
        padding-top: 15px;
        position: relative;
        border-radius: 10px;
        cursor: pointer;
    }
    .may-like{
        width:80%;
        height:300px;
        margin:auto;
    }
    .may-like .content-text{
        font-size: 16px;
        height: 45px;
        margin-top: 10px;
        overflow : hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
    }
    .may-like .img-content {
        cursor: pointer;
        float: left;
        margin-left: 50px;
        width: 300px;
    }
    .may-like .img-content img{
        width: 300px;
        height: 200px;
    }
    .house-photos img{
        width: 100%;
        height: 100%;
    }
    #footer ul{
        list-style: none;
    }
</style>
</head>

<body data-spy="scroll" data-target="#myNavbar" data-offset="50">
<header class="main_menu_area" id="main_menu_area" style="background: rgba(144, 144, 144,0.8);">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="<%=request.getContextPath()%>/house/houseList" style="height:100%;position: relative;top:-10px;"><img src="../../img/logo11.png" alt=""></a>
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
                            <div style=" width:50px;height:50px;float: left;border-radius: 50%;position: relative;top:5px;left: 10px;">
                                <img src="../../${USER.headPhoto}" class="img-circle" style="width: 100%;height: 100%;" >
                            </div>
                        </a>
                        <span style="margin-left: 30px;"><a href="<%=request.getContextPath()%>/quit">退出</a></span>
                    </li>
                </c:if>
            </ul>
        </div>
    </nav>
</header>
    <div class="house-photos" style="border: 1px solid black; cursor: pointer;position: relative;top:20px;">
        <div style="float: left;width: 60%;height: 450px;background: black">
            <img src="../../${photos['first']}" alt="" class="img-remove">
        </div>
        <div style="float: left;width: 40%;height: 450px;">
            <div style="float: left;width: 50%;height: 450px;">
                <div style="width: 100%;height: 225px;background: black">
                    <img src="../../${photos['second']}" alt="" class="img-remove">
                </div>
                <div style="width: 100%;height: 225px;background: black">
                    <img src="../../${photos['three']}" alt="" class="img-remove">
                </div>
            </div>
            <div style="float: left;width: 50%;height: 450px;">
                <div style="width: 100%;height: 225px;background: black">
                    <img src="../../${photos['four']}" alt="" class="img-remove">
                </div>
                <div style="width: 100%;height: 225px;background: black">
                    <img src="../../${photos['five']}" alt="" class="img-remove">
                </div>
            </div>
        </div>
    </div>
    <div class="h4 check-all-photos">
        <form action="<%=request.getContextPath()%>/houseImg/viewPhotos" method="post">
            <input type="hidden" name="title" value="${houseBasic.title}">
            <input type="hidden" name="houseId" value="${houseId}">
            <input type="submit" class="btn" style="outline:none;box-shadow:none;border:0px;background:white;font-weight: bold; font-size: 20px; color: black;position: relative;top:-12px;" value="全部图片"/>
        </form>
    </div>
    <div class="house-detail" style="clear: both;">
        <nav class="navbar navbar-inverse" id="bignav">
            <div class="container-fluid">
                <div class="navbar-header" >
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <div>
                    <div class="collapse navbar-collapse" id="myNavbar">
                        <ul class="nav navbar-nav" style="margin-left: 200px;">
                            <li><a href="#detail">详情</a></li>
                            <li><a href="#evaluate">评价</a></li>
                            <li><a href="#date">可定日期</a></li>
                            <li><a href="#location">位置</a></li>
                            <li><a href="#mustInfo">须知</a></li>
                            <li><a href="#host">房东</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>

        <div class="content-left">
            <div id="detail" class="content-detail">
                <div class="detail">
                    <br>
                    <h4> <b>详情</b></h4>
                    <h6>${houseBasic.province}·整套公寓</h6>
                    <h2>
                        <b>${houseBasic.title}</b>
                    </h2>
                    <div class="row">
                        <div class="col-lg-2">
                            <img src="../../img/small-logo3.png">
                            ${houseBasic.houseResource.roomNumber}间卧室
                        </div>
                        <div class="col-lg-2">
                            <img src="../../img/small-logo1.png">
                            ${houseBasic.houseResource.bedNumber}张床
                        </div>
                        <div class="col-lg-2">
                            <img src="../../img/small-logo2.png">
                            1个卫生间
                        </div>
                        <div class="col-lg-2">
                            <img src="../../img/small-logo4.png">
                            最多住${houseBasic.houseResource.maxRoomer}人
                        </div>
                    </div>
                </div>
                <hr class="divider">
                <div>
                    <div>
                        <div style="width: 70px;height: 70px; border-radius: 50%;float: left">
                            <img src="../../${houseBasic.user.headPhoto}" alt="头像" style="width: 100%;height: 100%;" class="img-circle">
                        </div>
                        <div class="row" style="float: left;margin-left: 30px;">
                            <div  style="float:left;padding-left: 15px;">
                                <h4><b>房东：${houseBasic.user.name}</b></h4>
                            </div>
                            <div  style="float:left;padding-left: 15px;">
                                <form action="<%=request.getContextPath()%>/house/communicateHost" method="post">
                                    <input type="hidden" name="hostId" value="${houseBasic.user.id}">
                                    <input type="hidden" name="houseId" value="${houseId}">
                                    <input type="submit" class="btn" style="outline:none;border:none;box-shadow:none;background: white;font-weight: bold; font-size: 20px; color: #20b2aa;" value="联系房东"/>
                                </form>
                            </div>
                        </div>
                        <br>
                        <h5 style="position: relative;top:-30px;left:115px;clear: both"><b>共收到1111条评价·已验证</b></h5>
                    </div>
                    <br>
                    <div style="width: 85%;background: #c5c5c5;clear: both;border-radius: 10px; margin-left: 20px;position: relative;top:-20px;">
                        <p style="padding: 15px;height: 100px;">${houseBasic.introduce}</p>
                        <a href="#" style="color:#3480c1;padding-left: 10px;padding-bottom: 20px;"><b>查看更多房源介绍</b></a>
                    </div>
                </div>
                <hr class="divider">
                <table>
                    <tr>
                        <td width="30%"><b>${houseBasic.houseResource.rentType}/${houseBasic.houseResource.houseType}</b></td>
                        <td width="70%">独享整个房源，无需与房东或他人共住</td>
                    </tr>
                    <tr >
                        <td ><b>超赞房东</b></td>
                        <td >超赞房东经验丰富、评分很高，他们致力于为房客提供优质的住宿体验</td>
                    </tr>
                    <tr>
                        <td><b>入住/退房</b></td>
                        <td>入住时间 <strong>14:00后</strong> · 退房时间 <strong>12:00</strong></td>
                    </tr>
                    <tr>
                        <td><b>自主入住</b></td>
                        <td>通过智能门锁自助入住</td>
                    </tr>
                </table>
                <hr class="divider">
                <div><h5><b>设备</b></h5></div>
                <hr class="divider">
                <div class="row">
                    <div class="col-lg-12" style="height: 60px;">
                        <div style="width:60px;float:left;margin-left:40px; ">
                            <div style="height: 30px;">
                                <img src="../../img/wlan-small.png" alt="" style="width: 60%;height:100%;margin-left: 10px;">
                            </div>
                            <div style="margin-top:10px;width:60px;text-align: center">wlan</div>
                        </div>
                        <div style="width:60px;float:left;margin-left:40px; ">
                            <div style="height: 30px;">
                                <img src="../../img/chunfengji-small.png" alt="" style="width: 60%;height:100%;margin-left: 10px;">
                            </div>
                            <div style="margin-top:10px;width:60px;text-align: center">吹风机</div>
                        </div>
                        <div style="width:60px;float:left;margin-left:40px; ">
                            <div style="height: 30px;">
                                <img src="../../img/chufang-small.png" alt="" style="width: 60%;height:100%;margin-left: 10px;">
                            </div>
                            <div style="margin-top:10px;width:60px;text-align: center">厨房</div>
                        </div>
                        <div style="width:60px;float:left;margin-left:40px; ">
                            <div style="height: 30px;">
                                <img src="../../img/xifalu-small.png" alt="" style="width: 60%;height:100%;margin-left: 10px;">
                            </div>
                            <div style="margin-top:10px;width:60px;text-align: center">洗发露</div>
                        </div>
                        <div style="width:60px;float:left;margin-left:40px; ">
                            <div style="height: 30px;">
                                <img src="../../img/yushi-small.png" alt="" style="width: 60%;height:100%;margin-left: 10px;">
                            </div>
                            <div style="margin-top:10px;width:60px;text-align: center">浴室</div>
                        </div>
                        <div style="width:60px;float:left;margin-left:40px; ">
                            <div style="height: 30px;">
                                <img src="../../img/life-small.png" alt="" style="width: 60%;height:100%;margin-left: 10px;">
                            </div>
                            <div style="margin-top:10px;width:60px;text-align: center">生活用品</div>
                        </div>
                        <div style="width:60px;float:left;margin-left:40px; ">
                            <div style="height: 30px;color:#1b7d75;padding-top: 10px;">
                                <h5><b>更多>></b></h5>
                            </div>
                        </div>
                    </div>
                </div>
                <hr class="divider">
            </div>
            <div id="evaluate" class="content-detail" style="clear: both">
                <div class="evaluate">
                    <h4><b>评价</b></h4>
                    <br>
                    <h5><b>尚无评价</b></h5>
                    <h5><b>如果您选择入住此房源，便有机会为它写下第一条评价。</b></h5>
                </div>
            </div>
            <div id="date" class="content-detail">
                <div class="date">
                    <h4><b>可选日期</b></h4>
                    <br>
                    <div id="date-show" class="date"></div>
                    <script>
                        WdatePicker({eCont:'date-show',minDate:'%y-%M-{%d+1}',doubleCalendar:true,dateFmt:'yyyy-MM-dd',disabledDates:['2019-05-30']})
                    </script>
                </div>
            </div>
            <div id="location" class="content-detail">
                <div class="location">
                    <h4><b>位置</b></h4>
                    <br>
                    <h5><b>${houseBasic.town}·${houseBasic.city}·${houseBasic.province}</b></h5>
                    <br>
                    <c:if test="${travel!=null}">
                        <h4><b>出行信息</b></h4>
                        <c:forEach items="${travel}" var="info">
                            <p style="padding-left: 10px;font-size: 16px;">${info}</p>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
            <div id="mustInfo" class="content-detail">
                <div class="mustInfo">
                    <h4><b>须知</b></h4>
                    <table>
                        <tr>
                            <td width="30%"><b>基本要求</b></td>
                            <td width="70%">不适合儿童（0-12岁）及宠物入住，或不能为儿童及宠物提供安全的住宿环境<br>
                                禁止吸烟、派对或活动</td>
                        </tr>
                        <tr >
                            <td ><b>取消政策</b></td>
                            <td ><b>中等 - 预订确认后48小时之内可免费取消</b></td>
                        </tr>
                        <tr>
                            <td><b>交易提示</b></td>
                            <td>为了保护您的账号隐私和付款安全，请不要相信其它任何平台的折扣或礼金券代订，并始终在爱彼迎站内转账和交流。</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="host" class="content-detail">
                <div class="host">
                    <div class="row" style="width: 20%;">
                        <div class="col-lg-6">
                            <h4><b>${houseBasic.user.name}</b></h4>
                        </div>
                        <div class="col-lg-4">
                            <form action="<%=request.getContextPath()%>/house/communicateHost" method="post">
                                <input type="hidden" name="hostId" value="${houseBasic.user.id}">
                                <input type="hidden" name="houseId" value="${houseId}">
                                <input type="submit" class="btn" style="outline:none;border:none;box-shadow:none;background: white;font-weight: bold; font-size: 20px; color: #20b2aa;" value="联系房东"/>
                            </form>
                        </div>
                    </div>
                <h5><b>中国·注册时间：2019年05月·已验证</b></h5>
                <br>
                <h4>自我介绍</h4>
                </div>
            </div>
        </div>
        <div class="content-right" id="content-right">
            <div class="content" style="margin:10px 20px;">

                    <div>
                        <h3><b>￥${houseBasic.houseResource.price}元  </b><small>每晚</small></h3>
                    </div>
                    <div>
                        <span><img src="../../img/small-bizhi.png" alt="" style="width: 15px;height: 15px;"></span>
                        <span>满7天${houseBasic.houseResource.sevenDiscount}折优惠</span>&nbsp &nbsp &nbsp &nbsp &nbsp
                        <span><img src="../../img/small-bizhi.png" alt="" style="width: 15px;height: 15px;"></span>
                        <span>满28天${houseBasic.houseResource.monthDiscount}折优惠</span>
                    </div>
                    <hr class="divider">
                    <div>
                        <h5>日期</h5>
                        <div style="border: 1px solid #d4d4d4;height: 37px;border-radius: 5px;">
                            <div style="float: left;width: 42%;">
                                <input id="pre"  type="text" class="date form-control date-style" placeholder="入住日期"
                                       onclick="WdatePicker({position:{left:0,top:0}})"/>
                            </div>
                            <div style="float: left;border-top:1px solid #f3f3f3">
                                <span class="glyphicon glyphicon-minus" style="font-size: 18px;margin-top: 8px;color:#d4d4d4"></span>
                                <span class="glyphicon glyphicon-arrow-right" style="margin-left:-10px;font-size: 18px;margin-top: 8px;color:#d4d4d4"></span>
                            </div>
                            <div style="float: left;width: 50%;">
                                <input id="next"  type="text"  class=" date form-control date-style" placeholder="退房日期 "
                                       onclick="WdatePicker({position:{left:0,top:0}})"/>
                            </div>
                        </div>
                    </div>

                    <div style="clear: both;margin-top: 30px;">
                        <h5>房客</h5>
                        <select class="form-control" name="rentNum">
                            <c:forEach begin="1" end="10" var="s">
                                <option value="${s}">${s}人</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div style="margin-top: 50px">
                        <form action="<%=request.getContextPath()%>/order/toAdd" method="post" class="form-group">
                            <input type="hidden" name="orderHouseId"  value="${houseBasic.id}">
                            <input type="hidden" name="orderUserId"  value="${USER.id}">
                            <input type="hidden"  id="orderId" name="orderId"  value="">
                            <input type="hidden" name="price"  value="${houseBasic.houseResource.price}">
                            <input type="hidden" class="bookStartTime" name="startTime"  value="">
                            <input type="hidden" class="bookEndTime" name="endTime"  value="">
                            <input type="submit" class="btn btn-danger form-control"></input>
                        </form>
                    </div>
                    <div class="row" style="margin-top: 20px;">
                        <div class="col-lg-8">
                            <div style="font-size:16px;padding-top: 10px;padding-left: 25px;"><b>这个房源是很多人的心仪之所。</b></div>
                        </div>
                        <div class="col-lg-4" >
                            <img src="../../img/dengpao.png" alt="">
                        </div>

                    </div>

            </div>
        </div>
        </div>
    <div class="may-like" style="clear: both">
        <br><br><h3 style="margin-left: 30px;"><b>您可能还喜欢</b></h3><br>
        <div class="img-content">
            <img src="../../img/ideas3.jpg" alt="" >
            <div style="display: block;width: 300px;">
                <div style="font-size: 12px;margin-top: 10px;"><b>整套公寓·重庆</b></div>
                <div class="content-text"><b>【舟影山居】——北欧麋鹿风格,最佳景观视野☆南滨路江边赏解放碑&渝中半岛夜景｡江景豪华大床房</b></div>
                <div style="margin-top: 10px;"><b>￥618</b></div>
            </div>
        </div>
        <div class="img-content">
            <img src="../../img/ideas1.jpg" alt="" >
            <div style="display: block;width: 300px;">
                <div style="font-size: 12px;margin-top: 10px;"><b>整套公寓·重庆</b></div>
                <div class="content-text"><b>【舟影山居】——北欧麋鹿风格,最佳景观视野☆南滨路江边赏解放碑&渝中半岛夜景｡江景豪华大床房</b></div>
                <div style="margin-top: 10px;"><b>￥618</b></div>
            </div>
        </div>
        <div class="img-content">
            <img src="../../img/ideas2.jpg" alt="" >
            <div style="display: block;width: 300px;">
                <div style="font-size: 12px;margin-top: 10px;"><b>整套公寓·重庆</b></div>
                <div class="content-text"><b>【舟影山居】——北欧麋鹿风格,最佳景观视野☆南滨路江边赏解放碑&渝中半岛夜景｡江景豪华大床房</b></div>
                <div style="margin-top: 10px;"><b>￥618</b></div>
            </div>
        </div>
    </div>
    </div>

    <div id="footer" class="foot col-md-12">
    <div>
        <ul class="col-md-3">
            <li>九宫格</li>
            <li></li>
            <li><a href="">工作机会</a></li>
            <li><a href="">新闻</a></li>
            <li><a href="">政策</a></li>
            <li><a href="">帮助</a></li>
        </ul>
        <ul class="col-md-3">
            <li>发现</li>
            <li></li>
            <li><a href="">信任与安全</a></li>
            <li><a href="">邀请好友</a></li>
            <li><a href="">商务差旅</a></li>
            <li><a href="">旅行指南</a></li>
        </ul>
        <ul class="col-md-3">
            <li>出租</li>
            <li></li>
            <li><a href="">为什么要出租</a></li>
            <li><a href="">待客之道</a></li>
            <li><a href="">房东义务</a></li>
            <li><a href="">开展体验</a></li>
        </ul>
        <ul class="col-md-3">
            <li>其他</li>
            <li></li>
            <li><a href="">联系我们</a></li>
            <li><a href="">条款</a></li>
            <li><a href="">隐私政策</a></li>
            <li><a href="">网站地图</a></li>
        </ul>
    </div>
    <div class="col-md-10 col-md-push-1 record">
        <img src="../../img/logo2.png" alt="">
        <div>
            <span>京ICP备00000000号-0 京ICP证 666666号</span>
            <img src="../../img/police.png" alt="">
            <span>京公网安备 11111111111111号 九宫格网络（212）有限公司</span>
            <p>© 2019 Sudoku, Inc. All rights reserved.</p>
        </div>
    </div>
</div>
</body>
</html>
<script>
    $(document).ready(function () {
        $(".house-photos").hover(function () {
            $(".img-remove").hover(function () {
                $(this).css("opacity","1.0");
                $(this).css("background","transparent");
            },function () {
                $(".img-remove").css("opacity","0.7");
                $(".img-remove").css("background","transparent");
            });
        },function () {
            $(".img-remove").css("opacity","1.0");
            $(".img-remove").css("background","transparent");
        });

        //订单编号=日期+四位随机数，例如：20190417 001 899 1234（2019年4月17日，后四位随机数）

        var date=new Date();
        var year=date.getFullYear().toString().substring(0,4);
        var month=parseInt(date.getMonth().toString())+1;
        var day=date.getDate().toString();
        var userId=String(${USER.id});

        var houseId=String(${houseId}).substring(6);

        console.log(PrefixInteger(userId,3));
        var orderId=mathForm(year)+mathForm(month)+mathForm(day)+PrefixInteger(userId,3)+899+houseId;
        $("#orderId").val(orderId);
        console.log("-----"+orderId);

    })

    function PrefixInteger(num, length) {
        return (Array(length).join('0') + num).slice(-length);
    }
    function mathForm(content){
        var value=(Array(2).join(0)+content).slice(-2);
        return value;
    }
    $(window).scroll(function(){
        if($(this).scrollTop() >65){
            $("#main_menu_area").css({display:"none"})
        }
        else{
            $("#main_menu_area").css({display:"block"})
        }
        var bignav =$("#bignav");      //获取到导航栏
        if($(this).scrollTop() >550){  //当滚动距离大于500px时执行下面的东西
            //$("#main_menu_area").css({display:"none"})
            $("#bignav").css({display:"block"})
            bignav.css({
                width:"100%",
                position:"fixed",
                top:0,
                zIndex:9999
            });
        }
        else{
            $("#bignav").css({display:"none"})
            //$("#main_menu_area").css({display:"block"})
        }
    });
</script>
