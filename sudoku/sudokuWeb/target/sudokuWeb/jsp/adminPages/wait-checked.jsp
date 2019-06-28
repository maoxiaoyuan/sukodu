<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://code.com/c" %>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>九宫格后台管理系统</title>
		<link rel="stylesheet" type="text/css" href="../static/admin/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="../static/admin/css/admin.css" />
	</head>
	<style>
		table tr{
			height: 30px;
			margin: 10px;
		}
		form button{
			margin-right:10px;
		}
	</style>

	<body>
		<div class="page-content-wrap">
			<div class="row">
				<c:forEach items="${pageInfo.list}" var="house">
					<div  class="col-md-4" style="width:30%;margin:10px 20px;height:250px;border: 1px solid black;">
						<div style="width:25%;height: 85px;margin-top: 30px; float: left">
							<img src="../${house.user.headPhoto}" alt="头像" style="width:100%;height:100%;">
						</div>
						<div style="float: left; width:75%;">
							<div class="content" style="margin-top:20px;margin-left:10px;font-size: 15px;font-weight: bold;">
								<table>
									<tr>
										<td width="40%">房东：</td>
										<td width="60%">${house.user.name}</td>
									</tr>
									<tr>
										<td style="padding-top:0px;">房产证编号：</td>
										<td >${house.certificateNumber}</td>
									</tr>
									<tr>
										<td>状态：</td>
										<td style="color: red">待审核</td>
									</tr>
								</table>
								<div ><a href="<%=request.getContextPath()%>/house/houseDetail?houseId=${house.id}"><small style="color:#20b2aa;position:relative;left:100px;">查看详情</small></a></div>
							</div>
						</div>
						<div style="clear: both;">
							<div style="font-size: 12px;"><b>${house.town}·${house.city}·${house.province}</b></div>
							<div style="font-size: 18px;padding-top: 8px;"><b>${house.title}</b></div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="row" style="clear:both;">
				<form action="" method="post">
					<div class="btn-group" style="position:relative;left: 40%;">
						<span style="font-size: 15px;margin-right: 20px;">共${pageInfo.total}条 ${pageInfo.pageNum}/${pageInfo.pages}</span>
						<button type="submit" name="pageNum" value="${1}" style="border: none;background: none">首页</button>
						<button type="submit" name="pageNum" value="${pageInfo.pageNum-1}" style="border: none;background: none">上一页</button>
						<button type="submit" name="pageNum" value="${pageInfo.pageNum+1}" style="border: none;background: none">下一页</button>
						<button type="submit" name="pageNum" value="${pageInfo.pages}" style="border: none;background: none">尾页</button>
					</div>
				</form>
			</div>

		</div>
		<script src="../static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script src="../static/admin/js/common.js" type="text/javascript" charset="utf-8"></script>
		<script src="../static/admin/js/main.js" type="text/javascript" charset="utf-8"></script>

	</body>

</html>