<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://code.com/c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>我的故事</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        .container{
            margin:0 auto;
            padding-bottom: 100px;
        }
        li{
            list-style: none;
        }
        .user-info{
            margin-top:50px;
        }
        .content{
            margin-top:-100px;
            width:600px;
            position:relative;
            left: 50px;
        }

        .content .thumb-image{
            width: 100%;
            height:500px;
            padding-bottom: 20px;
        }

        .mystory .story-title{
            font-size: 28px;
            font-weight: bolder;
        }
        .mystory .story-content{
            font-size: 18px;
            color: rgba(0, 0, 0, 0.75)

        }

        .black_overlay{
            display: none;
            position: fixed;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 100%;
            background-color: black;
            z-index:1001;
            -moz-opacity: 0.8;
            opacity: 0.5;
            filter: alpha(opacity=88);
        }
        .white_content {
            display: none;
            position: fixed;
            top: 25%;
            left:25%;
            width: 50%;
            /*height: 60%;*/
            padding: 20px;
            border: 3px solid red;;
            background-color: white;
            z-index:1002;
            overflow: auto;
        }
        .alertclose{
            font-size: 50px;
            width: 50px;
            border: 1px black dotted;
            height: 50px;
            text-align: center;
        }
        .content .conduct{
            width:100px;
            height:100px;
            text-align: center;
            line-height: 100px;
            background-color: rgba(0, 0, 0, 0.1);
            border: 1px solid gray;
            border-radius: 50%;
            margin-left: 160px;
            padding-top: 35px;
        }
        .conduct img{
            cursor: pointer;
        }
        .btn{
            background-color: #fff;
            color: rgb(23, 116, 85);
            border:1px solid  rgb(23, 116, 85);
            font-weight: bolder;
            cursor: pointer;
            outline: none !important;
        }
        .btn:hover{
            color: rgb(23, 116, 85);
        }
        #comment-content{
            border:none;
            resize:none;
            outline:none;
            width:100%;
            margin-top:15px;
            max-height: 300px;
        }
        .container .form-button{
            text-align: right;
        }
        .form-button .btn{
            color:rgba(82, 117, 114, 0.8);
            border:1px solid  rgba(23, 116, 85, 0.26);

        }
        .submit{
            background-color:  rgba(23, 116, 85,0.2);
            color:#fff;
            border:none;
        }
        .submit:active,.submit:hover,.submit:visited{
            color:#fff;
        }
        .submit-hastext{
            background-color:  rgb(23, 116, 85);
        }

        .related-story .story-img{
            margin-right: 5px;
            width: 15px;
            height: 15px;
        }
        .follow{
            position: relative;
            left: 500px;
            top: -50px;
        }
        .followed{
            color: white;
            background-color: rgb(23, 116, 85);
        }
        .btn:focus{
            color: white !important;
        }
        /*滚动条样式*/
        .white_content::-webkit-scrollbar {
            width: 4px;
        }
        .white_content::-webkit-scrollbar-thumb {
            border-radius: 10px;
            -webkit-box-shadow: inset 0 0 5px rgba(0,0,0,0.2);
            background: rgba(0,0,0,0.2);
        }
        .white_content::-webkit-scrollbar-track {
            -webkit-box-shadow: inset 0 0 5px rgba(0,0,0,0.2);
            border-radius: 0;
            background: rgba(0,0,0,0.1);
        }

        .related-house{
            height: 150px;
            border-top: 1px solid rgba(0,0,0,0.1);
            border-bottom: 1px solid rgba(0,0,0,0.1);
            padding: 20px 0;
            margin: 10px 0 50px 0;
        }
    </style>
