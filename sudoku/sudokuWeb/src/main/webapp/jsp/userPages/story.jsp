<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>故事</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
    .container{
        position: relative;
        top: 70px;
    }
</style>
<body>
<jsp:include page="top.jsp"/>
<div class="container">
    <iframe name="headFrame" width="100%" height="150px" src="/sudoku/jsp/userPages/storyHead.jsp" frameborder="0" scrolling="no"></iframe>
    <iframe name="contentFrame" src="<%=request.getContextPath()%>/story/toStoryContent" id="contentFrame" width="100%" height="100%" frameborder="0"></iframe>
</div>
<jsp:include page="footer.jsp"/>
</body>
<script type="text/javascript">
    //内容宽度变化的iframe高度自适应

    function reinitIframe(){
        var iframe = document.getElementById("contentFrame");
        try{
            var bHeight = iframe.contentWindow.document.body.scrollHeight;
            var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
            var height = Math.max(bHeight, dHeight);
            iframe.height = height;
            console.log(height);
        }catch (ex){}
    }
    window.setInterval("reinitIframe()", 200);
</script>
</html>
