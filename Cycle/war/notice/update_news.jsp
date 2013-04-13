<!--JSP 헤더 -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../HdFt/jsp_header.jsp" %>

<!-- 권한 세션 -->


<!-- 디비로부터 데이터 받아오기 -->

<%
/* 기존 디비 연동
String listSql="select seq,subject,writer_id,date,read_num from update_news ";
String pageCountQuery = "select count(seq) from update_news";

// 변수
int view_rows =10;					  //몇줄 보여줄지
int total_pages =1;                   //총 몇페이진지 (default 1)
int tpage=1;                          //페이지.머드라 (default 1)

String url = "";
url = "./update_news.jsp?tpage=";

if (!"ok".equals(request.getParameter("fullview")) && request.getParameter("tpage") != null) //페이지수
tpage = Integer.parseInt(request.getParameter("tpage"));

if (!"ok".equals(request.getParameter("fullview")))
listSql += " limit "+((tpage-1)*view_rows)+","+view_rows;

*/
%>

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
		theForm.action ="./notice/update_news_write.jsp";
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

<h1>Update News</h1>
<table id="board" border="1" width="524">
	<tr>
		<th scope="col" class="tno">no.</th>
		<th scope="col" class="ttitle">title</th>
		<th scope="col" class="twrite">writer</th>
		<th scope="col" class="tdate">date</th>
		<th scope="col" class="tread">read</th>
	</tr>
<!--while문 돌려서 끝날때까지 내용 받기.-->
<%
//int num=1;

//if (!"ok".equals(request.getParameter("fullview")))
//   num = ((tpage-1)*view_rows)+1;
%>
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