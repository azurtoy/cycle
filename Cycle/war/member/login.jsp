<!--JSP 헤더 -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../HdFt/jsp_header.jsp" %>

<!--헤더, 이미지, 메뉴 -->
<jsp:include page="../HdFt/header.jsp" flush="true"></jsp:include>
<jsp:include page="sub_img.jsp" flush="true"></jsp:include>
<jsp:include page="left_menu.jsp" flush="true"></jsp:include>

<!--NULL 체크 -->
<%@include file="../include/nullChk.jsp" %>

<!--로긴 스크립트 -->
<script language="javascript">
  
  function go_login()
  {
	var theForm  = document.frm;

	if(theForm.id.value =='')
	{
		alert('id!');
	}
	else if(theForm.pwd.value =='')
	{
		alert('password!');
	}
	else
	{
		theForm.action="/memberCheck";
		theForm.submit();
	}
  }

  function go_join()
  {
	var theForm  = document.frm;
	theForm.action="join.jsp";
	theForm.submit();
  }

</script>

<!-- 로긴 폼 -->
<article id="contents">
    
<h1>Log in</h1>
<form name="frm" id ="login" method="post">    
	<fieldset>
		<legend></legend>
		<label>ID</label> <input name="id" type="text" class="id"><br>
		<label>Password</label> <input name="pwd" type="password" class="pass"><br>
	</fieldset>

	<div class="clear"></div>
	<div id="buttons">
		<input name="login_button" type="button" value="Log In" class="submit" onClick="go_login()"> 
		<input name="join_button" type="button" value="Join" class="cancel" onclick="go_join()">
	</div>

</form> 
    
</article>

<!-- 풋터 -->
<jsp:include page="../HdFt/footer.jsp" flush="true"></jsp:include>