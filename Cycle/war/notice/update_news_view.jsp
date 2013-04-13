<!--JSP 헤더 -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../HdFt/jsp_header.jsp" %>

<!--디비 받기-->


<!--헤더, 이미지, 메뉴 -->
<jsp:include page="../HdFt/header.jsp" flush="true"></jsp:include>
<jsp:include page="sub_img.jsp" flush="true"></jsp:include>
<jsp:include page="left_menu.jsp" flush="true"></jsp:include>

<!-- 수정 삭제 목록 스크립트 -->
<script language="javascript">

	
	//$(document).ready(function() {
	 <%//r_read += 1;
		//조회수
	//	sql="update update_news ";
	//	sql+="set read_num='"+r_read+"' where seq='"+seq+"'";
	//	stmt.executeUpdate(sql); 
	// %>;
//});
	//목록
   function go_list()
   {
		var theForm = document.frm;
		theForm.action="./update_news.jsp";
		theForm.submit();
   }
	//수정
   function go_mod(seq,id1,id2)
   {
       if(id1==id2 || id2 == "admin")
	   {
		   var theForm = document.frm;

			theForm.seq.value=seq;
			theForm.action="./update_news_modify.jsp";
			theForm.submit();
	   }
	   else
	   {
			alert('no right to modify');
	   }

   }
	//삭제
   function go_del(seq)
   {
		   var theForm = document.frm;
			theForm.seq.value=seq;
			theForm.action="/boardDelete";
			theForm.submit();
   }
</script>

<!-- 내용보기 폼 -->
<article>
<form name="frm" method="post">
<input type="hidden" name="seq">

<h1>Update News</h1>

<table id = "board" border="1" width="396" cellpadding="0" cellspacing="0">
    <tr>
        <th width="108" align="center" bgcolor="#C0C0C0" height="23">subject</th>
        <td width="272">
         		${test_board.subject}
		</td>
    </tr>
	 <tr>
        <th width="108" align="center" bgcolor="#C0C0C0" height="23">date</th>
        <td width="272">
         		${test_board.posttimeStr}
		</td>
    </tr>
	 <tr>
        <th width="108" align="center" bgcolor="#C0C0C0" height="23">read</th>
        <td width="272">
         		${test_board.seq}
		</td>
    </tr>
    <tr>
        <th width="108" align="center" bgcolor="#C0C0C0" height="23">contents</th>
        <td width="272">
		${test_board.content}
		  
	  </td> 
    </tr>
 </table>

<br>

<table border="0" width="394">
    <tr>
        <td width="384" align="center">
		
		<!-- <input type="button" name="btn_mod" value="modify" onClick="go_mod()">-->
		 <input type="button" name="btn_list" value="list" onClick="go_list()">
		 <input type="button" name="btn_del" value="delete" onClick="go_del(${test_board.seq})">
		
		</td>
    </tr>
</table>
</form>
</article>

<!-- 풋터 -->
<jsp:include page="../HdFt/footer.jsp" flush="true"></jsp:include>
