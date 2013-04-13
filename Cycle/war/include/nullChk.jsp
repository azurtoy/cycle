<%!
//nullcheck function
public static String nullcheck(String str) throws Exception {

if (str == null){
return "";
}else{
return str;     // string을 그대로 return
}
}

%>