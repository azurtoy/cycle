<!--JSP 헤더 -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../HdFt/jsp_header.jsp" %>

<!-- 세션 -->
<% String session_id = (String)session.getAttribute("id"); %>

<!-- 헤더, 이미지, 메뉴 -->
<jsp:include page="../HdFt/header.jsp" flush="true"></jsp:include>
<jsp:include page="sub_img.jsp" flush="true"></jsp:include>
<jsp:include page="left_menu.jsp" flush="true"></jsp:include>


<!--저장,취소 스크립트 -->
<script language="javascript">
   function go_save()
   {
		var theForm = document.frm;

	   if(theForm.subject.value =='')
	   {
			alert('subject!');
			theForm.subject.focus();
	   }
	   else if(theForm.content.value =='')
	   {
		   alert('contents!');
		   theForm.content.focus();
	   }
	   else
	   {
			if(confirm('save?'))
		    {
			theForm.action ="/boardWrite"
			theForm.submit();
		    }
	   }
   }

   function go_cancle()
   {
		var theForm = document.frm;
		theForm.action="./update_news.jsp";
		theForm.submit();
   }
</script>


<article>
<!-- 글쓰기 폼 -->
<form name="frm" method="post">
<h1>Update News</h1>
	<table border="1" width="396">
		<tr>
			<td width="108"><font size="2">subject</font></td>
			<td width="272">
			 <font size="2">
			 <input type="hidden" name="user" value="me">
			 <input type="hidden" name="boardName" value="Update_News">
			<!-- <input type="hidden" name="seq" value="1">-->
				<input type="text" name="subject" size="39">
			</font>
			</td>
		</tr>
		<tr>
			<td width="108"><font size="2">contents</font></td>
			<td width="272">
			  <font size="2">
					<textarea name="content" rows="11" cols="39"></textarea>
			  </font>
		  </td> 
		</tr>
	</table>
	<table border="0" width="394">
		<tr>
			<td width="384" align="center">
			<font size="2">
			<!-- 저장,취소 버튼 -->
			 <input type="button" name="btn_save" value="save" onClick="go_save()">
			 <input type="button" name="btn_cancel" value="cancel" onClick="go_cancle()">
			</font>
			</td>
		</tr>
	</table>
</form>
</article>

<!--풋터 -->
<jsp:include page="../HdFt/footer.jsp" flush="true"></jsp:include>