<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://code.com/c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="../../css/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="../../js/jquery-3.1.1.min.js" charset="UTF-8"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <script src="../../My97DatePicker/WdatePicker.js"></script
</head>
<%--<script>--%>

    <%--$(document).ready(function () {--%>
        <%--limitDate=null;--%>
       <%----%>
        <%--$("#next").on('focus',function () {--%>
            <%--WdatePicker({minDate:'#F{$dp.$D(\'pre\')}',position:{left:0,top:0},disabledDates:['2019-05-12','2019-05-13','2019-05-14','2019-05-27','2019-05-28']})--%>
        <%--})--%>
        <%--$.ajax({--%>
            <%--"url": "<%=request.getContextPath()%>/dateList",--%>
            <%--"type": "get",--%>
            <%--"data": {"houseId": "1905173669"},--%>
            <%--"dataType": "json",--%>
            <%--"success": function (json) {--%>

                <%--for (var i = 0; i < json.length; i++) {--%>
                    <%--var date = json[i];--%>
                    <%--limitDate=limitDate+"'"+date+"',";--%>
                    <%--console.log(limitDate);--%>
                <%--}--%>

            <%--}--%>
        <%--});--%>

        <%--$("#next").on('focus',function () {--%>
            <%--WdatePicker({minDate:'#F{$dp.$D(\'pre\')}',position:{left:0,top:0},disabledDates:['2019-05-12','2019-05-13','2019-05-14','2019-05-27','2019-05-28']})--%>
        <%--})--%>
    <%--});--%>
<%--</script>--%>
<script>
    $(function() {

        $("#input_date").on("focus",function(){
            var validate_date_Array=new Array();
            //查询所有有效的日期
            $.ajax({
                "url": "<%=request.getContextPath()%>/dateList",
                "type": "get",
                "data": {"houseId": "1905173669"},
                "dataType": "json",
                async:false,
                success: function(data){
                    console.log("data="+data);
                    //循环得到的List集合，放入数组中
                    $.each(data,function(index,obj){
                        console.log(obj);
                        validate_date_Array[index]=obj.toString();
                    });
                }
            });
            console.log(this);
            WdatePicker({
                el:this,
                opposite:false,//如果不设置则disabledDates参数中的值会是“无效日期”
                disabledDates:validate_date_Array,//绑定数组
            });
        });
    });
</script>
<body>
<div>
    <h5>日期</h5>

    <input id="input_date" type="text" class="Wdate"  style="width:120px;valign:center"  onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})")/>
    <%--<div style="border: 1px solid #d4d4d4;height: 37px;border-radius: 5px;">--%>
        <%--<div style="float: left;width: 42%;">--%>
            <%--<input id="pre" type="text" class="form-control date-style" placeholder="入住日期"--%>
                   <%--onclick="WdatePicker({minDate:'%y-%M-%d',maxDate:'#F{$dp.$D(\'next\')}',position:{left:0,top:0},disabledDates:['2019-05-12','2019-05-13','2019-05-14','2019-05-27','2019-05-28']})"/>--%>
        <%--</div>--%>
        <%--<div style="float: left;border-top:1px solid #f3f3f3">--%>
            <%--<span class="glyphicon glyphicon-minus" style="font-size: 18px;margin-top: 8px;color:#d4d4d4"></span>--%>
            <%--<span class="glyphicon glyphicon-arrow-right" style="margin-left:-10px;font-size: 18px;margin-top: 8px;color:#d4d4d4"></span>--%>
        <%--</div>--%>
        <%--<div style="float: left;width: 50%;">--%>
            <%--<input id="next"  type="text"  class="form-control date-style" placeholder="退房日期 ">--%>
        <%--</div>--%>


</div>
</body>
</html>
