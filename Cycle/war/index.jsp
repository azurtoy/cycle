<%@page contentType= "text/html;charset = euc-kr"%>
<%@ page import="java.net.*,java.io.*,java.sql.*,java.util.*,javax.naming.*,javax.sql.DataSource" %>
<%request.setCharacterEncoding("utf-8");%>

<!-- 세션 -->
<% String session_id = (String)session.getAttribute("id"); %>
<!DOCTYPE HTML>
<%
String update_news = "update_news";%>
<head>
<meta http-equiv="Content-Type" content="text/html; euc-kr">
<title> test </title>

 <!-- CCS 링크 -->
<link href="./CSS/default.css" rel="stylesheet" type="text/css">
<link href="./CSS/front.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="./script/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="./script/jquery.easing.1.3.js"></script>
</head>

<!-- 간지 메뉴 jquery 스크립트 -->
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
           
       function go_board(menuName, boardName)
            {
          	var theForm = document.frm;
          	theForm.boardName.value=boardName;
          	theForm.menuName.value=menuName;
           	theForm.action ="/board";
          	theForm.submit();
            }
            
</script>

<body>
<div id = "wrap">
<header>

<!-- 로그인 세션관리  -->

<%
if ("".equals (session_id) || session_id == null) {
%>
		<!-- 로그인 -->
		<div id ="login"><a href="./member/login.jsp">login</a> | <a href="./member/join.jsp">join</a> | <a href="./etc/sitemap.jsp">sitemap</a></div>
		<div class="clear"></div>
<%
	}
else {
%>
		<!-- 로그아웃 -->
		<div id ="login">
		<% out.println("Hello '"+session_id+"' :) ");%>
		| <a href="/memberLogout">logout</a> | <a href="./etc/sitemap.jsp">sitemap</a></div>
		<div class="clear"></div>
<%
	}
%>

		<!-- 로고 -->
		<div id = "logo"><a href="./index.jsp" alt=""><img src = "./images/logo2.png" alt="cycle" border=0></a></div> 
		<div class="clear"></div>     
		
		
		<!-- 메뉴 -->
		<form name="frm" method="post">
		<input type="hidden" name="boardName" >
		<input type="hidden" name="menuName" >
		<div class="content">
			<ul id="sdt_menu" class="sdt_menu">
				<li>      	
					<a href="./notice/update_news.jsp">
						<img src="./images/2.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link">Notice</span>
							<span class="sdt_descr">Get to know me</span>
						</span>
					</a>
					<div class="sdt_box">
							<a href="#" onClick="javascript:go_board('notice','update_news')">Update News</a>
							<a href="#" onClick="javascript:go_board('notice','events')">Events</a>
							<a href="#" onClick="javascript:go_board('notice','info')">Info</a>
					</div>
				</li>
				<li>
					<a href="./user/user_info.jsp">
						<img src="./images/1.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link">User</span>
							<span class="sdt_descr">My work</span>
						</span>
					</a>
					<div class="sdt_box">
							<a href="./user/user_info.jsp">User Info</a>
							<a href="./user/payments.jsp">Payments</a>
					</div>
				</li>
				<li>
					<a href="./cycle/map.jsp">
						<img src="./images/3.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link">Cycle</span>
							<span class="sdt_descr">Where ideas get born</span>
						</span>
					</a>
					<div class="sdt_box">
							<a href="./cycle/map.jsp">Map</a>
							<a href="./cycle/speed.jsp">Speed</a>
							<a href="./cycle/reservation.jsp">Reservation</a>
					</div>
				</li>
				<li>
					<a href="./donation/state.jsp">
						<img src="./images/4.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link">Donation</span>
							<span class="sdt_descr">I like to photograph</span>
						</span>
					</a>
					<div class="sdt_box">
							<a href="./donation/state.jsp">State</a>
							<a href="./donation/sum.jsp">Sum</a>
					</div>
				</li>
				<li>
					<a href="./log/call.jsp">
						<img src="./images/5.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link">Log</span>
							<span class="sdt_descr">I write about design</span>
						</span>
					</a>
					<div class="sdt_box">
							<a href="./log/call.jsp">Call</a>
							<a href="./log/info.jsp">Info</a>
							<a href="./log/login.jsp">Login</a>
					</div>
				</li>
				<li>
					<a href="./service/board.jsp">
						<img src="./images/6.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link">Service</span>
							<span class="sdt_descr">I like to code</span>
						</span>
					</a>
				</li>
			</ul>
		</div>
	</form>
	</header>
	<div class="clear"></div>

