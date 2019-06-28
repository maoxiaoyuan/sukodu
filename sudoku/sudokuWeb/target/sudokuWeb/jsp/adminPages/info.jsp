<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://code.com/c" %>
<%@ taglib prefix="fmt" uri="http://code.com/fmt" %>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="renderer" content="webkit">
  		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>九宫格后台管理系统</title>
		<link rel="stylesheet" type="text/css" href="static/admin/layui/css/layui.css"/>
		<link rel="stylesheet" href="css/bootstrap-3.3.7-dist/css/bootstrap.min.css">
		<script src="js/jquery-3.3.1.min.js" charset="utf-8"></script>
		<script src="js/bootstrap.min.js"></script>
	</head>
	<body>
		<div class="wrap-container welcome-container">
			<div class="row">
				<c:forEach items="${infoList}" var="info">
					<div style="width:45%;float:left;margin-left: 30px">
						<div class="panel" style="margin-left: 20px;margin-top: 20px;">
							<div class="panel-heading">
								<div class="panel-title">
									<div style="float: left;font-size: 15px;" >
										<b>${info.user.name}</b>
									</div>
									<div style="float: right;font-size: 15px;">
										<b><fmt:formatDate value="${info.infoDate}" type="both" dateStyle="full"></fmt:formatDate></b>
									</div>
								</div>
							</div>
							<div class="panel-body" style="clear: both; font-size: 20px;height:80px;">
								${info.infoContent}
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
		<script src="static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	</body>
</html>
<script>
	$(document).ready(function () {
		$(".panel").each(function (index) {
			console.log(index);
			if (index%4==0)
				$(this).css("background","#1b7d75");
			if (index%4==1)
				$(this).css("background","#828189");
			if (index%4==2)
				$(this).css("background","#bc8671");
			if (index%4==3)
				$(this).css("background","#a9bc7b");
		})
	})
</script>
