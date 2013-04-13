<!-- JSP 공통 헤더 -->
<%@ include file="../HdFt/jsp_header.jsp" %>

<!-- 헤더, 서브이미지, 메뉴 -->
<jsp:include page="../HdFt/header.jsp" flush="true"></jsp:include>
<jsp:include page="sub_img.jsp" flush="true"></jsp:include>
<jsp:include page="left_menu.jsp" flush="true"></jsp:include>


<!-- 저장 스크립트 -->
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
			theForm.action ="./events_save.jsp"
			theForm.submit();
		    }
	   }
   }

   function go_cancle()
   {
		var theForm = document.frm;
		theForm.action="./events.jsp";
		theForm.submit();
   }
</script>


<article>
<!-- 글쓰기 폼 -->
<form name="frm" method="post">
	<table border="1" width="396">
		<tr>
			<td width="108"><font size="2">subject</font></td>
			<td width="272">
			 <font size="2">
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

<!-- 푸터 -->
<jsp:include page="../HdFt/footer.jsp" flush="true"></jsp:include>