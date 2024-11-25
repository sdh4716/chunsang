<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 반응형 quick_bnr [s] -->
<div id="quick_bnr">
    <div class="tit"><img src="img/quick/tit_icon.png" alt="퀵메뉴"><p>QUICK</p></div>
    <ul class="links">
        <li class="tel"><span>010<br>2585<br>6946</span><p>문의전화</p></li>
        <li><a href="reservation"><i class="fa fa-bookmark"></i><p>예약안내</p></a></li>
        <!-- <li><a href=""><i class="fa fa-calendar"></i><p>예약하기</p></a></li> -->
        <li><a href="room"><i class="fa fa-bed"></i><p>객실안내</p></a></li>        
        <!-- <li class="kakao_mo"><a href=""><i class="fa fa-comments-o"></i><p>카톡문의</p></a></li> -->
    </ul>
    <button class="toTop"><i class="fa fa-angle-up"></i>TOP</button>   
    <!-- <a class="kakao_pc" href="">
        <p><i class="fa fa-comments-o"></i><span>카톡문의</span></p>
        <img src="img/quick/kakao.jpg" alt="카카오 상담">
    </a> -->    
</div>    
<a id="fix_resv" href="reservation">예약문의<i class="fa fa-check"></i></a>    
<script>
    $('.toTop ').click(function(){
        $("html, body").animate({ scrollTop: 0 }, 400);
        return false;
    });	
    $(window).on("scroll",function(){
        if($(window).scrollTop() > 100) { 
            $('#fix_resv').addClass('active');}
        else{
            $('#fix_resv').removeClass('active');}
        return false;
    });
    // 스크롤시 퀵메뉴 
    $(window).on("scroll",function(){
        if($(window).scrollTop() > 350) { 
            $('#quick_bnr').addClass('fixed');}
        else{
            $('#quick_bnr').removeClass('fixed');
        }
        return false;
    });
</script>
<!-- 반응형 quick_bnr [e] -->