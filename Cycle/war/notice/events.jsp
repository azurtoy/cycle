<!--JSP 헤더 -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../HdFt/jsp_header.jsp" %>

<!-- 권한 세션 -->


<!-- 디비로부터 데이터 받아오기 -->

<!-- 헤더, 사진, 좌측메뉴 -->
<jsp:include page="../HdFt/header.jsp" flush="true"></jsp:include>
<jsp:include page="sub_img.jsp" flush="true"></jsp:include>
<jsp:include page="left_menu.jsp" flush="true"></jsp:include>

<script language="javascript">

//스크립트들
  function go_write()  //쓰기
  {
		<!-- 관리자일때 -->
		var theForm = document.frm;
		theForm.action ="./notice/events_write.jsp";
		theForm.submit();
  }
//내용보는거
  function go_view(seq)
  {
	var theForm = document.frm;
	theForm.seq.value = seq;
	theForm.action ="/boardView";
	theForm.submit();
  }

</script>

<!--게시판 폼, 바디-->

<article>
<form name="frm" method="post" >
<input type="hidden" name="seq">

<h1>Events</h1>
<table id="board" border="1" width="524">
	<tr>
		<th scope="col" class="tno">no.</th>
		<th scope="col" class="ttitle">title</th>
		<th scope="col" class="twrite">writer</th>
		<th scope="col" class="tdate">date</th>
		<th scope="col" class="tread">read</th>
	</tr>

            <c:forEach items="${test_board}" var="results">

            <tr>
        	<td width="98" height="11"><font size="2"><c:out value="${results.seq}"/>
</font></td>
        	<td width="293" height="23" class="left">
        	<font size="2">
        		<a href="#" onClick="javascript:go_view(<c:out value="${results.seq}"/>)">
        				<c:out value="${results.subject}"/>
                </a>
        	</font>
        	</td>
        	<td width="111" height="23"><font size="2"><c:out value="${results.user}"/></font></td>
        	<td width="111" height="23"><font size="2"><c:out value="${results.postdateStr}"/></font></td>
        	<td width="111" height="23"><font size="2"><c:out value="${results.viewcount}"/></font></td>
        </tr>   

        </c:forEach>

</table>
<table border="0" width="524">
<tr>
<td align="center">
	<!--pageCount.jsp 불러오기-->
	<%// include file="../include/pageCount.jsp"%>
</td>
</tr>
</table>
<table border="0" width="524">
<tr>
	<td width="524">
		<!--글작성버튼-->
		<input type="button" name="btn_save" value="write" onClick="go_write()">
	</td>
</tr>
</table>
</form>
</article>

<!-- 푸터 -->
<jsp:include page="../HdFt/footer.jsp" flush="true"></jsp:include>