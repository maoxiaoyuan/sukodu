<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://code.com/c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${houseBasic.title}</title>
    <link rel="stylesheet" href="../css/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="../js/jquery-3.3.1.min.js" charset="utf-8"></script>
    <script src="../js/bootstrap.min.js"></script>
    <![endif]-->
    <script src="../My97DatePicker/WdatePicker.js"></script>
    <style>
       nav ul{
           height: 80px;
          position: relative;
           left: 30px;
       }
       nav ul li{
            height: 80px;
        }
        nav img , .container img{
            width:100%;
            height: 100%;
        }
        .container ul{
            margin-top: 10px;
            margin-bottom: 10px;
        }
        .container ul li{
            height: 30px;
            padding-top: 10px;
        }

        a{
            text-decoration: none;
            color: #20b2aa;
        }
        a:hover{
            text-decoration-line: none;
        }
    </style>

</head>

<body>

<nav>
        <a href="<%=request.getContextPath()%>/house/detail/${houseId}">
            <ul class="list-inline list-unstyled" style="height: 40px;">
                <li style="height:60px;width: 60px;margin-top: 10px;" ></li>
                <li>
                    <span  class="glyphicon glyphicon-chevron-left"></span>
                </li>
                <li>返回房源详情</li>
            </ul>
        </a>
    </nav>
<br>
<hr>

<div class="container">
    <div class="comm-left" style="width: 60%;float: left;">
        <div class="row">
            <div class="col-lg-10">
                <h3><b>联系${houseBasic.user.name}</b></h3>
                <p>${houseBasic.user.name}常会在一个小时内回复</p>
            </div>
            <div class="col-lg-2" style="height: 75px;">
                <img src="../${houseBasic.user.headPhoto}" alt="">
            </div>
        </div>
        <hr>
        <div class="row">
            <h3><b>该房源概况</b></h3>
            <br>
            <h4><b>前往房源</b></h4>
            <ul>
                <li>付费停车位</li>
                <li>此房源的入住时间从14:00开始，退房时间为 12:00</li>
            </ul>
            <br>
            <h4><b>房源详情及守则</b></h4>
            <ul>
                <li>禁止吸烟. 不允许携带宠物. 不允许举办派对和活动.</li>
            </ul>
            <br>
            <h4><b>价格和可订状态</b></h4>
            <ul>
                <li>住宿天数超过一周的预订可享10%的折扣。</li>
                <li>取消政策 - 中等：限定期限内全额退款4
                </li>
            </ul>

        </div>
        <hr>
        <div class="row">
            <h4><b>还想咨询九宫格什么问题吗？</b></h4>
            <textarea style="resize: none;width: 70%;height: 100px;" placeholder="请在此处留言"></textarea>
            <br>
            <input type="submit" value="发送消息" class="btn" style="background:  #20b2aa">
        </div>
    </div>
    <div class="comm-right" style="float: left;border:1px solid #d4d4d4;margin-left: 65px;" >
        <div style="width: 385px;height: 330px; padding: 20px ">
            <div class="row" style="height: 80px;">
                <div class="col-lg-7">
                    <h5><b>整套公寓</b></h5>
                    <h4><b>￥249</b><small> 每晚</small></h4>
                    <div>评价</div>
                </div>
                <div class="col-lg-4">
                    <img src="../${houseBasic.user.headPhoto}" alt="">
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-sm-4">
                    <h5 style="padding-left: 10px;"><b>入住日期</b></h5>
                    <input id="pre" type="text" class="form-control date-style" placeholder="添加日期"
                           onclick="WdatePicker({minDate:'%y-%M-%d',maxDate:'#F{$dp.$D(\'next\')}',position:{left:0,top:0},disabledDates:['2019-05-12','2019-05-13','2019-05-14','2019-05-27','2019-05-28']})"/>
                </div>
                <div class="col-sm-4">
                    <h5 style="padding-left: 10px;"><b>退房日期</b></h5>
                    <input id="next"  type="text"  class="form-control date-style" placeholder="添加日期 "
                           onclick="WdatePicker({minDate:'#F{$dp.$D(\'pre\')}',position:{left:0,top:0},disabledDates:['2019-05-12','2019-05-13','2019-05-14','2019-05-27','2019-05-28']})"/>
                </div>
                <div class="col-sm-4">
                    <h5 style="padding-left: 10px;"><b>房客人数</b></h5>
                    <select class="form-control">
                        <option>1人</option>
                        <option>2人</option>
                        <option>3人</option>
                    </select>
                </div>
            </div>
            <hr>
            <div class="row">
                <h5 style="color:#a2a2a2;padding-left: 15px;">添加日期，以查询是否可订</h5>
            </div>
        </div>
    </div>
</div>
<div style="clear: both"></div>
<jsp:include page="footer.jsp"/>

</body>
</html>
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>

