<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://code.com/c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>提交审核</title>
    <link rel="stylesheet" href="css/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/house/houseBasicInfo.css">
    <script  src="js/jquery-3.3.1.min.js" charset="utf-8"></script>
    <script src="js/bootstrap.min.js"></script>
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
    </style>
</head>

<body>
<jsp:include page="../top.jsp"/>
<div class="content">
    <div class="container">
        <ul class="list-unstyled list-inline"style="background:#20b2aa;height:70px;width:100%;margin-left: -16px;" >
            <li class="list-group-item li_style" style="position: relative;top:-132px;background: #20b2aa;">
                <span><img src="img/add1.png" alt="基本信息" style="padding-left: 10px;width: 60px;height: 50px;"></span>
                <span class="h3" style="padding-left: 10px;margin-top: 5px;">基本信息</span>
            </li>
            <li class="list-group-item li_style" style="background:#20b2aa;">
                <ul class="list-unstyled list-inline">
                    <li class="glyphicon glyphicon-chevron-right li_font_style" style="position: relative;top:-40px;"></li>
                    <li class="h3 li_content_style">规格信息</li>
                    <li><img src="img/add2.png" alt="规格信息"class="li_img_style"/></li>
                </ul>
            </li>
            <li class="list-group-item li_style"  style="background: #20b2aa;">
                <ul class="list-unstyled list-inline">
                    <li class="glyphicon glyphicon-chevron-right li_font_style" style="position: relative;top:-40px;"></li>
                    <li class="h3 li_content_style">详细信息</li>
                    <li><img src="img/add3.png" alt="详细信息" class="li_img_style"/></li>
                </ul>
            </li>
            <li class="list-group-item li_style" style="background:#20b2aa;border: 0px;">
                <ul class="list-unstyled list-inline">
                    <li class="glyphicon glyphicon-chevron-right li_font_style" style="position: relative;top:-40px;"></li>
                    <li class="h3 li_content_style">上传图片</li>
                    <li><img src="img/add4.png" alt="上传图片" class="li_img_style"/></li>
                </ul>
            </li>
            <li class="list-group-item li_style"style="width:200px;position: relative;left:32px;background:rgba(27,125,117,1.0);">
                <ul class="list-unstyled list-inline">
                    <li class="glyphicon glyphicon-chevron-right li_font_style" style="position: relative;top:-40px;"></li>
                    <li class="h3 li_content_style">提交审核</li>
                    <li><img src="img/add5.png" alt="提交审核" class="li_img_style"/></li>
                </ul>
            </li>
        </ul>
        <div class="row" style="width:70%;margin-left: 130px;" >
            <h3 style="margin-left: 350px;">提交审核</h3>
            <hr>
        </div>
        <form action="/sudoku/submit" method="post" onsubmit="return check()">

            <div class="row" style="overflow-y:auto;border: 1px solid #d2d2d2;margin-left: 20px;width: 90%;height:800px; font-family: '黑体'">
                <h2 style="text-align: center"><b>九宫格民宿平台房东协议承诺书</b></h2>
                <div style="padding: 20px; font-size: 18px;">
                    <h3> 一、房源的发布</h3>
                    <div style="padding: 0 25px;">
                        <p>1、提交审核之前，您需认真阅读本协议及九宫格民宿相关条款规则，以便全部了解九宫格民宿与您的权利及责任义务。</p>
                        <p>2、提交房源时，您需按照九宫格民宿房源发布规则及标准填写房屋的相关信息，并提交至九宫格民宿进行审核。</p>
                        <p>3、九宫格民宿会将房屋的审核结果通过电子邮箱或客户端消息的方式发送至您在注册时所填写的邮箱中。如未通过审核，您可根据九宫格民宿的审核拒绝原因或房源信息修改建议，修改后重新提交发布申请。</p>
                        <p>4、提交审核之后，您需要保持所预留的手机随时畅通，及时登陆九宫格民宿平台查看审核反馈情况，并及时通过九宫格民宿提供的消息功能进行相关咨询回复，使得房源发布顺利进行，避免纠纷的产生。</p>
                        <p>5、为保障您房源收益的最大化，您在九宫格民宿发布房源后，将确认您已授权九宫格民宿可将您发布的房源再行发布至第三方平台。</p>
                    </div>
                    <h3 style="padding-top:30px;">  二、房间信息录入及维护</h3>
                    <div style="padding: 0 25px;">
                        <p>1、您必须确保在九宫格民宿平台提供的房源所在城市、周边环境等信息真实有效，以便房客准确了解房源的所在地及周边环境信息。一旦出现与事实不符的情况，所有责任归房东所有。</p>
                        <p>2、您必须确保在九宫格民宿平台提供的房间照片，包括但不限于房屋环境（含：卧室、浴室、厨房、客厅、院落等）、配套设施、周边环境的照片真实有效。</p>
                        <p>3、您必须按要求准确填写房间描述等信息，以确保交易顺利进行。</p>
                        <p>4、您可以自主设定房屋的每晚基础价格、7天以上折扣、30天以上折扣，并按照当地货币选择货币符号及货币代码。</p>
                        <p>5、您可以根据房屋的条件及个人情况制定使用规则，并以此作为依据。</p>
                        <p>6、您必须在提交房源时输入房屋可住人数和可预订日期，系统会根据您提供的数据设置房客是否可以预约看房，请您谨慎选择预付比例。</p>
                        <p>7、您可自主选择制定交易规则，包括全额退款条件、违约扣款额度的设定。一经设置，您必须保证严格执行，否则您将承担由此造成的全部后果及法律责任。此规则涉及到您与房客的个人利益，请您谨慎选择。</p>
                        <p>8、九宫格民宿不提供发票和收据。房东可根据自身实际情况选择是否为房客提供发票或收据，并在提交房源时在房源描述中说明。</p>
                        <p>9、若您注明提供发票或收据却不能满足时，您需与房客协商解决，九宫格民宿不对此行为及其后果承担任何责任。</p>
                    </div>
                    <h3 style="padding-top:30px;">三、订单处理与接待服务</h3>
                    <div style="padding: 0 25px;">
                        <p>1、房客预订您发布的房源后，九宫格民宿平台会通过客户端消息或电子邮箱提醒您，您需要到您的房源订单管理中确认是否接受房客的预订。</p>
                        <p>2、您需在24小时内确认是否接受订单，如果超时未处理，则此订单自动过期作废。</p>
                        <p>3、订单一旦确认，您必须为房客保留预订时间段的房间，确保房客按时入住。</p>
                        <p>4、为保障您的住家安全，在产生纠纷时有据可查，九宫格民宿规定：在订单确认之前，房东和房客只能通过九宫格民宿提供的在线交流工具沟通，九宫格民宿禁止双方在交易达成前通过任何第三方工具交流，包括但不限于：手机、固话、邮件、其他即时通讯工具，房东不应在交流中透露具体地址。</p>
                        <p>5、订单确认后，您可在订单列表中查看房客的联系电话及相关信息，但您必须保证，在未经过房客书面授权以前，您不能在公开场合或网络公布对方的一切信息。</p>
                        <p>6、您需要在房客入住之前与其联系，提供房屋的详细地址及交通路线，确保房客可以顺利抵达目的地。</p>
                        <p>7、若房客抵达后认为房间实际情况与您发布的信息不符并向九宫格民宿客服投诉时，您同意并授权九宫格民宿根据事实判定责任方并对投诉进行处理，提出解决建议和办法；房客也可与您协商或通过法律途径解决争议。您同意，您与房客线下达成的承诺和协议与九宫格民宿无关，九宫格民宿不对您的承诺与协议作出任何解释和不承担任何连带责任。</p>
                        <p>8、您同意，任何脱离一家民宿达成的线下交易，如在房屋使用过程中发生任何意外情况，房客在屋内的任何行为均属于您与房客的自主行为，对此引发的任何性质的纠纷应当通过法律途径自行解决，九宫格民宿不负有任何性质的协助义务或承担任何形式的责任。</p>
                    </div>
                    <h3 style="padding-top:30px;">四、房款与结算</h3>
                    <div style="padding: 0 25px;">
                        <p>1、房款（指房屋每晚住宿的价格）由房东自行制定，可选择当地的货币，并显示在九宫格民宿房源页面上。此价格包含：房间住宿费，房东提供的必要的清洁费用，及平台收取的技术服务费用，不含入住押金、额外服务和您与房客约定的其他费用。</p>
                        <p>2、房客申请预订，房东接受订单后，房客需支付100%的订单房款，该笔房款将会冻结在房东的九宫格民宿钱包内。待房客入住后，每入住一天，解冻一天的房款，直至入住完成全部房款解冻。房东可随时提现解冻的房款，根据房东所选择的收款机构的规定，在5-7个工作日内到账，货币为房东自主选择的房款币种。</p>
                        <p>3、房东应准确填写真实收款信息，以便结算款及时到账。</p>
                        <p>4、房东可以自主设定退订政策，以房东设置的入住时间为准，可以规定全额退款须满足的提前退订的天数。若不符合全额退款条件，则无论房客未入住，或者入住后提前离开，房客均须支付一定天数的房款作为违约金，违约金额由房东自主设定，但实际金额以房客未入住天数的房款为上限。</p>
                        <p>5、您与房客约定的除房款外的其他额外费用，均与九宫格民宿无关，九宫格民宿不对此承担任何责任。</p>
                    </div>
                    <h3 style="padding-top:30px;"> 五、入住点评</h3>
                    <div style="padding: 0 25px;">
                        <p>1、入住完成后，房东和房客可以相互进行点评（评星和评论），点评的内容和数量将成为今后房东和房客相互筛选的重要参考。</p>
                        <p>2、房东和房客不得在点评中使用暴力、色情、辱骂、诽谤等攻击性词语，否则九宫格民宿有权删除该点评。</p>
                        <p>3、点评的版本归九宫格民宿所有，未经九宫格民宿书面同意，房东不得以转载、复制、传播等任何形式在非九宫格民宿的任何第三方平台使用。</p>
                        <p>4、房东不得诱导他人作出不真实的点评，不得采取不正当方式提升自身的信用，九宫格民宿有权对虚假点评和相关当事人进行处理，包括但不限于：删除点评、下线房屋、屏蔽账号等。</p>
                    </div>
                    <div class="checkbox" style="margin-top: 30px;">
                        <lable style=" margin-left: 50px;">
                            <input type="checkbox" style="height: 15px;width: 15px;"/>
                        </lable>
                        <span class="h5" style="position: relative;top: 3px;"><b>我已阅读，并同意该协议</b></span>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-5">
                    <label class="control-label form-inline">
                        <a  href="<%=request.getContextPath()%>/houseImg/toAdd" type="button" class="btn btn-default btn-danger">RETURN</a>
                    </label>
                </div>
                <div class="col-lg-7" >
                    <label class="control-label form-inline">
                        <input type="submit" class="btn btn-default btn-info" value="SUBMIT"/>
                    </label>
                </div>
            </div>
        </form>
    </div>
</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>
<script>
    function check(){
        if ($("input[type='checkbox']").prop("checked")) {
            return true;
        }else{
            alert("请先同意《九宫格民宿平台房东协议承诺书》");
            return false;
        }
    }
</script>