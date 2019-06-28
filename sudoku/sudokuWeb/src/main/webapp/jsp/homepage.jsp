<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://code.com/c" %>
<%@taglib prefix="fn" uri="http://code.com/fn" %>
<%@taglib prefix="fmt" uri="http://code.com/fmt" %>
<html>
	<head>
		<meta charset="utf-8">
		<title>九宫格民宿【每一家民宿，都是独特的个性表达】</title>
		<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="../css/homepage.css"/>
		
		<link rel="stylesheet" type="text/css" href="../css/nav.css"/>
		<link rel="stylesheet" type="text/css" href="../css/scroll.css"/>
		<link rel="stylesheet" type="text/css" href="../css/responsive.css"/>
		<link rel="stylesheet" type="text/css" href="../css/search.css"/>
		<link rel="stylesheet" type="text/css" href="../css/discount.css"/>
		<link rel="stylesheet" type="text/css" href="../css/hot.css"/>
		<link rel="stylesheet" type="text/css" href="../css/ideas.css"/>
		<link rel="stylesheet" type="text/css" href="../css/story.css"/>
		<link rel="stylesheet" type="text/css" href="../css/footer.css"/>
		
		<script src="../js/jquery-3.1.1.min.js" charset="UTF-8"></script>
		<script src="../js/bootstrap.min.js" charset="UTF-8"></script>
	
		
	</head>
	<body>
		
		<!-- 导航条 -->
		 <header class="main_menu_area">
		    <nav class="navbar navbar-expand-lg navbar-light bg-light">
		        <a class="navbar-brand" href="#" style="height:65%;"><img src="../img/logo11.png" alt=""></a>
		        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		            <span></span>
		            <span></span>
		            <span></span>
		        </button>
		
		        <div class="collapse navbar-collapse" id="navbarSupportedContent">
		            <ul class="navbar-nav">
						<c:if test="${USER == null}">
							<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/toLogin">登录</a></li>
							<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/toRegister">注册</a></li>
						</c:if>
		                <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/houseBasicInfo/toAdd">成为房东</a></li>
		                <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/story/toStory">故事</a></li>
						 <li class="nav-item"><a class="nav-link" href="contact.html">帮助</a></li>
		                <li class="nav-item dropdown submenu">
		                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		                    个人中心
		                    </a>
		                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		                        <li class="nav-item"><a class="nav-link" href="blog.html">我的订单</a></li>
		                        <li class="nav-item"><a class="nav-link" href="single-blog.html">在租房源</a></li>
		                        <li class="nav-item"><a class="nav-link" href="elements.html">个人资料</a></li>
		                    </ul>
		                </li>
						<c:if test="${USER !=null}">
							<li class="nav-item">
                                <a class="nav-link" href="#">
                                    <div style=" width:50px;height:50px;float: left;border-radius: 50%;position: relative;top:5px;left: 10px;">
                                        <img src="../${USER.headPhoto}" class="img-circle" style="width: 100%;height: 100%;" >
                                    </div>
                                </a>
								<span style="margin-left: 30px;"><a href="<%=request.getContextPath()%>/quit">退出</a></span>
							</li>
						</c:if>
		            </ul>
		        </div>
		    </nav>
		</header>
		
		
		<!-- 轮播图 -->
		<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="4000">
			<!-- 轮播（Carousel）指标  圆点-->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" ></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>   
			<!-- 轮播（Carousel）项目 -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="../img/a.jpg" alt="Second slide">
					<!-- <img src="https://img.meituan.net/iphoenix/fae12ad6cb45735f4835276ada9cb062167115.jpg.webp" alt="First slide"> -->
					<!-- <span>我是第一个</span> -->
				</div>
				<div class="item">
					<img src="../img/c.jpg" alt="Second slide">
					<!-- <img src="https://p0.meituan.net/iphoenix/5b2af7457f8f0feb26c030aeefecb33f2393508.jpg.webp" alt="Second slide"> -->
				</div>
				<div class="item">
					<img src="../img/d.jpg" alt="Second slide">
					<!-- <img src="https://p1.meituan.net/iphoenix/3d1f903d47e845f896568b43d3bccc282623564.jpg.webp" alt="Third slide"> -->
				</div>
			</div>
			<!-- 轮播（Carousel）导航   箭头-->
			<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div> 
	
	    <!-- 输入城市进行搜索 -->
	    <form action="" class="search">
	    	<div class="form-group col-md-8 col-md-push-2">				
	    			<input type="" name="" id="" class="col-md-10" placeholder="请输入城市/经典/或房源名" value=""/>
	    			<button type="button" class="col-md-2 bg-info">搜索</button>				
	    	</div>
	    </form>
	
		
		<!-- 夏季特惠 -->
		<div id="discount" class="col-md-10 col-md-push-1">
			<h3>夏季特惠房源</h3>
			<p>低至7折，可叠加使用礼券</p>
			<!-- <div>后期添加按钮，选择城市</div> -->
			<ul class="discountUl1">
				<c:forEach items="${houseList}" var="house">
					<li class="col-md-4">
						<a href="<%=request.getContextPath()%>/house/detail/${house['houseResource'].houseId}">
							<img src="../${house['img']}" alt="">
							<h6 style="color:#9d9d9d;">${fn:substring(house['houseResource'].rentType,0,2 )}${house['houseResource'].houseType}</h6>
							<h3 style="color:black;">${house['title']}</h3>
							<h4>
								<span class="span1">￥<fmt:formatNumber type="number" value="${house['houseResource'].price * 0.7}" pattern="0.00" maxFractionDigits="2"></fmt:formatNumber></span>
								<span class="span2">￥${house['houseResource'].price}每晚</span>
							</h4>
							<h5>★★★★★</h5>
						</a>
					</li>
				</c:forEach>
			</ul>
			<a href="" class="aaa">查看更多特惠房源...</a>
		</div>
		
		<!-- 夏季游玩灵感 -->
		<div id="ideas" class="col-md-10 col-md-push-1">			
				<h2>夏季游玩灵感</h2>
				<h5>夏天到了，一起出去玩吧</h5>
				<ul>
					<li class="port effect1">				    	
				        	<div class="image-box">
				            	<img src="../img/ideas1.jpg" alt="Image-1">
				            </div>
				            <div class="text-desc">
				            	<h3>Your Title</h3>
				                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
				            	<a href="#" class="btn">Learn more</a>
				            </div>
				        
				    </li>
				    <li class="port effect2">
				    	
				        	<div class="image-box">
				            	<img src="../img/ideas2.jpg" alt="Image-2">
				            </div>
				            <div class="text-desc">
				            	<h3>Your Title</h3>
				                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
				            	<a href="#" class="btn">Learn more</a>
				            </div>
				        
				    </li>
				    <li class="port effect3">
			 	    	
				        	<div class="image-box">
				            	<img src="../img/ideas4.jpg" alt="Image-3">
				            </div>
				            <div class="text-desc">
				            	<h3>Your Title</h3>
				                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.</p>
				            	<a href="#" class="btn">Learn more</a>
				            </div>
				        
				    </li>
				</ul>			
		        <a href="" class="aaa">寻找更多夏季出行灵感...</a>
		</div>
		
		<!-- 热门目的地 -->
		<div id="hot" class="col-md-10 col-md-push-1">
			<h3>热门目的地&nbsp;♥</h3>
			<p></p>
			<!-- <div>后期添加按钮，选择城市</div> -->
			<ul class="hotUl1"></ul>
			<ul class="hotUl2"></ul>
			<a href="" class="aaa">发现更多热门目的地...</a>
		</div>
	
	    <!-- 故事 -->
	    <div id="story" class="col-md-10 col-md-push-1">
			<h3>发现有趣的灵魂</h3>
			<c:forEach items="${storiesList}" var="story" varStatus="i">
				<c:if test="${i.index<6}">
					<div class="flip-3d col-md-4">
						<a  href="<%=request.getContextPath()%>/story/getStoryById/${story.sid}">
							<figure>
								<img src="../${story.img01}">
								<figcaption>${story.storyTitle}</figcaption>
							</figure>
						</a>
					</div>
				</c:if>
			</c:forEach>

	    	<%--<div class="flip-3d col-md-4">--%>
	    		<%--<figure>--%>
	    	    	<%--<img src="../img/story2.jpg" alt="九宫格">--%>
	    	    	<%--<figcaption>Irrigation rats</figcaption>--%>
	    	  	<%--</figure>--%>
	    	<%--</div>--%>
	    	<%--<div class="flip-3d col-md-4">--%>
	    		<%--<figure>--%>
	    	    	<%--<img src="../img/story3.jpg" alt="九宫格">--%>
	    	    	<%--<figcaption>Rabbit</figcaption>--%>
	    		<%--</figure>--%>
	    	<%--</div>--%>
			<%--<div class="flip-3d col-md-4">--%>
				<%--<figure>--%>
			    	<%--<img src="../img/story4.jpg" alt="九宫格">--%>
			    	<%--<figcaption>Rabbit</figcaption>--%>
				<%--</figure>--%>
			<%--</div>--%>
			<%--<div class="flip-3d col-md-4">--%>
				<%--<figure>--%>
			    	<%--<img src="../img/story5.jpg" alt="九宫格">--%>
			    	<%--<figcaption>Rabbit</figcaption>--%>
				<%--</figure>--%>
			<%--</div>--%>
			<%--<div class="flip-3d col-md-4">--%>
				<%--<figure>--%>
			    	<%--<img src="../img/story6.jpg" alt="九宫格">--%>
			    	<%--<figcaption>Rabbit</figcaption>--%>
				<%--</figure>--%>
			<%--</div>--%>
	        <a href="" class="a">聆听更多精彩故事...</a>
		</div>
	
	    <!-- footer -->
		<div id="footer" class="foot col-md-12">
		  <div>
			<ul class="col-md-3">
				<li>九宫格</li>
				<li></li>
				<li><a href="">工作机会</a></li>
				<li><a href="">新闻</a></li>
				<li><a href="">政策</a></li>
				<li><a href="">帮助</a></li>	
			</ul>
			<ul class="col-md-3">
				<li>发现</li>
				<li></li>
				<li><a href="">信任与安全</a></li>
				<li><a href="">邀请好友</a></li>
				<li><a href="">商务差旅</a></li>
				<li><a href="">旅行指南</a></li>		
			</ul>
			<ul class="col-md-3">
				<li>出租</li>
				<li></li>
				<li><a href="">为什么要出租</a></li>
				<li><a href="">待客之道</a></li>
				<li><a href="">房东义务</a></li>
				<li><a href="">开展体验</a></li>			
			</ul>
			<ul class="col-md-3">
				<li>其他</li>
				<li></li>
				<li><a href="">联系我们</a></li>
				<li><a href="">条款</a></li>
				<li><a href="">隐私政策</a></li>
				<li><a href="">网站地图</a></li>
			</ul>
		</div>
		<div class="col-md-10 col-md-push-1 record">
			<img src="../img/logo2.png" alt="">
			<div>
				<span>京ICP备00000000号-0 京ICP证 666666号</span>
				<img src="../img/police.png" alt="">
				<span>京公网安备 11111111111111号 九宫格网络（212）有限公司</span>
				<p>© 2019 Sudoku, Inc. All rights reserved.</p>
			</div>
		</div>
	</div>
	     
	</body>
