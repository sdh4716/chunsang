<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<%@include file="./comm/common_inc.jsp"%>
</head>
<body>

<!-- quick [s] -->
<!-- <ul id="quickList">
	<li><a href=""><img src="img/quick/icon1.png" alt="객식안내"><span>객실안내</span></a></li>
	<li><a href=""><img src="img/quick/icon2.png" alt="예약안내"><span>예약안내</span></a></li>
	<li><a href=""><img src="img/quick/icon3.png" alt="실시간예약"><span>실시간예약</span></a></li>
	<li><a href=""><img src="img/quick/icon4.png" alt="오시는길"><span>오시는길</span></a></li>
	<li class="kakao"><a href=""><img src="img/quick/kakao.png" alt="카톡문의"><span>카톡문의</span></a></li>
</ul> -->

<!-- sh_wrapper [s] -->
<div id="sh_wrapper">
    
    <!-- sh_hd [s] -->
    <div id="sh_hd" class="main">
    	<%@include file="./comm/header.jsp"%>    
    </div>
    <!-- sh_hd [e] -->

    <!-- sh_container [s] -->
    <div id="sh_container" class="main">
        <!-- sh_container_wrapper [s] -->
        <div id="sh_container_wrapper">

            <!-- main_banner [s] -->
            <div id="main_banner" data-aos="fade-left" data-aos-duration="1000">
                <div id="mainVisual">
                    <div class="txt_area">
                        <p class="txt1">Heavenly Garden Pension</p>
                        <p class="txt2">여유로움을 느낄 수 있는 그 곳</p>
                        <p class="txt3">지리산의 아름다운 자연을 담은 천상화원 펜션이,<br />품격을 더해 새롭게 태어납니다.</p>
                    </div>
                    <div class="timeline">
                        <div class="swiper-hero-progress"></div>
                        <div class="slider_pager"></div>
                    </div>
                    <div class="main_slider swiper-container">
                        <ul class="slider swiper-wrapper">
                            <li class="img1 swiper-slide"></li>
                            <li class="img2 swiper-slide"></li>
                        </ul>
                    </div>  
                </div>
                <script>
                var getTimeout = function(){var e=setTimeout,b={};setTimeout=function(a,c){var d=e(a,c);b[d]=[Date.now(),c];return d};return function(a){return(a=b[a])?Math.max(a[1]-Date.now()+a[0],0):NaN}}();
                function sanitisePercentage(i){
                    return Math.min(100,Math.max(0,i));
                }
                // Slider
                var percentTime;
                var tick;
                var progressBar = document.querySelector('.swiper-hero-progress');
                var mainSwiper = new Swiper('.swiper-container', {
                    effect: 'fade',
                    loop: true,
                    speed: 1000,
                    watchSlidesProgress: true,
                    autoplay: {
                        delay: 3000,
                        disableOnInteraction: false
                    },
                    pagination: {
                        el: '.slider_pager',
                        type: 'bullets',
                        bulletClass : 'pager',
                        bulletActiveClass : 'on',
                        clickable : true,
                        renderBullet: function (index, className) {
                            return '<span class="' + className + '">' + (index + 1) + "</span>";
                        },
                    },
                      on: {
                      slideChange: function() {
                          var swiper = this;
                          var defaultSlideDelay = swiper.params.autoplay.delay;
                          var currentIndex = swiper.realIndex + 1;
                          var currentSlide = swiper.slides[currentIndex];
                          var currentSlideDelay = currentSlide.getAttribute('data-swiper-autoplay') || defaultSlideDelay;
                          updateSwiperProgressBar(progressBar, currentSlideDelay);
                      }
                    }	
                });
                function updateSwiperProgressBar(bar, slideDelay) {
                    function startProgressBar() {
                        resetProgressBar();
                        tick = setInterval(progress, 10);
                    }
                    function progress() {
                        var timeLeft = getTimeout(mainSwiper.autoplay.timeout);
                        if ( mainSwiper.autoplay.running && !mainSwiper.autoplay.paused ) {
                            percentTime = sanitisePercentage(100 - Math.round(timeLeft / slideDelay * 100));
                            bar.style.width = percentTime + '%';
                
                            if (percentTime > 100) {
                                resetProgressBar();
                            }
                        }
                        if ( mainSwiper.autoplay.paused ) {
                            percentTime = 0;
                            bar.style.width = 0;
                        }
                    }
                    function resetProgressBar() {
                        percentTime = 0;
                        bar.style.width = 0;
                        clearInterval(tick);
                    }
                    startProgressBar();
                }
                </script>            
            </div>
            <!-- main_banner [e] -->

            <!-- include_area [s] -->
            <div id="include_area" data-aos="fade-right" data-aos-duration="1000">
                <div id="inc01">
                    <div id="gallery_banner">
                        <div class="swiper-container">
                            <ul class="swiper-wrapper"> 
                                <li class="img1 swiper-slide"></li>
                                <li class="img2 swiper-slide"></li>
                                <li class="img3 swiper-slide"></li>
                                <li class="img4 swiper-slide"></li>
                            </ul>
                        </div>
                        <div class="gallery-pager"></div>
                    </div>
                    <div id="link_banner">
                        <ul>
                            <li>
                                <a href="reservation">
                                <div class="bg"></div>
                                <div class="txt">
                                    <span>reservation</span> 
                                    <p>사색과 치유를 위한 완벽한 공간,<br />
                                    지금 바로 떠나보세요.</p>
                                </div>
                                </a>
                            </li>
                            <li>
                                <a href="room">
                                <div class="bg"></div>
                                <div class="txt">
                                    <span>room</span>
                                    <p>통창이 보이는 맑은 하늘과<br />
                                    푸르른 숲을 감상하며 하루를 시작해보세요.</p>
                                </div>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:alert('준비중입니다.')">
                                <div class="bg"></div>
                                <div class="txt">
                                    <span>special</span>
                                    <p>수영장,바베큐 등,<br />
                                    천상화원의 부대시설을 알아보세요.</p>
                                </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <script>
                var gallSwiper = new Swiper('#inc01 .swiper-container', {
                    effect :'horizontal',
                    loop:true,
                    speed:1000,
                      autoplay: {
                        delay: 3000,
                        disableOnInteraction: false,
                    },
                    pagination: {
                      el: ".gallery-pager",
                      clickable: true,
                    },
                });
                </script>            
            </div>
            <!-- include_area [e] -->

        </div>
        <!-- sh_container_wrapper [e] -->
    </div>
    <!-- sh_container [e] -->

	<!-- quick_bar [s] -->
	<%@include file="./comm/quick_bar.jsp"%>
	<!-- quick_bar [e] -->
	
    <!-- sh_ft [s] -->
    <div id="sh_ft" class="main">
        <%@include file="./comm/footer.jsp"%>
    </div>
    <!-- sh_ft [e] -->

</div>
<!-- sh_wrapper [e] -->
<script>
AOS.init();
</script>

</body>
</html>

