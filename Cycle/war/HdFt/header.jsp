<!--세션 -->
<% String session_id = (String)session.getAttribute("id"); %>
<% String session_auth = (String)session.getAttribute("auth"); %>

<!DOCTYPE HTML>
<head>
<meta http-equiv="Content-Type" content="text/html; euc-kr">
<title> test </title>
 <!-- css, 제이쿼리 등 -->
<link href="../CSS/default.css" rel="stylesheet" type="text/css" media="all">
<link href="../CSS/subpage.css" rel="stylesheet" type="text/css"  media="all">
<link href="../CSS/front.css" rel="stylesheet" type="text/css" media="all">
<link rel="shortcut icon" href="../favicon.ico" type="image/x-icon"/>
<script type="text/javascript" src="../script/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../script/jquery.easing.1.3.js"></script>
</head>

<!-- 제이쿼리 스크립트 -->
<script type="text/javascript">
            $(function() {
				/**
				* for each menu element, on mouseenter, 
				* we enlarge the image, and show both sdt_active span and 
				* sdt_wrap span. If the element has a sub menu (sdt_box),
				* then we slide it - if the element is the last one in the menu
				* we slide it to the left, otherwise to the right
				*/
                $('#sdt_menu > li').bind('mouseenter',function(){
					var $elem = $(this);
					$elem.find('img')
						 .stop(true)
						 .animate({
							'width':'170px',
							'height':'170px',
							'left':'0px'
						 },400,'easeOutBack')
						 .andSelf()
						 .find('.sdt_wrap')
					     .stop(true)
						 .animate({'top':'140px'},500,'easeOutBack')
						 .andSelf()
						 .find('.sdt_active')
					     .stop(true)
						 .animate({'height':'170px'},300,function(){
						var $sub_menu = $elem.find('.sdt_box');
						if($sub_menu.length){
							var left = '170px';
							if($elem.parent().children().length == $elem.index()+1)
								left = '-170px';
							$sub_menu.show().animate({'left':left},200);
						}	
					});
				}).bind('mouseleave',function(){
					var $elem = $(this);
					var $sub_menu = $elem.find('.sdt_box');
					if($sub_menu.length)
						$sub_menu.hide().css('left','0px');
					
					$elem.find('.sdt_active')
						 .stop(true)
						 .animate({'height':'0px'},300)
						 .andSelf().find('img')
						 .stop(true)
						 .animate({
							'width':'0px',
							'height':'0px',
							'left':'85px'},400)
						 .andSelf()
						 .find('.sdt_wrap')
						 .stop(true)
						 .animate({'top':'25px'},500);
				});
            });
</script>
<body>
<div id = "wrap">
	<header>

<!-- 로긴세션설정  -->

<%
if ("".equals (session_id) || session_id == null) {
%>
	<jsp:include page="not_logged_in.jsp" flush="true"></jsp:include>
<%
	}
else {
%>
	<div id ="login">
	<% out.println("Hello '"+session_id+"' :) ");%>
	<jsp:include page="logged_in.jsp" flush="true"></jsp:include>
<%
	}
%>
	
		<!-- 로고-->
		<div id = "logo"><a href="../index.jsp" alt=""><img src = "../images/logo2.png"  alt="cycle" border=0></a></div> 

		<div class="clear"></div>
		<!-- 메뉴-->
		<div class="content">
						<ul id="sdt_menu" class="sdt_menu">
				<li>
					<a href="../notice/update_news.jsp">
						<img src="../images/2.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link">Notice</span>
							<span class="sdt_descr">Get to know me</span>
						</span>
					</a>
					<div class="sdt_box">
							<a href="/board">Update News</a>
							<a href="../notice/events.jsp">Events</a>
							<a href="../notice/info.jsp">Info</a>
					</div>
				</li>
				<li>
					<a href="../user/user_info.jsp">
						<img src="../images/1.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link">User</span>
							<span class="sdt_descr">My work</span>
						</span>
					</a>
					<div class="sdt_box">
							<a href="../user/user_info.jsp">User Info</a>
							<a href="../user/payments.jsp">Payments</a>
					</div>
				</li>
				<li>
					<a href="../cycle/map.jsp">
						<img src="../images/3.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link">Cycle</span>
							<span class="sdt_descr">Where ideas get born</span>
						</span>
					</a>
					<div class="sdt_box">
							<a href="../cycle/map.jsp">Map</a>
							<a href="../cycle/speed.jsp">Speed</a>
							<a href="../cycle/reservation.jsp">Reservation</a>
					</div>
				</li>
				<li>
					<a href="../donation/state.jsp">
						<img src="../images/4.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link">Donation</span>
							<span class="sdt_descr">I like to photograph</span>
						</span>
					</a>
					<div class="sdt_box">
							<a href="../donation/state.jsp">State</a>
							<a href="../donation/sum.jsp">Sum</a>
					</div>
				</li>
				<li>
					<a href="../log/call.jsp">
						<img src="../images/5.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link">Log</span>
							<span class="sdt_descr">I write about design</span>
						</span>
					</a>
					<div class="sdt_box">
							<a href="../log/call.jsp">Call</a>
							<a href="../log/info.jsp">Info</a>
							<a href="../log/login.jsp">Login</a>
					</div>
				</li>
				<li>
					<a href="../service/board.jsp">
						<img src="../images/6.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link">Service</span>
							<span class="sdt_descr">I like to code</span>
						</span>
					</a>
				</li>
			</ul>
		</div>
	</header>
	<div class="clear"></div>