</head>
<body>
<a href="<%=request.getContextPath()%>/story/toStory"> 故事</a>
    <div class="container">
        <div class="user-info col-sm-offset-3">
            <img src="../../${story.user.headPhoto}"  style="float:left;width:50px;height:50px;" class="img-circle">
            <div style="margin-left: 70px;line-height: 25px;">
                <span>${story.user.name}</span>
                <p>
                    <span style="display: inline-block;margin-right: 10px;">
                         <c:choose>
                            <c:when test="${!(story.tourCity eq 'false')}">
                                ${story.tourCity}
                            </c:when>
                            <c:otherwise>
                                ${story.house.city}
                            </c:otherwise>
                         </c:choose>
                    </span>
                    <span><fmt:formatDate value="${story.createTime}" pattern="yyyy年MM月dd日"></fmt:formatDate></span>
                </p>
            </div>
            <form action="javascript:void(0)" method="post" id="followForm">
                 <c:if test="${followornot==0}">
                    <button type="submit" name="follow" class='btn follow' id='follow' value="0" onclick="followUser()">关注</button>
                 </c:if>
                <c:if test="${followornot>=1}">
                    <button type="submit" name="follow"  class='btn follow followed' id='follow' value="1" onclick="followUser()">已关注</button>
                </c:if>
            </form>
        </div>
    </div>
    <div class="content col-sm-offset-3">
        <%--故事的图片块--%>
        <div class="img-box">
            <c:forEach items="${imgList}" var="item">
                <img src="../../${item}" class="thumb-image" alt="">
            </c:forEach>
        </div>

         <%--故事的文字信息--%>
        <div class="mystory">
            <p class="story-title">${story.storyTitle}</p><br>
            <p class="story-content">${story.storyContent}</p>
            <a href = "JavaScript:void(0)" id="clicklike" style="color:seagreen;cursor: pointer;text-decoration: none"
            onclick = "document.getElementById('light').style.display='block';
            document.getElementById('fade').style.display='block'">
                <span id="like-num">
                    <c:if test="${storyDetail.likeNum!=null}">${storyDetail.likeNum}</c:if>
                    <c:if test="${storyDetail.likeNum==null}">0</c:if>
                </span>
            人点赞</a>
            <div id="light" class="white_content pre-scrollable">
                <div style="height:100px;">
                    <h3 style="float:left">喜欢这篇故事的人</h3>
                    <a href = "javascript:void(0)" class='close img-circle alertclose' aria-hidden='true'
                    onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none';
                    ">&times</a>
                </div>
                <div>
                <c:forEach items="${likesList}" var="likes" varStatus="loop">
                    <div style="height: 70px;margin: 10px;border-bottom: 1px solid rgba(0,0,0,0.1);">
                        <img src="../../${likes.user.headPhoto}" alt="" style="float:left;width:50px;height:50px;" class="img-circle">
                        <span style="margin-left: 30px;line-height: 50px;font-size: 18px;font-weight: bold">${likes.user.name}</span>
                        <form action="javascript:void(0)" method="post" id="followForms">
                            <c:if test="${followornotList[loop.count-1]==0}">
                                <button type="submit" name="follow"  id="${likes.user.id}" class="likesList btn" value="0"  style="position: relative;left: 450px;top: -40px;">关注</button>
                            </c:if>
                            <c:if test="${followornotList[loop.count-1]>=1}">
                                <button type="submit" name="follow" id="${likes.user.id}"  class='likesList btn followed' value="1"  style="position: relative;left: 450px;top: -40px;" >已关注</button>
                            </c:if>
                        </form>
                    </div>
                </c:forEach>
                </div>
            </div>
            <div id="fade" class="black_overlay"></div>
        </div>

         <%--故事关联的房源--%>
            <c:if test="${relatedHouse!=null}">
                 <div style="margin-top:40px;height:150px;">
                     <p>毛园本次旅行选择的房源</p>
                     <div>
                         <img src="http://localhost:8080/uploadFile/2019/05/26/c8323bfa-0ff6-4730-899b-b449a6ebb98c.jpg" style="width:100px;height: 100px;margin-right: 20px;float:left;">
                         <div style="line-height: 30px">
                             <p>【上海】｢柒月·影吧｣静安寺复式洋房 Loft — 电影放映厅</p>
                             <p>2条评价</p>
                         </div>
                     </div>
                 </div>
            </c:if>

        <%--点赞和收藏图标--%>
         <div style="text-align:center;height: 140px;">
             <form  method="get"  id="likesForm">
                 <div class="conduct col-sm-4">
                     <c:if test="${likeornot>=1}">
                         <img id="dianzan" src="../../img/dianzan_after.png" alt="" onclick="toggleDianzan()">
                     </c:if>
                      <c:if test="${likeornot<=0||likeornot==null}">
                          <img id="dianzan" src="../../img/dianzan_before.png" alt="" onclick="toggleDianzan()">
                      </c:if>
                   </div>
                 <div class="conduct col-sm-4">
                     <c:if test="${favoriteornot>=1}">
                         <img id="favorite" src="../../img/shoucang_after.png"  onclick="toggleShoucang()" alt="">
                     </c:if>
                      <c:if test="${favoriteornot<=0||favoriteornot==null}">
                          <img id="favorite" src="../../img/shoucang_before.png"  onclick="toggleShoucang()" alt="">
                      </c:if>
                 </div>
             </form>
         </div>

         <div id="comments" class="comments">
            <p style="font-size:20px;font-weight:bolder;">
                 <c:if test="${storyDetail.commentNum!=null&&storyDetail.commentNum!=0}"><span>${storyDetail.commentNum}条评论</span></c:if>
                 <c:if test="${storyDetail.commentNum==null||storyDetail.commentNum==0}">有什么感想？</c:if>
            </p><br>

            <%--发表评论的input框--%>
            <div class="form-group">
                 <div id="comment-block" style="border: 1px solid #a0b3d6;" >
                    <div style="float:left;padding:5px 0 0 16px !important;" >
                            <img src="../../img/匿名.png" alt="" style="width:50px;height:50px;">
                    </div>
                    <div style="line-height: 40px;padding-left: 80px;font-size: 18px;">
                        <form method="post" id="commentForm">
                            <textarea name="commentContent" id="comment-content" rows="1" placeholder="说点什么吧..." ></textarea>
                        </form>
                    </div>
                 </div>
            </div>

            <%--获取故事的评论--%>
            <div class="other-comments" style="margin-top: 40px;">
                <c:forEach items="${pageInfo.list}" var="item">
                    <img src="../../${item.user.headPhoto}" alt="" style="float:left;width:50px;height:50px;cursor:pointer;" class="img-circle">
                    <div class="one-comment" style="margin-left: 70px;margin-bottom: 15px;line-height: 25px;">
                        <span>${item.user.name}</span>
                        <c:if test="${story.user.id==item.user.id}">
                            <span style="font-weight: bolder">&nbsp;&nbsp;作者</span>
                        </c:if>
                         <p><fmt:formatDate value="${item.createTime}" pattern="yyyy年MM月dd日"></fmt:formatDate></p>
                    </div>
                    <p style="font-size:16px;">${item.commentContent}</p>
                    <hr>
                </c:forEach>
            </div>
         </div>
            <%--评论底部分页--%>
            <c:if test="${pageInfo.total>0}">

                <form action="<%=request.getContextPath()%>/story/getStoryById/${sid}" method="get" class="form-button" id="buttonForm">
                    共${pageInfo.total}条 ${pageInfo.pageNum}/${pageInfo.pages}
                    <button type="submit" value="1" class="btn btn-sm" name="pageNum" onclick="changePages(1)">首页</button>
                    <c:if test="${pageInfo.pageNum-1 <=0}">
                        <button type="submit" value="1" class="btn btn-sm" name="pageNum" onclick="changePages(1)">上一页</button>
                    </c:if>
                    <c:if test="${pageInfo.pageNum-1>=1}">
                         <button type="submit" class="btn btn-sm" name="pageNum" value="${pageInfo.pageNum-1}" onclick="changePages(${pageInfo.pageNum-1})">上一页</button>
                    </c:if>
                    <c:if test="${pageInfo.pageNum+1>=pageInfo.pages}">
                        <button type="submit" class="btn btn-sm" name="pageNum" value="${pageInfo.pages}" onclick="changePages(${pageInfo.pages})">下一页</button>
                    </c:if>
                    <c:if test="${pageInfo.pageNum+1<pageInfo.pages}">
                        <button type="submit" class="btn btn-sm" name="pageNum" value="${pageInfo.pageNum+1}" onclick="changePages(${pageInfo.pageNum+1})">下一页</button>
                    </c:if>
                    <button type="submit" class="btn btn-sm" name="pageNum" value="${pageInfo.pages}" onclick="changePages(${pageInfo.pages})">尾页</button>
                </form>

            </c:if>
    </div>

    <div class="related-story col-sm-offset-3" style="margin-right: 20%;">
        <c:if test="${relatedStory.size()>0}">
            <p style="font-size:20px;font-weight:bolder;">相关故事</p><br>
            <ul style="padding-left: 0">
                <c:forEach items="${relatedStory}" var="story" varStatus="loop">
                    <li style="float: left;margin-right: 20px;margin-bottom:20px;width: 180px;cursor: pointer">
                        <a href="/getStoryById/${story.sid}">
                            <img src="${story.img01}" style="width:100%;height:200px;border-radius: 10px">
                        </a>
                        <c:if test="${likeornotList[loop.count-1]==0||likeornotList[loop.count-1]==null}">
                            <img src="../../img/dianzan_white.png" class="dianzan-related" index="${story.sid}" style="position: relative;top:-190px;left:140px;">
                        </c:if>
                        <c:if test="${likeornotList[loop.count-1]>=1}">
                            <img src="../../img/dianzan_red.png" class="dianzan-related" index="${story.sid}" style="position: relative;top:-190px;left:140px;">
                        </c:if>

                        <p><span style="font-weight: bolder">${story.tourCity}&nbsp;</span>${story.storyTitle}</p>
                        <img src="${story.user.idImg}" style="float:left;width: 20px;height: 20px;margin-right: 15px;" class="img-circle">
                        <img src="../../img/dianzan_after.png" class="story-img" alt="">
                        <span class="related-likes">
                            <c:if test="${relatedStoryDetails[loop.count-1].likeNum!=null}">
                                ${relatedStoryDetails[loop.count-1].likeNum}
                            </c:if>
                            <c:if test="${relatedStoryDetails[loop.count-1].likeNum==null}">0</c:if>
                        </span>
                        <img src="../../img/comments.png" class="story-img" style="margin-bottom: -6px;margin-left: 15px;">
                        <span id="related-comments">
                        <c:if test="${relatedStoryDetails[loop.count-1].commentNum!=null}">
                            ${relatedStoryDetails[loop.count-1].commentNum}
                        </c:if>
                        <c:if test="${relatedStoryDetails[loop.count-1].commentNum==null}">0</c:if>
                        </span>
                    </li>
                </c:forEach>
            </ul>
        </c:if>
    </div>



