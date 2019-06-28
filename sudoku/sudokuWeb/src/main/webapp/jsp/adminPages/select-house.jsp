<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://code.com/c" %>
<%@taglib prefix="fmt" uri="http://code.com/fmt" %>

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

	<body>
		<div class="page-content-wrap">
				<form class="layui-form" action="<%=request.getContextPath()%>/house/getHouseInfo">
					<div class="layui-form-item">
						<div class="layui-inline">
							<input type="text" name="searchInfo" placeholder="请输入房东姓名/房源编号" autocomplete="off" class="layui-input" style="width: 300px;">
						</div>
						<div class="layui-inline">
							<select name="category" lay-filter="status">
							</select>
						</div>
						<button class="layui-btn layui-btn-normal" lay-submit="search">查询</button>
					</div>
				</form>
				<div class="layui-form" id="table-list">
					<table class="layui-table" lay-even lay-skin="nob" >
						<colgroup>
							<col width="50">
							<col width="80">
							<col width="80">
							<col>
							<col width="250">
							<col width="150">
							<col width="150">
						</colgroup>
						<thead>
						<tr>
							<th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose"></th>
							<th>ID</th>
							<th>房东</th>
							<th>房源地址</th>
							<th>房源编号</th>
							<th>注册时间</th>
							<th>操作</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${house}" var="house" varStatus="i" >
							<tr>
								<td><input type="checkbox" name="" lay-skin="primary" data-id="1"></td>
								<td>${i.index+1}</td>
								<td>${house.user.name}</td>
								<td>${house.province}-${house.city}-${house.town}</td>
								<td>${house.certificateNumber}</td>
								<td><fmt:formatDate value="${house.registerTime}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
								<td ><a href="${house.id}"style="color:#1b7d75;">查看详情</a></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
		</div>
		<script src="../static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script src="../static/admin/js/common.js" type="text/javascript" charset="utf-8"></script>
		<script>
			layui.use(['form', 'jquery', 'layer', 'dialog'], function() {
				var $ = layui.jquery;

				//修改状态
				$('#table-list').on('click', '.table-list-status', function() {
					var That = $(this);
					var status = That.attr('data-status');
					var id = That.parent().attr('data-id');
					if(status == 1) {
						That.removeClass('layui-btn-normal').addClass('layui-btn-warm').html('隐藏').attr('data-status', 2);
					} else if(status == 2) {
						That.removeClass('layui-btn-warm').addClass('layui-btn-normal').html('显示').attr('data-status', 1);

					}
				})

			});
		</script>
	</body>

</html>