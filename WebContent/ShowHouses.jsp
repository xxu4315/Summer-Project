<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ShowHouses</title>
<script>
function show(){
    document.getElementById('show').style.display='block';
    }
function hide(){
    document.getElementById('show').style.display='none';
    }
</script>
<style>
.show{
    line-height:100px;
    text-align:center;
    width:100px;
    height:100px;
    background:#95C8ED;
    }
</style>
</head>
 
<body>
<table>
</table>
<!--<div class="k">
    <a href="#" onMouseOver="show()" onMouseOut="hide()">title: ${houseList.get(0).gettitle()} </a>
    <div id="show" class="show"  style="display:none" >
     ${houseList.get(0).gettitle()} 
    </div>
</div>
-->
<table id="table" width="393" border="1" height="37">
<c:forEach var="bean" items="${houseList}">
  <!--   <div class="k">
    <a href="#" onMouseOver="show()" onMouseOut="hide()">title: ${bean.gettitle()} </a>
    <div id="show" class="show"  style="display:none" > 
        </div>
</div>
    -->
<tr>
<td width="8%" height="16">&nbsp;</td>
<td width="21%" align="left">
<input type="text" name="rss_ids" id="rss_ids"  value="${bean.gettitle()}"/>
<br/> 
${bean.gethouseinfo()}
<br/> 
${bean.geth_location()}
<br/> 
${bean.geth_area()}
<br/> 
${bean.gethousetype()}
<br/> 
${bean.getid()}
<br/> 
${bean.getwechatid()}
<br/> 
${bean.getsex()}
<br/> 
${bean.getqq()}
<br/> 
${bean.getphonenumber()}
<br/> 
${bean.getprice()}
<br/> 
${bean.getroomtype()}
<br/> 
</td>
</tr>
</c:forEach>
 </table>
</body>
</html>