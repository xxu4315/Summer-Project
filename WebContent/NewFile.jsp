<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>jQuery漂亮的淘宝网商品展示效果丨芯晴网页特效丨CsrCode.Cn</title>
<meta http-equiv="content-type" content="text/html;charset=gb2312">
<!--把下面代码加到<head>与</head>之间-->
<style type="text/css">
BODY {
 PADDING-RIGHT: 0px; PADDING-LEFT: 0px; FONT-SIZE: 12px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; TEXT-ALIGN: left
}
UL {
 PADDING-RIGHT: 0px; PADDING-LEFT: 0px; FONT-SIZE: 12px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; LIST-STYLE-TYPE: none
}
LI {
 PADDING-RIGHT: 0px; PADDING-LEFT: 0px; FONT-SIZE: 12px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; LIST-STYLE-TYPE: none
}
IMG {
 BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px
}
.sidebar2 .tabtitle {
 BACKGROUND-IMAGE: url(/html/txdm_2/images/20100920/T10oNhXlHZedPC95UP-230-300.png); BACKGROUND-REPEAT: no-repeat
}
.sidebar2 .tabtitle LI {
 BACKGROUND-IMAGE: url(/html/txdm_2/images/20100920/T10oNhXlHZedPC95UP-230-300.png); BACKGROUND-REPEAT: no-repeat
}
.tabcontent LI.cur {
 BACKGROUND-IMAGE: url(/html/txdm_2/images/20100920/T10oNhXlHZedPC95UP-230-300.png); BACKGROUND-REPEAT: no-repeat
}
.tabcontent LI I {
 BACKGROUND-IMAGE: url(/html/txdm_2/images/20100920/T15oNhXfY0edP3Uhgj-60-100.gif); BACKGROUND-REPEAT: no-repeat
}
.sidebar2 .tabtitle {
 BACKGROUND-POSITION: 0px -37px; PADDING-LEFT: 10px; WIDTH: 220px; COLOR: #640000; LINE-HEIGHT: 30px; HEIGHT: 30px
}
.sidebar2 {
 CLEAR: both; MARGIN-TOP: 5px
}
.sidebar2_div {
 BORDER-RIGHT: #ebebeb 1px solid; BORDER-TOP: #ebebeb 1px; BORDER-LEFT: #ebebeb 1px solid; BORDER-BOTTOM: #ebebeb 1px solid
}
.sidebar2_div A {
 COLOR: #0048ff
}
.sidebar2 {
 MARGIN-TOP: 15px
}
.sidebar2_div {
 WIDTH: 228px
}
.sidebar2 .tabtitle LI {
 BACKGROUND-POSITION: -81px -77px; MARGIN-TOP: 6px; FLOAT: left; LINE-HEIGHT: 23px; MARGIN-RIGHT: 4px
}
.sidebar2 .tabtitle LI A {
 DISPLAY: block; FONT-WEIGHT: bolder; FONT-SIZE: 14px; WIDTH: 68px; COLOR: #640000; HEIGHT: 23px; TEXT-ALIGN: center; TEXT-DECORATION: none
}
.sidebar2 .tabtitle LI.cur {
 BACKGROUND-POSITION: 0px -77px; HEIGHT: 24px
}
.tabcontent {
 DISPLAY: none; PADDING-TOP: 5px
}
.cur_tabcontent {
 DISPLAY: block
}
.tabcontent LI {
 CLEAR: both; LINE-HEIGHT: 33px
}
.tabcontent LI.even {
 BORDER-TOP: #e9e9e9 1px solid; BORDER-BOTTOM: #e9e9e9 1px solid; BACKGROUND-COLOR: #f0f0f0
}
.tabcontent LI.odd {
 
}
.tabcontent LI I {
 MARGIN-TOP: 8px; FLOAT: left; MARGIN-LEFT: 7px; WIDTH: 19px; LINE-HEIGHT: 19px; MARGIN-RIGHT: 8px; FONT-STYLE: normal; HEIGHT: 19px; TEXT-ALIGN: center
}
.tabcontent LI I.i_yeicon {
 BACKGROUND-POSITION: 0px 0px
}
.tabcontent LI I.i_graycon {
 BACKGROUND-POSITION: -24px 0px
}
.tabcontent LI A {
 FONT-SIZE: 14px; TEXT-DECORATION: none
}
.tabcontent LI A:hover {
 TEXT-DECORATION: underline
}
.tabcontent LI.cur {
 BORDER-TOP-WIDTH: 0px; BACKGROUND-POSITION: 0px -112px; BORDER-LEFT-WIDTH: 0px; LEFT: -1px; BORDER-BOTTOM-WIDTH: 0px; WIDTH: 230px; LINE-HEIGHT: 15px; PADDING-TOP: 6px; POSITION: relative; HEIGHT: 64px; BORDER-RIGHT-WIDTH: 0px
}
.tabcontent LI.cur IMG {
 FLOAT: left
}
.tabcontent LI.cur I {
 MARGIN-TOP: 20px; MARGIN-RIGHT: 0px
}
.tabcontent LI.cur A {
 FONT-WEIGHT: bolder; FONT-SIZE: 12px
}
.tabcontent LI.cur SPAN {
 FONT-WEIGHT: bolder; COLOR: #c70202
}
</style>
<script type="text/javascript">
(function(){
  var str=window.location.href;
    var pid= str.match(/pid=mm_\d{0,10}_\d{0,10}_\d{0,10}/i);
    //alert(pid);
    if(pid){
      pid = pid[0].split("=")[1]
      var reg=new RegExp("pid=mm_13110335_0_0","gmi");
      var as   =   document.getElementsByTagName("A");
      for(var   i   =   0;   i <   as.length;   i   ++){
        as[i].href=as[i].href.replace(reg,"pid="+pid);
      } 
      document.body.innerHTML =document.body.innerHTML.replace(reg,"pid="+pid)
   }
})();
</script>
<script type="text/javascript" src="/html/txdm_2/images/20100920/jquery-1.3.2.min.js"></script>
<script type="text/javascript">
$(function(){
    $(".tabcontent li:odd").addClass("even");
    $(".tabcontent li").each(function(){
        $this = $(this);
        $this.mouseover(function(){
          if($(this).hasClass("cur")){return true;}
         $(this).siblings("li").removeClass("cur");
         $(this).siblings("li").find("img").css("display", "none");
         $(this).siblings("li").find("span").css("display", "none");
         $(this).addClass("cur");
         $(this).find("img").css("display", "block");
         $(this).find("span").css("display", "block");
          return false;
        });
    });
    $(".tabcontent li img,.tabcontent li span").css("display", "none");
    $(".tabcontent li.cur img,.tabcontent li.cur span").css("display", "block");
    $(".tabtitle li").each(function(){
        $this = $(this);
        $this.mouseover(function(){
            $(this).siblings("li").removeClass("cur");
            $(this).addClass("cur");
            var $cur_id_num = $(this).attr("id").slice(-1);
            $(".tabcontent").removeClass("cur_tabcontent");
            $("#tabcontent" + $cur_id_num).addClass("cur_tabcontent");
        });
    });
});
</script>
</head>
<body>
<br>预览效果时左下角会提示错误，而且看不到效果，刷新一下就可以看到效果了；当然，在实际使用中，不会出现这样的问题。<br><br>
<!--把下面代码加到<body>与</body>之间-->
<DIV class="sidebar2" style="MARGIN-TOP: 0px; WIDTH: 230px; HEIGHT: 420px">
 <UL class="tabtitle">
  <LI class="cur" id="tabtitle1"><A href="http://search8.taobao.com/browse/search_easy.htm?keyword=凉鞋&catid=50006843&refpid=mm_13110335_0_0&isinner=0&t=0e9b9a8d1" target="_blank">淘气榜</A></LI>
 </UL>
 <DIV class="sidebar2_div">
  <UL class="tabcontent cur_tabcontent" id="tabcontent1">
   <LI><I class="i_yeicon">1</I> <A href="http://search8.taobao.com/browse/search_easy.htm?keyword=通勤+女包&catid=50006842&refpid=mm_13110335_0_0&isinner=0&t=43b895ca1" target="_blank"><IMG height="62" alt="" src="/html/txdm_2/images/20100920/product.jpg" width="72"><A href="http://search8.taobao.com/browse/search_easy.htm?keyword=通勤+女包&catid=50006842&refpid=mm_13110335_0_0&isinner=0&t=43b895ca1" target="_blank">知性OL－简约大方通勤必备</A> <SPAN>淘宝价：46元</SPAN> 
   <LI><I class="i_yeicon">2</I> <A href="http://search8.taobao.com/browse/search_easy.htm?keyword=帆布+女包&catid=50006842&refpid=mm_13110335_0_0&isinner=0&t=e977824c1" target="_blank"><IMG height="62" alt="" src="/html/txdm_2/images/20100920/product.jpg" width="72"><A href="http://search8.taobao.com/browse/search_easy.htm?keyword=帆布+女包&catid=50006842&refpid=mm_13110335_0_0&isinner=0&t=e977824c1" target="_blank">英伦风－百搭帆布帅气单肩包</A> <SPAN>淘宝价：88元</SPAN> 
   <LI><I class="i_yeicon">3</I> <A href="http://search8.taobao.com/browse/search_easy.htm?keyword=女包+手拿&catid=50006842&refpid=mm_13110335_0_0&isinner=0&t=b06719191" target="_blank"><IMG height="62" alt="" src="/html/txdm_2/images/20100920/product.jpg" width="72"><A href="http://search8.taobao.com/browse/search_easy.htm?keyword=女包+手拿&catid=50006842&refpid=mm_13110335_0_0&isinner=0&t=b06719191" target="_blank">淑女系－可爱小女生最爱</A> <SPAN>淘宝价：29元</SPAN> </LI>
   <LI class="cur"><I class="i_yeicon">4</I> <A href="http://search8.taobao.com/browse/search_easy.htm?keyword=双肩包+女&catid=50006842&refpid=mm_13110335_0_0&isinner=0&t=f003c4aa1" target="_blank"><IMG height="62" alt="" src="/html/txdm_2/images/20100920/product.jpg" width="72"><A href="http://search8.taobao.com/browse/search_easy.htm?keyword=双肩包+女&catid=50006842&refpid=mm_13110335_0_0&isinner=0&t=f003c4aa1" target="_blank">学院风－日系流行时尚双肩包</A> <SPAN>淘宝价：55元</SPAN> 
   <LI><I class="i_graycon">5</I><A href="http://search8.taobao.com/browse/search_easy.htm?keyword=斜挎+女包&catid=50006842&refpid=mm_13110335_0_0&isinner=0&t=6363e72f1" target="_blank"><IMG height="62" alt="" src="/html/txdm_2/images/20100920/product.jpg" width="72"><A href="http://search8.taobao.com/browse/search_easy.htm?keyword=斜挎+女包&catid=50006842&refpid=mm_13110335_0_0&isinner=0&t=6363e72f1" target="_blank">时尚派－柱形手提斜挎女包</A> <SPAN>淘宝价：125元</SPAN> 
   <LI><I class="i_graycon">6</I> <A href="http://search8.taobao.com/browse/search_easy.htm?keyword=蝴蝶&catid=50006843&refpid=mm_13110335_0_0&isinner=0&t=78fddf1f1" target="_blank"><IMG height="62" alt="" src="/html/txdm_2/images/20100920/product.jpg" width="72"><A href="http://search8.taobao.com/browse/search_easy.htm?keyword=蝴蝶&catid=50006843&refpid=mm_13110335_0_0&isinner=0&t=78fddf1f1" target="_blank">蝴蝶结－闪金淡蓝可爱单鞋</A> <SPAN>淘宝价：89元</SPAN> 
   <LI><I class="i_graycon">7</I> <A href="http://search8.taobao.com/browse/search_easy.htm?keyword=高跟+凉鞋&catid=50006843&refpid=mm_13110335_0_0&isinner=0&t=40e34fb31" target="_blank"><IMG height="62" alt="" src="/html/txdm_2/images/20100920/product.jpg" width="72"><A href="http://search8.taobao.com/browse/search_easy.htm?keyword=高跟+凉鞋&catid=50006843&refpid=mm_13110335_0_0&isinner=0&t=40e34fb31" target="_blank">高跟鞋－复古小名媛圆头鞋</A> <SPAN>淘宝价：53元</SPAN></LI>
  </UL>
 </DIV>
</DIV>
</body>
</html>

<p align="center">本特效由 <a href="http://www.CsrCode.cn">芯晴网页特效</a>丨CsrCode.Cn 收集于互联网，只为兴趣与学习交流，不作商业用途。</p>