<!-- 내용 -->
	<!-- 메인 그림 -->
	<div id="main_img">
	<img src="./images/main_img3.jpg" width="1020" height="308">
	</div>
	<div class="clear"></div>

	<!-- 뭔가 쓸거리들 -->
	<article id="front">
		<div id="solution">
			<div id="hosting">
				<h3>web hosting soution</h3>
					<p>Lorem...ut vel set </p>
					<p>Lorem...ut vel set </p>
					<p>Lorem...ut vel set </p>
					<p>Lorem...ut vel set </p>
					<p>Lorem...ut vel set </p>
			</div>
			<div id="security">
				<h3>web security solution</h3>
					<p>Lorem... whatsdmfskdfmlsdmfskdfms</p>
					<p>Lorem... whatsdmfskdfmlsdmfskdfms</p>
					<p>Lorem... whatsdmfskdfmlsdmfskdfms</p>
			</div>
			<div id="payment">
				<h3>web payment soul</h3>
					<p>Lorem.,, whatberv</p>
					<p>Lorem... whatsdmfskdfmlsdmfskdfms</p>
					<p>Lorem... whatsdmfskdfmlsdmfskdfms</p>
			</div>
			</div>
	<div class="clear"></div>

	<!-- 공지사항 이런거 -->
	<div id="sec_news">
		<h3><span class="orange">Security</span>news</h3>
		<dl>
			<dt>vivamsd msdkfmlsdfsdfsdf msdkf</dt>
			<dd>sdmkls msd msfsdfsdfsdkfl </dd>
				<dt>sdf sd ssdfsdfdfk mdf</dt>
			<dd> sd sd klsdsdfsdfsdfmf d </dd>
			<dt>vivamsd msdkfml msdkf</dt>

		</dl>
	</div>
	<div id="news_notice">
		<h3 class="brown">News &amp; notice</h3>
			<table>
			<tr>
			<td class="context"><a href="#"> vsfsdfsdfsivadm ksdfsdfsdfsdfsdfl</a> </th>
			<td> 2011.3.32 </th>
			</tr>

						<tr>
			<td><a href="#"> vsfsdfsdfsivadm ksdfsdfsdfsdfsdfl</a> </th>
			<td> 2011.3.32 </th>
			</tr>

						<tr>
			<td> <a href="#"> vsfsdfsdfsivadm ksdfsdfsdfsdfsdfl</a> </th>
			<td> 2011.3.32 </th>
			</tr>

						<tr>
			<td><a href="#"> vsfsdfsdfsivadm ksdfsdfsdfsdfsdfl</a></th>
			<td> 2011.3.32 </th>
			</tr>
			</table>
	</div>

	</article>
	<div class="clear"></div>

	<!-- 말그대로 푸터 -->
   <footer>  
        <hr>
        <div id="copy">
        All contents Copyright 2013 CycleGanzi Inc. all rights reserved<br>
        Contact mail : cycle@cycle.com Tel: +12 34 123 12345 Fax +11 12 123 4321
        </div>
        <div id="social">
        <img src="./images/facebook.gif" width="33" height="33" alt="Facebook"> <img src="./images/twitter.gif" width="33" height="34" alt="Twitter"></div>          
     </footer>
</div>
</body>
</html>