</html>
<script type="text/javascript">
	
// 夏季特惠版块

	// var discountUl1=$("#discount .discountUl1");
	// var discountUl2=$("#discount .discountUl2");

// 	father:li的父元素是哪个,
// 	imgSrc:图片的路径," .."
// 	size:房源的规格,如:整套房源,".."
// 	name:产品的名字(房源的名字),".."
// 	price:房源的现价,".."
// 	before:房源的原价,".."
// 	star:星级水平

    // 创建单个产品(li)的函数
 	function createProductLi(information){
 		var li=$("<li/>");
		var img=$("<img/>")
		var h6=$("<h6/>");
		var h3=$("<h3/>");
		var h4=$("<h4/>");
		var span1=$("<span/>");
		var span2=$("<span/>");
		h4.append(span1);
		h4.append(span2);
		var h5=$("<h5/>");
		
		span1.attr("class","span1");
		span2.attr("class","span2");
		
		li.append(img);
		li.append(h6);
		li.append(h3);
		li.append(h4);
		li.append(h5);
		
		img.attr("src",information.imgSrc);
		h6.html(information.size);
		h3.html(information.name);
		span1.html(information.price);
        span2.html("￥"+information.before+"每晚");
		switch (information.star){
			case 1:
			 h5.html("★")
				break;
			case 2:
			 h5.html("★★")
				break;
			case 3:
			 h5.html("★★★")
				break;
			case 4:
			 h5.html("★★★★")
				break;
			case 5:
			 h5.html("★★★★★")
				break;			
			default:
				break;
		}
		
		information.father.append(li);
 	}
	
	// 使用createDiscountLi函数创建特惠板块的产品
	// var d1=({
	// 	father:discountUl1,
	// 	imgSrc:"img/discount1.jpg",
	// 	size:"整套房源",
	// 	name:"【睿吉景舍】解放碑/朝天门/两江交汇/弹子石老街4A景区内/60平复式5米超大落地窗江景房｣",
	// 	price:"￥480",
	// 	before:590,
	// 	star:5
	// });
	// //createProductLi(d1);
	//
	// var d2=({
	// 	father:discountUl1,
	// 	imgSrc:"img/discount2.jpg",
	// 	size:"整套房源",
	// 	name:"【睿吉景舍】解放碑/朝天门/两江交汇/弹子石老街4A景区内/60平复式5米超大落地窗江景房｣",
	// 	price:"￥280",
	// 	before:370,
	// 	star:5
	// });
	// //createProductLi(d2);
	//
	// var d3=({
	// 	father:discountUl1,
	// 	imgSrc:"img/discount3.jpg",
	// 	size:"整套房源",
	// 	name:"【睿吉景舍】解放碑/朝天门/两江交汇/弹子石老街4A景区内/60平复式5米超大落地窗江景房｣",
	// 	price:"￥110",
	// 	before:320,
	// 	star:5
	// });
	// // createProductLi(d3);
	//
	//
    // var d4=({
    // 	father:discountUl2,
    // 	imgSrc:"img/discount4.jpg",
    // 	size:"整套房源",
    // 	name:"【睿吉景舍】解放碑/朝天门/两江交汇/弹子石老街4A景区内/60平复式5米超大落地窗江景房｣",
    // 	price:"￥333",
    // 	before:450,
    // 	star:4
    // });
    // //createProductLi(d4);
	//
	// var d5=({
	// 	father:discountUl2,
	// 	imgSrc:"img/discount5.jpg",
	// 	size:"整套房源",
	// 	name:"【睿吉景舍】解放碑/朝天门/两江交汇/弹子石老街4A景区内/60平复式5米超大落地窗江景房｣",
	// 	price:"￥340",
	// 	before:450,
	// 	star:4
	// });
	// //createProductLi(d5);
	//
	// var d6=({
	// 	father:discountUl2,
	// 	imgSrc:"img/discount6.jpg",
	// 	size:"整套房源",
	// 	name:"【睿吉景舍】解放碑/朝天门/两江交汇/弹子石老街4A景区内/60平复式5米超大落地窗江景房｣",
	// 	price:"￥430",
	// 	before:560,
	// 	star:3
	// });
	// //createProductLi(d6);
	//
	// var dLi=$("#discount li");
	// for(var i=0;i<dLi.length;i++){
	// 	dLi.eq(i).attr("class","col-md-4")
	// }
	
	
	// 夏季游玩灵感版块
	var ideasUl1=$("#ideas .ideasUl1");
	// 使用createDiscountLi函数创建“夏季游玩灵感”板块的产品
	var i1=({
		father:ideasUl1,
		imgSrc:"../img/ideas1.jpg",
		size:"国内出行热点推荐",
		name:"去现场，看全球春夏有趣节日",
		price:"这个春夏，如果你喜欢玩点不一样，来这里就对了：避开赏樱大潮，跳进三年一度的日本濑户内海大型艺术祭；奔赴欧洲，看会穿又会玩的伦敦人如何复古大变身，或是朝圣鼎鼎大名的威尼斯双年展……和爱彼迎一起出发吧。",
		before:null,
		star:null
	});
	createProductLi(i1);
	
	var i2=({
		father:ideasUl1,
		imgSrc:"../img/ideas2.jpg",
		size:"清凉一夏推荐",
		name:"踏青正当时，莫负江南好春光",
		price:"春风十里，好景好食，春日与江南总是相得益彰。漫步在宏村的青石板古道，品尝西湖畔的时令春蔬，隐于莫干山的清幽山水间。在盎然春日，住进江南里，寻一处看得见风景的好住处，尽享理想中「向往的生活」。",
		before:null,
		star:null
	});
	createProductLi(i2);
	
	var i3=({
		father:ideasUl1,
		imgSrc:"../img/ideas3.jpg",
		size:"泛舟湖上推荐",
		name:"精选国内赏花地，春日暖洋洋",
		price:"春回大地，大自然比人更敏锐地感知这细微的变化。登高远眺，俯瞰漫山遍野的花海；或散步古镇乡间，感受千年古建与花苞绽放的时光碰撞。我们精选了 6 个国内赏花地，抓住春天，住进看得见风景的爱彼迎。",
		before:null,
		star:null
	});
	createProductLi(i3);
	
	
	// 热门目的地版块
	var hotUl1=$("#hot .hotUl1");
	var hotUl2=$("#hot .hotUl2");
	
	// 使用createDiscountLi函数创建热门目的地板块的产品
	var h1=({
		father:hotUl1,
		imgSrc:"../img/hot1.jpg",
		size:"整套房源",
		name:"【睿吉景舍】解放碑/朝天门/两江交汇/弹子石老街4A景区内/60平复式5米超大落地窗江景房｣",
		price:"￥480",
		before:590,
		star:5
	});
	createProductLi(h1);
	
	var h2=({
		father:hotUl1,
		imgSrc:"../img/hot2.jpg",
		size:"整套房源",
		name:"【睿吉景舍】解放碑/朝天门/两江交汇/弹子石老街4A景区内/60平复式5米超大落地窗江景房｣",
		price:"￥280",
		before:370,
		star:5
	});
	createProductLi(h2);
	
	var h3=({
		father:hotUl1,
		imgSrc:"../img/hot3.jpg",
		size:"整套房源",
		name:"【睿吉景舍】解放碑/朝天门/两江交汇/弹子石老街4A景区内/60平复式5米超大落地窗江景房｣",
		price:"￥110",
		before:320,
		star:5
	});
	createProductLi(h3);
	  
	   
	var h4=({
		father:hotUl1,
		imgSrc:"../img/hot4.jpg",
		size:"整套房源",
		name:"【睿吉景舍】解放碑/朝天门/两江交汇/弹子石老街4A景区内/60平复式5米超大落地窗江景房｣",
		price:"￥333",
		before:450,
		star:4
	});
	createProductLi(h4); 
	
	var h5=({
		father:hotUl2,
		imgSrc:"../img/hot5.jpg",
		size:"整套房源",
		name:"【睿吉景舍】解放碑/朝天门/两江交汇/弹子石老街4A景区内/60平复式5米超大落地窗江景房｣",
		price:"￥340",
		before:450,
		star:4
	});
	createProductLi(h5);
	
	var h6=({
		father:hotUl2,
		imgSrc:"../img/hot6.jpg",
		size:"整套房源",
		name:"【睿吉景舍】解放碑/朝天门/两江交汇/弹子石老街4A景区内/60平复式5米超大落地窗江景房｣",
		price:"￥430",
		before:560,
		star:3
	});
	createProductLi(h6);
	
	var h7=({
		father:hotUl2,
		imgSrc:"../img/hot7.jpg",
		size:"整套房源",
		name:"【睿吉景舍】解放碑/朝天门/两江交汇/弹子石老街4A景区内/60平复式5米超大落地窗江景房｣",
		price:"￥430",
		before:560,
		star:3
	});
	createProductLi(h7);
	
	var h8=({
		father:hotUl2,
		imgSrc:"../img/hot8.jpg",
		size:"整套房源",
		name:"【睿吉景舍】解放碑/朝天门/两江交汇/弹子石老街4A景区内/60平复式5米超大落地窗江景房｣",
		price:"￥430",
		before:560,
		star:3
	});
	createProductLi(h8);
	
	var hLi=$("#hot li");
	for(var j=0;j<hLi.length;j++){
		hLi.eq(j).attr("class","col-md-3")
	}
	
	
	

	
    

</script>
<script src="../js/theme.js" charset="UTF-8"></script>
