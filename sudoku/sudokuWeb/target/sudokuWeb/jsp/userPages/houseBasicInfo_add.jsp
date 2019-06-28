<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://code.com/c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>房屋基本信息</title>
    <link rel="stylesheet" href="../css/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script  src="../js/jquery-3.3.1.min.js" charset="utf-8"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            $.ajax({
                "url":"<%=request.getContextPath()%>/city/getCitys",
                "type":"get",
                "data":{"pid":"1"},
                "dataType":"json",
                "success":function (json) {
                    for (var i=0;i<json.length;i++){
                        var city=json[i];
                        $("#province").append("<option value='"+city.id+"'>"+city.cityName+"</option>");
                    }

                }
            });

            $("#province").on("change",function () {
                var pid=$(this).val();
                if (pid ==0) {
                    $("#city>option").remove();
                    $("#city").append("<option value='0'>"+"— —请选择市— —"+"</option>");
                    $("#town>option").remove();
                    $("#town").append("<option value='0'>"+"— —请选择区/县— —"+"</option>");
                }else{
                    $.ajax({
                        "url":"<%=request.getContextPath()%>/city/getCitys",
                        "type":"get",
                        "data":{"pid":pid},
                        "dataType":"json",
                        "success":function (json) {
                            $("#city>option").remove();
                            $("#city").append("<option value='0'>"+"— —请选择市— —"+"</option>");
                            $("#town>option").remove();
                            $("#town").append("<option value='0'>"+"— —请选择区/县— —"+"</option>");
                            for (var i=0;i<json.length;i++){
                                var city=json[i];
                                $("#city").append("<option value='"+city.id+"'>"+city.cityName+"</option>");
                            }
                        }
                    })
                }
            });
            $("#city").on("change",function () {
                var pid=$(this).val();
                if (pid == 0){
                    $("#town>option").remove();
                    $("#town").append("<option value='0'>"+"— —请选择区/县— —"+"</option>");
                }else{
                    $.ajax({
                        "url":"<%=request.getContextPath()%>/city/getCitys",
                        "type":"get",
                        "data":{"pid":pid},
                        "dataType":"json",
                        "success":function (json) {
                            //console.log(json);
                            $("#town>option").remove();
                            $("#town").append("<option>"+"— —请选择区/县— —"+"</option>");
                            for (var i=0;i<json.length;i++){
                                var city=json[i];
                                $("#town").append("<option value='"+city.id+"'>"+city.cityName+"</option>");
                            }
                        }
                    })
                }
            });
        });
    </script>
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
        .subhead{
            width: 65%;
            font-size: 15px;
            margin: auto;
        }
        .file-box{
            display: inline-block;
            position: relative;
            padding: 3px 5px;
            overflow: hidden;
            color:#fff;
            top:30px;
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
        .upload_photo{
           border:1px solid  #20b2aa;
            color:#20b2aa;
            width:120px;
            height:40px;
            line-height: 40px;
            text-align: center;
            border-radius: 5px;
        }
        .photo{
            width:100px;
            height:100px;
            margin: 10px;
        }
    </style>
</head>

<body>
<jsp:include page="top.jsp"></jsp:include>
<div class="content">
    <div class="container">
        <ul class="list-unstyled list-inline"style="background: #20b2aa;height:70px;width:100%;margin-left: -16px;" >
            <li class="list-group-item li_style" style="position: relative;top:-132px;background: rgba(27,125,117,0.9);">
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
            <h3 style="margin-left: 350px;">基本信息</h3>
            <hr>
        </div>
        <form:form action="/sudoku/houseBasicInfo/add" modelAttribute="houseBasicInfo" enctype="multipart/form-data">
            <input type="hidden" name="landlordId" value="${USER.id}">
            <input type="hidden" name="id" id="houseId">
            <div class="subhead">房源地址</div>
            <div class="row form-inline">
                <select id="province"  name="province" class=" form-control" style="width: 200px;">
                    <c:if test="${houseBasicInfo.province == null}">
                         <option selected value="0">— —请选择省— —</option>
                    </c:if>
                    <c:if test="${houseBasicInfo.province != null}">
                        <option selected value="${province}">${houseBasicInfo.province}</option>
                    </c:if>
                </select>
                <select id="city" name="city" class=" form-control"  style="width: 200px;">
                    <c:if test="${houseBasicInfo.city == null}">
                        <option selected value="0">— —请选择市— —</option>
                    </c:if>
                    <c:if test="${houseBasicInfo.city != null}">
                        <option selected value="${city}">${houseBasicInfo.city}</option>
                    </c:if>
                </select>
                <select id="town"  name="town" class=" form-control"  style="width: 200px;">
                    <c:if test="${houseBasicInfo.town == null}">
                        <option selected value="0">— —请选择县/区— —</option>
                    </c:if>
                    <c:if test="${houseBasicInfo.town != null}">
                        <option selected value="${town}">${houseBasicInfo.town}</option>
                    </c:if>
                </select>
            </div>
            <div class="row">
                <lable for="address" class="control-label form-inline">
                    <input type="text" name="detailAddress" id="number" class="form-control" placeholder="详细地址（街道/门牌号）" style="width:65%;" value="${houseBasicInfo.detailAddress}" required>
                </lable>
            </div>
            <br>
            <br>
            <div class="subhead">房源标题</div>
            <div class="row">
                <lable for="address" class="control-label form-inline">
                    <input type="text" name="title"  class="form-control" placeholder="吸引人的标题：地点+描述词 例如：XX地铁站温馨小居室" style="width:65%;" value="${houseBasicInfo.detailAddress}" required>
                </lable>
            </div>
            <br>
            <br>
            <div class="subhead">房源介绍</div>
            <div class="row">
                <lable for="introduce" class="control-label form-inline">
                    <textarea type="text" name="introduce"  class="form-control" style="resize: none;width:65%;height:150px;"  placeholder="例如：同区同配置的房源均价都在400+,附近的经济酒店地下室都要400+,核心地段超高性价比,勿错过!没体验过上海法 租界,不要说自己小资;没体验过上海石库门,不要说自己文艺｡除了故事,这里还是美食夜店的发源地｡"  value="${houseBasicInfo.introduce}" required></textarea>
                </lable>
            </div>
            <br>
            <br>
            <div class="subhead">出行信息（选填）</div>
            <div class="row">
                <lable for="travelInfo" class="control-label form-inline">
                    <textarea type="text" name="travelInfo"  class="form-control"  style="resize: none;width:65%;height:150px;" placeholder="例如：距离地铁站1号线和10号线陕西南路站10分钟,9号线和12号线嘉善路8分钟虹桥机场:地铁10号线陕西南路站,共9站" value="${houseBasicInfo.travelInfo}" ></textarea>
                </lable>
            </div>
            <br>
            <br>
            <div class="subhead">房产证信息</div>
            <div class="row">
                <lable for="number" class="control-label form-inline">
                    <input type="text" name="certificateNumber" id="certificateNumber" placeholder="房产证编号：xxxxxxxxxxxx" class="form-control" style="width: 65%;" value="${houseBasicInfo.certificateNumber}" required>
                </lable>
            </div>
            <div class="row">
                <lable for="img" class="control-label form-inline">
                        <div class="file-box" >
                             <input type="file" name="file" class="file-btn" id="file" required>
                             <div class="upload_photo"> 上传房产证照片</div>
                        </div>

                </lable>
            </div>
            <div class="row" style="margin-top:100px; ">
                <div class="col-lg-4">
                    <label class="control-label form-inline">
                        <input type="button" class="btn btn-default btn-danger" value="RETURN"/>
                    </label>
                </div>
                    <div class="col-lg-6" >
                        <label class="control-label form-inline">
                            <input type="submit" class="btn btn-default btn-info" value="NEXT"/>
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
        $("#file").change(function () {
            var fil = this.files;
            console.log(fil.length);
            for (var i = 0; i < fil.length; i++) {
                console.log(fil[i]);
                reads(fil[i]);
            }
        });

        $(".upload_photo").on("click",function () {
            $(this).closest("input[type=file]").trigger("click");

        })
        //房源id编号=日期+四位随机数，例如：1904171234（19年4月17日，后四位随机数）

        var date=new Date();
        var year=date.getFullYear().toString().substring(2,4);
        var month=parseInt(date.getMonth().toString())+1;
        var day=date.getDate().toString();
        var random=Math.floor(Math.random()*9000+1000);
        var houseId=mathForm(year)+mathForm(month)+mathForm(day)+random;
        $("#houseId").val(houseId);
        console.log($("#houseId").val());
    });

    function mathForm(content){
        var value=(Array(2).join(0)+content).slice(-2);
        return value;
    }

    function reads(fil) {
        var reader = new FileReader();
        reader.readAsDataURL(fil);
        reader.onload = function () {
            $(".upload_photo").after("<img src='"+reader.result+"' class='photo'/>");
            // $("#show").attr("src", reader.result);
            // $("#show").addClass("photo");
        };
    }


</script>