</body>
</html>
<script>

    <%--故事作者好友关注--%>
    function followUser(){
        if($('#follow').val()=='0'){
            $('#follow').empty().html("已关注").val('1').addClass('followed');
            $('#followForm').attr("action","<%=request.getContextPath()%>/story/insertFollowers/${story.sid}/${story.user.id}");
            $('#followForm').submit();
            return;
        }else{
            $('#follow').empty().html("关注").val('0').removeClass('followed');
            $('#follow').hover(function(){
                $('#follow').css("color","rgba(23, 116, 85, 0.42);")
            },function(){
                $('#follow').css("color","rgb(23, 116, 85)")
            });
            $('#followForm').attr("action","<%=request.getContextPath()%>/story/deleteFollowers/${story.sid}/${story.user.id}");
            $('#followForm').submit();
            return;
        }
    }

    //点赞收藏的切换
    function toggleDianzan(){
        var $likeNum = $('#like-num');
        // alert(111)
        if($('#dianzan').attr("src")=="../../img/dianzan_before.png"){
            // alert(222)
            $('#dianzan').attr("src","../../img/dianzan_after.png");
            $.ajax({
                type : 'GET',
                url : '<%=request.getContextPath()%>/story/insertLikes',//java中的Servlet路径
                data :{id:${story.sid}},
                dataType:'json',
                success : function(data) {
                    $likeNum.html(data);
                },
                error:function (message) {
                    alert("获取数据失败！！")
                }
            });
        }else{
            $('#dianzan').attr("src","../../img/dianzan_before.png");
            $.ajax({
                type : 'GET',
                url : '<%=request.getContextPath()%>/story/deleteLikes',
                data :{id:${story.sid}},
                dataType:'json',
                success : function(data) {
                    $likeNum.html(data);
                },
                error:function (message) {
                    alert("获取数据失败！！")
                }
            });
        }
    }

    //点赞列表的好友关注
    $('.likesList').each(function () {
        $(this).click(function () {
            // alert($(this).attr('id'));
            var followId=$(this).attr('id');
            if($(this).val()=='0'){
                $(this).empty().html("已关注").val('1').addClass('followed');
                $('#followForms').attr("action","<%=request.getContextPath()%>/story/insertFollowers/${story.sid}/"+followId);
                $('#followForms').submit();
                return
            }else{
                $(this).empty().html("关注").val('0').removeClass('followed');
                $(this).hover(function(){
                     $(this).css("color","rgba(23, 116, 85, 0.42);")
                },function(){
                    $(this).css("color","rgb(23, 116, 85)")
                });
                $('#followForms').attr("action","<%=request.getContextPath()%>/story/deleteFollowers/${story.sid}/"+followId);
                $('#followForms').submit();
                return;
            }
        })
    });

    function toggleShoucang(){
        if($('#favorite').attr("src")=="../../img/shoucang_before.png"){
        // alert(222)
        $('#favorite').attr("src","../../img/shoucang_after.png");
        $.ajax({
            type : 'GET',
            url : '<%=request.getContextPath()%>/story/insertFavorites',//java中的Servlet路径
            data :{id:${story.sid}},
            dataType:'json'
         });

    }else{
        $('#favorite').attr("src","../../img/shoucang_before.png");
            $.ajax({
                type : 'GET',
                url : '<%=request.getContextPath()%>/story/deleteFavorites',//java中的Servlet路径
                data :{id:${story.sid}},
                dataType:'json'
        });

        }
    }

    function changePages(pageNum) {
        $.ajax({
            type:"POST",
            url:"<%=request.getContextPath()%>/story/changePages",
            dataType:"json",
            data:{id:${sid},pageNum:pageNum}
        });
    }
    //发表评论
    $('#comment-content').click(function(){
        var $comments = $('#comments');
        var buttons="<div style='text-align:right;padding-right:16px;padding-bottom:8px;'>\
                        <button class='btn' id='cancel'>取消</button>\
                        <button class='btn submit'  id='submit'>提交</button>\
                    </div>";
        //判断是否存在button按钮
        if($('#comment-block button').length){

        }else{
            $('#comment-block').append(buttons);
        }
        //点击取消按钮时恢复原状
        $('#cancel').click(function(){
            $(this).parent().remove();
        });
        //评论框中有文字时
        $('#comment-content').change(function () {
            if($('#comment-content').val()!=""){
                var commentContent=$('#comment-content').val();
                $('#submit').addClass('submit-hastext');
                $('#submit').click(function () {
                    $.ajax({
                        type : 'POST',
                        url : '<%=request.getContextPath()%>/story/insertComment',//java中的Servlet路径
                        data :{ id:${story.sid},
                            commentContent:commentContent},
                        success : function(data) {
                            console.log(data);
                            location.reload();
                            $("#commentForm").reset();
                        },
                        error:function (message) {
                            alert("评论失败")
                        }
                    });
                })

            }else{
                $('#submit').removeClass('submit-hastext');
            }
        })

    });

    function toggleRelatedDianzan(){
        var imgs=$('.related-story li form img');
        for (var i = 0; i < imgs.length; i++) {
            imgs[i]._index = i;
                imgs[i].onclick = function() {
                alert(this._index + 1);
                if($(this).attr("src")=="../../img/dianzan_white.png"){
                    $(this).attr("src","../../img/dianzan_red.png");
                    $('.dianzanRelatedForm').attr("action","<%=request.getContextPath()%>/story/insertLikes/${story.sid}");
                    // jquery 表单提交
                    $(".dianzanRelatedForm").ajaxSubmit(function(message) {
                    // 对于表单提交成功后处理，message为提交页面saveReport.htm的返回内容
                    });
                    return false; // 必须返回false，否则表单会自己再做一次提交操作，并且页面跳转

                }else{
                    $('#dianzan').attr("src","../../img/dianzan_before.png");
                    $('#likesForm').attr("action","<%=request.getContextPath()%>/story/deleteLikes/${story.sid}");
                    // jquery 表单提交
                    $("#likesForm").ajaxSubmit(function(message) {
                    });
                    return false;
                }
            };
        }
    }

    $(".dianzan-related").each(function () {
        $(this).click(function () {
            var likesId=$(this).attr('index');
            var $relatedLikesNum=$(this).parent().find('.related-likes');
            if($(this).attr("src")=="../../img/dianzan_white.png"){
                $(this).attr("src","../../img/dianzan_red.png");
                    $.ajax({
                        type : 'GET',
                        url : '/story/insertLikes',//java中的Servlet路径
                        data :{id:likesId},
                        dataType:'json',
                        success : function(data) {
                            $relatedLikesNum.html(data);
                        },
                        error:function (message) {
                             alert("获取数据失败！！")
                        }
                    });
                }else{
                    $(this).attr("src","../../img/dianzan_white.png");
                    $.ajax({
                        type : 'GET',
                        url : '<%=request.getContextPath()%>/story/deleteLikes',
                        data :{id:likesId},
                        dataType:'json',
                        success : function(data) {
                            $relatedLikesNum.html(data);
                        },
                        error:function (message) {
                            alert("获取数据失败！！")
                        }
                    });
            }
        })
    })
</script>














<%--</script>--%>