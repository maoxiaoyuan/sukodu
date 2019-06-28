$(document).ready(function () {
    $.ajax({
        "url":"<%=request.getContextPath()%>/city/province",
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
                "url":"<%=request.getContextPath()%>/city/province",
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
                "url":"<%=request.getContextPath()%>/city/province",
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

