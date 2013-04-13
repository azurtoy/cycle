<!--JSP 헤더 -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../HdFt/jsp_header.jsp" %>

<!--헤더, 이미지, 메뉴 -->
<jsp:include page="../HdFt/header.jsp" flush="true"></jsp:include>
<jsp:include page="sub_img.jsp" flush="true"></jsp:include>
<jsp:include page="left_menu.jsp" flush="true"></jsp:include>

<!--NULL 체크 -->
<%@include file="../include/nullChk.jsp" %>
<%
String check = nullcheck((String)request.getAttribute("id_check")); //CheckId 서블릿으로부터 중복체크결과받음
String id = nullcheck((String)request.getAttribute("id")); //CheckId 서블릿으로부터 아이디값도받음
String message = ""; //결과 메세지
//중복되지 않았을 경우
if (check == "success") { 
	message = "사용하셔도 되는 아이디 입니다.";
}
//아이디가 중복됬을경우
else if (check == "fail") {
	message = "이미 사용중인 아이디 입니다.";	
}
%>


<!-- 중복체크, 저장, 취소 스크립트 -->
<script language="javascript">
  
  //중복체크
  function idcheck() {
	  var theForm = document.frm;
	  
	  if(theForm.id.value=="") {
		  alert("id!!");
		  theForm.id.focus();
	  }
	  else {
		  theForm.action="/checkId";
		  theForm.submit();
	  }
    }

//저장
 function go_save(re_id)
 {
	var theForm = document.frm;

	if (theForm.id.value=="") 
		  { 
		     alert("id!");
			 theForm.id.focus();
		  }
	else if (theForm.id.value != re_id) 
		  { 
		    alert ("dup.check!");
			theForm.id.focus();
		   }
    else if (theForm.pwd.value=="" || theForm.re_pwd.value=="" )
		  {
		    alert("password!");
			 theForm.pwd.focus();
		  }
	else if (theForm.pwd.vaule != theForm.re_pwd.vaule) //비밀번호 확인
		{
			alert("check password");
			theForm.pwd.focus();
		}
	else if (theForm.name.value=="")
		  {
		    alert("name!");
			 theForm.name.focus();
		 }
    else if (theForm.email.value=="" || theForm.re_email.value=="")
		  {
		    alert("email!");
			 theForm.email.focus();
		 }
	else if (theForm.email.vaule != theForm.re_email.vaule) //이메일확인
		{
			alert("check email");
			theForm.email.focus();
		}
	else
	 {
		confirm("이대로 가입함 진짜?");
	     theForm.action="/memberSave";
		 theForm.submit();
	 }
 }
</script>

<!-- 회원가입 폼 -->
<article id="contents">
    
<h1>Join Us </h1>
<form name="frm" id ="join" method="post">    
<fieldset>
<legend>Basic Info</legend>
<label>User ID</label> <input name="id" type="text" class="id" value=<%=id %>> <a href="#" onclick="javascript:idcheck()"><input type="button" value="중복확인" class="dup"></a> <%=message %><br>
<label>Password</label> <input name="pwd" type="password" class="pass"><br>
<label>Retype Password</label> <input name="re_pwd" type="password" class="pass"><br>
<label>Name</label> <input name="name" type="text" class="nick"><br>
<label>E-Mail</label> <input name="email" type="email" class="email" ><br>
<label>Retype E-mail</label> <input name="re_email" type="email" class="email"><br>
</fieldset>


<fieldset>
<legend>Optional</legend>
<label>Address</label> <input name="address" type="text" class="address"><br>
<label>Phone Number</label> <input name="phone" type="tel" class="phone"><br>
<label>Mobile Phone Number</label> <input name="mobile" type="tel" class="mobile"><br>
<input type="hidden", name="re_id" value=<%=id %>>
</fieldset>

<div class="clear"></div>
<div id="buttons">
<input name="save_button" type="button" value="Submit" class="submit" onClick="javascript:go_save(frm.re_id.value)"> <input name="cancel_button" type="button" value="Cancel" class="cancel">
</div>

</form> 
    
</article>
<!-- 풋터 -->
<jsp:include page="../HdFt/footer.jsp" flush="true"></jsp:include>
