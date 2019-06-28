<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://code.com/c" %>
<%@taglib prefix="fn" uri="http://code.com/fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://code.com/fmt" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>订单界面</title>
    <link rel="stylesheet" href="../css/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="../js/jquery-3.3.1.min.js" charset="utf-8"></script>
    <script src="../js/bootstrap.min.js"></script>
</head>
<style>
    .content-left{
        width:65%;
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
    .content-left .row{
        margin-top: 10px;
    }

</style>
<body>
<jsp:include page="top.jsp"/>
<div class="container" style="margin-top: 100px;">
    <form action="<%=request.getContextPath()%>/order/add">
        <div class="content-left" style="float:left;width: 55%; margin-left:10px; ">
            <div>
                <h3><b>入住信息</b></h3>
                <br>
                <div class="row" style="margin-top:10px; ">
                    <div class="col-lg-2">
                        住宿时间
                    </div>
                    <div class="col-lg-8">
                        <input type="text" class="form-control"  value="${startTime}" style="text-align: center;width: 120px;height:30px;float: left"/>
                        <span style="color: #c6c6c6;float: left;margin: 0px 5px;">——</span>
                        <input type="text" class="form-control" value="${endTime}" style="text-align: center;width: 120px;height:30px;float:left;"/>
                    </div>
                </div>
                <div class="row" style="clear: both">
                    <div class="col-lg-2">
                        入住人数
                    </div>
                    <div class="col-lg-3">
                        <select class="form-control" style="width: 120px;color: #b1b1b1;height: 30px;font-size: 12px;">
                            <option value="${houseOrder.rentNum}">${houseOrder.rentNum}1位房客</option>
                        </select>
                    </div>
                    <div class="col-lg-3" style="position: relative;top:5px;left: -30px;">
                        最多入住2人
                    </div>
                </div>
            </div>
            <hr>
            <div>
                <h3><b>个人信息</b></h3>
                <br>
                <div class="row">
                    <div class="col-lg-2">
                        <p>真实姓名</p>
                    </div>
                    <div class="col-lg-8">
                        <p>${USER.name}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-2">
                        <p>身份证号</p>
                    </div>
                    <div class="col-lg-8">
                        <p>${USER.idNumber}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-2">
                        <p>手机号</p>
                    </div>
                    <div class="col-lg-8">
                        <p>${USER.phone}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-2">
                        <p>电子邮箱</p>
                    </div>
                    <div class="col-lg-8">
                        <p>${USER.email}</p>
                    </div>
                </div>
            </div>
            <hr>
            <div>
                <h3><b>和房东打个招呼</b></h3>
                <br>
                <h5>向${USER.name}介绍一下自己，以及此次旅行的目的</h5>
                <textarea style="width:100%;height:100px; padding: 10px;text-indent: 20px;" placeholder="你好，很期待入住您的房源！"></textarea>
            </div>
            <hr>
            <div>
                <h3><b>取消政策</b></h3>
                <br>
                <p style="padding-left: 20px;">48小时内免费取消预订,预订确认48小时之后，在7日之内取消预订可获得全额退款</p>
            </div>
        </div>
        <div class="content-right" style="float: left;width: 35%;margin-left: 80px;">
            <div class="content" style="margin:10px 20px;">
                <div style="width: 90%;height: 200px;">
                    <img src="../${img['first']}" alt="" style="height: 100%;width: 100%;">
                </div>
                <div>
                    <div class="h3" style="height: 50px; overflow : hidden; text-overflow: ellipsis; display: -webkit-box;-webkit-line-clamp: 2;  -webkit-box-orient: vertical;">${house.title}</div>
                    <h4 style="margin-top: 10px;">￥<fmt:formatNumber type="number" value="${price}" pattern="0.00" maxFractionDigits="2"></fmt:formatNumber>元</h4>
                </div>
                <hr class="divider">
                <div class="row" style="font-size: 20px;">
                    <div class="col-lg-3" >总价</div>
                    <div class="col-lg-4"></div>
                    <div class="col-lg-5">￥<fmt:formatNumber type="number" value="${price*days}" pattern="0.00" maxFractionDigits="2"></fmt:formatNumber>元</div>
                </div>
            </div>
        </div>
        <div style="clear: both">
            <input type="hidden" name="orderHouseId"  value="${houseOrder.orderHouseId}">
            <input type="hidden" name="orderUserId"  value="${USER.id}">
            <input type="hidden" name="orderId"  value="${houseOrder.orderId}">
            <input type="hidden" name="totalPrice"  value="<fmt:formatNumber type="number" value="${price*days}" pattern="0.00" maxFractionDigits="2"></fmt:formatNumber>">
            <input type="hidden"  name="startTime"  value="${startTime}">
            <input type="hidden"  name="endTime"  value="${endTime}">
            <input type="hidden"  name="rentNum"  value="1">
            <input type="submit" class="btn  btn-danger form-control" value="提交订单" style="width: 50%;margin-top: 30px; margin-left: 10px;"/>
        </div>
    </form>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
