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
		img{
			padding: 20px;
			width: 85%;
			height: 100%;
		}
		.info-title-top{
			width: 10%;
			font-size:15px;
			font-weight: bold;
			padding: 10px 10px 10px 10px;
			text-align: right;
		}
		.info-title{
			font-size:15px;
			font-weight: bold;
			padding: 10px 10px 10px 10px;
			text-align: left;
		}
		.info-content-top{
			width:20%;
			font-size:15px;
			padding: 10px 10px 10px 10px;
			text-align: left;
		}
		.info-content{
			font-size:15px;
			padding: 10px 10px 10px 10px;
			text-align: center;
		}
		.house-title{
			font-size:18px;
			font-weight: bold;
			padding: 10px 10px 10px 10px;
			text-align: left;
		}
	</style>
	<body>
		<div class="page-content-wrap">
			<div class="layui-form-item">
						<div class="layui-inline">
							<a href="<%=request.getContextPath()%>/house/getHouse?status=0%>">待审核</a>>>房源详情
						</div>
			</div>
			<div class="container">
				<div class="row" style="height: 150px;">
					<div class="col-lg-3">
						<img src="../${houseBasic.user.headPhoto}" alt="">
					</div>
					<div class="col-lg-9">
						<table style="width: 50%;position: relative;left: -50px;margin-top: 15px;">
							<tr>
								<td class="info-title-top">姓名：</td>
								<td class="info-content-top">${houseBasic.user.name}</td>
							</tr>
							<tr>
								<td class="info-title-top">身份证号：</td>
								<td  class="info-content-top">${houseBasic.user.idNumber}</td>
							</tr>
							<tr>
								<td class="info-title-top">手机号：</td>
								<td class="info-content-top">${houseBasic.user.phone}</td>
							</tr>
							<tr>
								<td class="info-title-top">电子邮箱：</td>
								<td class="info-content-top">${houseBasic.user.email}</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="row">
					房源信息：
				</div>
				<div class="row">

				</div>
			</div>
			<table cellpadding="0" >
				<%--<tr>--%>
					<%--<td colspan="6" class="house-title">房源信息：</td>--%>
				<%--</tr>--%>
				<%--<tr style="height: 50px;">--%>
					<%--<td class="info-title" style="width: 5%;">地址：</td>--%>
					<%--<td class="info-content">${houseBasic.province}${houseBasic.city}${houseBasic.town}${houseBasic.detailAddress}</td>--%>
					<%--<td class="info-title" >描述：</td>--%>
					<%--<td  class="info-content" >${houseBasic.title}</td>--%>
					<%--<td rowspan="2"  class="info-title">房产证照片：</td>--%>
					<%--<td  rowspan="2" class="info-content">--%>
						<%--<img src="../${houseBasic.certificateImg}" alt="">--%>
					<%--</td>--%>
				<%--</tr>--%>
				<%--<tr style="height: 50px;">--%>
					<%--<td class="info-title">旅行<br> 信息：</td>--%>
					<%--<td class="info-content">${houseBasic.travelInfo}</td>--%>
					<%--<td class="info-title">房产证编号：</td>--%>
					<%--<td class="info-content">${houseBasic.certificateNumber}</td>--%>
				<%--</tr>--%>
				<%--<tr>--%>
					<%--<td colspan="6" class="house-title">房屋照片：</td>--%>
				<%--</tr>--%>
				<%--<tr>--%>
					<%--<td colspan="6" class="house-title">--%>
						<%--<c:forEach items="${allImg}" var="img">--%>
							<%--<img src="../${img.imgPath}" alt="">--%>
						<%--</c:forEach>--%>
					<%--</td>--%>
				<%--</tr>--%>
			</table>

		</div>
		<script src="../static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script src="../static/admin/js/common.js" type="text/javascript" charset="utf-8"></script>
	</body>

</html>