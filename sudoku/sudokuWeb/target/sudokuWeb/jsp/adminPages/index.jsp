<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://code.com/c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="renderer" content="webkit">
  		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>九宫格民宿后台管理</title>
		<link rel="stylesheet" type="text/css" href="static/admin/layui/css/layui.css"/>
		<link rel="stylesheet" type="text/css" href="static/admin/css/admin.css"/>
	</head>
	<body>
		<div class="main-layout" id='main-layout'>
			<!--侧边栏-->
			<div class="main-layout-side">
				<div style="height: 70px;background: #20b2aa;color: white;font-size: 20px;text-align: center;padding-top: 15px;"><b>SUDOKU<br>后台管理系统</b>
				</div>
				<ul class="layui-nav layui-nav-tree" lay-filter="leftNav">
				  <li class="layui-nav-item layui-nav-itemed">
				    <a href="javascript:;"><i class="iconfont">&#xe607;</i>房源管理</a>
				    <dl class="layui-nav-child">
				      <dd><a href="javascript:;" data-url="<%=request.getContextPath()%>/house/getHouse?status=0" data-id='1' data-text="待审核"><span class="l-line"></span>待审核</a></dd>
				      <dd><a href="javascript:;" data-url="<%=request.getContextPath()%>/house/getHouse?status=1" data-id='2' data-text="通过审核"><span class="l-line"></span>通过审核</a></dd>
				      <dd><a href="javascript:;" data-url="<%=request.getContextPath()%>/house/getHouse?status=-1" data-id='3' data-text="未通过审核"><span class="l-line"></span>未通过审核</a></dd>
				      <dd><a href="javascript:;" data-url="<%=request.getContextPath()%>/house/getHouseInfo" data-id='4' data-text="房源查询"><span class="l-line"></span>房源查询</a></dd>
				    </dl>
				  </li>
				  <li class="layui-nav-item">
				    <a href="javascript:;"><i class="iconfont">&#xe608;</i>订单管理</a>
				    <dl class="layui-nav-child">
				      <dd><a href="javascript:;" data-url="article-list.html" data-id='3' data-text="待付款"><span class="l-line"></span>待付款</a></dd>
				      <dd><a href="javascript:;" data-url="danye-list.html" data-id='9' data-text="已付款"><span class="l-line"></span>已付款</a></dd>
				      <dd><a href="javascript:;" data-url="danye-list.html" data-id='9' data-text="已退订"><span class="l-line"></span>已退订</a></dd>
				      <dd><a href="javascript:;" data-url="danye-list.html" data-id='9' data-text="订单查询"><span class="l-line"></span>订单查询</a></dd>
				    </dl>
				  </li>
				  <li class="layui-nav-item">
				    <a href="javascript:;" data-url="user.html" data-id='4' data-text="用户管理"><i class="iconfont">&#xe604;</i>用户管理</a>
				  </li>
				  <li class="layui-nav-item">
				    <a href="javascript:;" data-url="admin-info.html" data-id='5' data-text="个人信息"><i class="iconfont">&#xe606;</i>个人信息</a>
				  </li>
				  <li class="layui-nav-item">
				  	<a href="javascript:;" data-url="<%=request.getContextPath()%>/infoList" data-id='6' data-text="消息管理"><i class="iconfont">&#xe60b;</i>消息管理</a>
				  </li>
				</ul>
			</div>
			<!--右侧内容-->
			<div class="main-layout-container">
				<!--头部-->
				<div class="main-layout-header">
					<div class="menu-btn" id="hideBtn">
						<a href="javascript:;">
							<span class="iconfont">&#xe60e;</span>
						</a>
					</div>
					<ul class="layui-nav" lay-filter="rightNav">
					  <li class="layui-nav-item"><a href="javascript:;" data-url="email.html" data-id='4' data-text="消息管理"><i class="iconfont">&#xe603;</i></a></li>
					  <li class="layui-nav-item">
					    <a href="javascript:;" data-url="admin-info.html" data-id='5' data-text="个人信息">管理员</a>
					  </li>
					  <li class="layui-nav-item"><a href="<%=request.getContextPath()%>/adminQuit">退出</a></li>
					</ul>
				</div>
				<!--主体内容-->
				<div class="main-layout-body">
					<!--tab 切换-->
					<div class="layui-tab layui-tab-brief main-layout-tab" lay-filter="tab" lay-allowClose="true">
					  <ul class="layui-tab-title">
					    <li class="layui-this welcome">后台主页</li>
					  </ul>
					  <div class="layui-tab-content">
					    <div class="layui-tab-item layui-show" style="background: #f5f5f5;">
					    	<!--1-->
					    	<iframe src="<%=request.getContextPath()%>/main" width="100%" height="100%" name="iframe" scrolling="auto" class="iframe" framborder="0"></iframe>
					    	<!--1end-->
					    </div>
					  </div>
					</div>
				</div>
			</div>
			<!--遮罩-->
			<div class="main-mask">
				
			</div>
		</div>
		<script type="text/javascript">
			var scope={
				link:'./welcome.jsp'
			}
		</script>
		<script src="js/jquery-3.1.1.min.js" charset="UTF-8"></script>
		<script src="js/bootstrap.min.js" charset="UTF-8"></script>
		<script src="static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script src="static/admin/js/common.js" type="text/javascript" charset="utf-8"></script>
		<%--<script src="static/admin/js/main.js" type="text/javascript" charset="utf-8"></script>--%>
	</body>
</html>
<script>
	//菜单隐藏显示
	$('#hideBtn').on('click', function() {
		if(!$('#main-layout').hasClass('hide-side')) {
			$('#main-layout').addClass('hide-side');
		} else {
			$('#main-layout').removeClass('hide-side');

		}
	});
	layui.use(['element'],function () {
		var element = layui.element();
		element.on('nav(leftNav)',function () {
			var navA = $(this).find('a');
			var id = navA.attr('data-id');
			var url = navA.attr('data-url');
			var text = navA.attr('data-text');
			console.log("navA--"+navA);
			if(!url){
				return;
			}
			var isActive = $('.main-layout-tab .layui-tab-title').find("li[lay-id=" + id + "]");
			if(isActive.length > 0) {
				//切换到选项卡
				element.tabChange('tab', id);
			} else {
				element.tabAdd('tab', {
					title: text,
					content: '<iframe src="' + url + '" name="iframe' + id + '" class="iframe" framborder="0" data-id="' + id + '" scrolling="auto" width="100%"  height="100%"></iframe>',
					id: id
				});
				element.tabChange('tab', id);

			}
		})

	})
</script>
<script>
	var websocket = null;
	//判断当前浏览器是否支持WebSocket
	if ('WebSocket' in window) {
		websocket = new WebSocket("ws://localhost:8080/sudoku/websocket");
	}
	else {
		alert('当前浏览器 Not support websocket')
	}

	//连接发生错误的回调方法
	websocket.onerror = function () {
		console.log("WebSocket连接发生错误");
	};

	//连接成功建立的回调方法
	websocket.onopen = function () {
		console.log("WebSocket连接成功");
	}

	//接收到消息的回调方法
	websocket.onmessage = function (event) {
		setMessageInnerHTML(event.data);
	}

	//连接关闭的回调方法
	websocket.onclose = function () {
		console.log("WebSocket连接关闭");
	}

	//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
	window.onbeforeunload = function () {
		closeWebSocket();
	}

	//将消息显示在网页上
	function setMessageInnerHTML(innerHTML) {
		alert(innerHTML);
	}

	//关闭WebSocket连接
	function closeWebSocket() {
		websocket.close();
	}


</script>

