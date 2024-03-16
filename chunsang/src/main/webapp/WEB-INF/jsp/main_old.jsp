<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

    <head>
        <%@include file="./comm/common_inc.jsp"%>
        <script src="https://cdn.jsdelivr.net/npm/swiper@11.0.5/swiper-bundle.min.js"></script>
		<link href="https://cdn.jsdelivr.net/npm/swiper@11.0.5/swiper-bundle.min.css" rel="stylesheet"/>
		<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
		<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
		
        <title>지리산천상화원</title>
        
        
        
        <script type="text/javaScript">
	
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
        
		$(document).ready(function() {
			
			
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
        
    </head>
    <body id="page-top">
        <%@include file="./comm/header.jsp"%>
        <!-- Masthead-->
        <header class="masthead">
            <div class="container">
                <div class="masthead-subheading">자연과 함께 숨쉬는</div>
                <div class="masthead-heading text-uppercase">천상화원 펜션</div>
                <!-- <a class="btn btn-primary btn-xl text-uppercase" href="#services">Tell Me More</a> -->
            </div>
        </header>
        <!-- Services-->
        <section class="page-section" id="services">
            <div class="container">
                <div class="text-center">
                    <!-- <h2 class="section-heading text-uppercase">Services</h2>
                    <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3> -->
                </div>
                <div class="row text-center">
                    <div class="col-md-4">
                        <img class="img-fluid" src="assets/img/main/main_sub_1.png"/>
                        <h4 class="my-3">E-Commerce</h4>
                        <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
                    </div>
                    <div class="col-md-4">
                        <img class="img-fluid" src="assets/img/main/main_sub_2.png"/>
                        <h4 class="my-3">Responsive Design</h4>
                        <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
                    </div>
                    <div class="col-md-4">
                        <img class="img-fluid" src="assets/img/main/main_sub_3.png"/>
                        <h4 class="my-3">Web Security</h4>
                        <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
                    </div>
                </div>
            </div>
            
            
            <div id="sh_container_wrapper">
	     
<div id="main_banner" data-aos="fade-left" data-aos-duration="1000" class="aos-init aos-animate">
	
<div id="mainVisual">

	<div class="txt_area">
		<p class="txt1">Nature Lifestyle Pension</p>
		<p class="txt2">여유로움을 느낄 수 있는 그 곳</p>
		<p class="txt3">제주의 아름다운 자연을 담은 샤이닝 펜션이,<br>품격을 더해 새롭게 태어납니다.</p>
    </div>
    <div class="timeline">
        <div class="swiper-hero-progress" style="width: 0px;"></div>
        <div class="slider_pager swiper-pagination-clickable swiper-pagination-bullets"><span class="pager" tabindex="0">1</span><span class="pager on" tabindex="0">2</span></div>
	</div>
    <div class="main_slider swiper-container swiper-container-fade swiper-container-initialized swiper-container-horizontal">
        <ul class="slider swiper-wrapper" id="swiper-wrapper-10c181e14325da611" aria-live="off" style="transition-duration: 1000ms;"><li class="img2 swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active" data-swiper-slide-index="1" role="group" aria-label="1 / 4" style="width: 830px; transition-duration: 1000ms; opacity: 1; transform: translate3d(0px, 0px, 0px);"></li>
            <li class="img1 swiper-slide swiper-slide-prev swiper-slide-duplicate-next" data-swiper-slide-index="0" role="group" aria-label="2 / 4" style="width: 830px; transition-duration: 1000ms; opacity: 1; transform: translate3d(-830px, 0px, 0px);"></li>
            <li class="img2 swiper-slide swiper-slide-active" data-swiper-slide-index="1" role="group" aria-label="3 / 4" style="width: 830px; transition-duration: 1000ms; opacity: 1; transform: translate3d(-1660px, 0px, 0px);"></li>
        <li class="img1 swiper-slide swiper-slide-duplicate swiper-slide-next swiper-slide-duplicate-prev" data-swiper-slide-index="0" role="group" aria-label="4 / 4" style="width: 830px; transition-duration: 1000ms; opacity: 0; transform: translate3d(-2490px, 0px, 0px);"></li></ul>
    <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>  
</div>

<div id="include_area" data-aos="fade-right" data-aos-duration="1000" class="aos-init aos-animate">
	
<div id="inc01">
    <div id="gallery_banner">
        <div class="swiper-container swiper-container-initialized swiper-container-horizontal">
            <ul class="swiper-wrapper" id="swiper-wrapper-bfe9f5ad2d333b3f" aria-live="off" style="transition-duration: 1000ms; transform: translate3d(-1660px, 0px, 0px);"><li class="img3 swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next" data-swiper-slide-index="2" role="group" aria-label="1 / 5" style="width: 830px;"></li> 
                <li class="img1 swiper-slide swiper-slide-prev" data-swiper-slide-index="0" role="group" aria-label="2 / 5" style="width: 830px;"></li>
                <li class="img2 swiper-slide swiper-slide-active" data-swiper-slide-index="1" role="group" aria-label="3 / 5" style="width: 830px;"></li>
                <li class="img3 swiper-slide swiper-slide-next" data-swiper-slide-index="2" role="group" aria-label="4 / 5" style="width: 830px;"></li>
            <li class="img1 swiper-slide swiper-slide-duplicate swiper-slide-duplicate-prev" data-swiper-slide-index="0" role="group" aria-label="5 / 5" style="width: 830px;"></li></ul>
        <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
        <div class="gallery-pager swiper-pagination-clickable swiper-pagination-bullets"><span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 1"></span><span class="swiper-pagination-bullet swiper-pagination-bullet-active" tabindex="0" role="button" aria-label="Go to slide 2"></span><span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 3"></span></div>
    </div>
    <div id="link_banner">
    	<ul>
            <li>
            	<a href="/bbs/board.php?bo_table=reservation_info">
                <div class="bg"></div>
                <div class="txt">
					<span>reservation</span> 
                    <p>사색과 치유를 위한 완벽한 공간,<br>
					지금 바로 떠나보세요.</p>
                </div>
            	</a>
            </li>
            <li>
            	<a href="/bbs/board.php?bo_table=room">
                <div class="bg"></div>
                <div class="txt">
					<span>room</span>
                    <p>통창이 보이는 맑은 하늘과<br>
                    푸르른 숲을 감상하며 하루를 시작해보세요.</p>
                </div>
            	</a>
            </li>
            <li>
            	<a href="/bbs/board.php?bo_table=special">
                <div class="bg"></div>
                <div class="txt">
					<span>special</span>
                    <p>넓직한 다이닝 룸은소중한 사람들과<br>
					근사한 식사를 즐기실 수 있습니다.</p>
                </div>
            	</a>
            </li>
        </ul>
    </div>
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
</script></div>
<script>
AOS.init();
</script>
   
	</div>
            
        </section>
        <!-- Portfolio Grid-->
        <section class="page-section bg-light" id="portfolio">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Portfolio</h2>
                    <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 1-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal1">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="assets/img/portfolio/1.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">Threads</div>
                                <div class="portfolio-caption-subheading text-muted">Illustration</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 2-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal2">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="assets/img/portfolio/2.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">Explore</div>
                                <div class="portfolio-caption-subheading text-muted">Graphic Design</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 3-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal3">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="assets/img/portfolio/3.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">Finish</div>
                                <div class="portfolio-caption-subheading text-muted">Identity</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4 mb-lg-0">
                        <!-- Portfolio item 4-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal4">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="assets/img/portfolio/4.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">Lines</div>
                                <div class="portfolio-caption-subheading text-muted">Branding</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4 mb-sm-0">
                        <!-- Portfolio item 5-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal5">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="assets/img/portfolio/5.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">Southwest</div>
                                <div class="portfolio-caption-subheading text-muted">Website Design</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <!-- Portfolio item 6-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal6">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="assets/img/portfolio/6.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">Window</div>
                                <div class="portfolio-caption-subheading text-muted">Photography</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- About-->
        <!-- <section class="page-section" id="about">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">About</h2>
                    <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
                </div>
                <ul class="timeline">
                    <li>
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="assets/img/about/1.jpg" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>2009-2011</h4>
                                <h4 class="subheading">Our Humble Beginnings</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="assets/img/about/2.jpg" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>March 2011</h4>
                                <h4 class="subheading">An Agency is Born</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p></div>
                        </div>
                    </li>
                    <li>
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="assets/img/about/3.jpg" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>December 2015</h4>
                                <h4 class="subheading">Transition to Full Service</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="assets/img/about/4.jpg" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>July 2020</h4>
                                <h4 class="subheading">Phase Two Expansion</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image">
                            <h4>
                                Be Part
                                <br />
                                Of Our
                                <br />
                                Story!
                            </h4>
                        </div>
                    </li>
                </ul>
            </div>
        </section> -->
        <!-- Team-->
        <section class="page-section bg-light" id="team">
            <!-- <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Our Amazing Team</h2>
                    <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
                </div>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="assets/img/team/1.jpg" alt="..." />
                            <h4>Parveen Anand</h4>
                            <p class="text-muted">Lead Designer</p>
                            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Parveen Anand Twitter Profile"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Parveen Anand Facebook Profile"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Parveen Anand LinkedIn Profile"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="assets/img/team/2.jpg" alt="..." />
                            <h4>Diana Petersen</h4>
                            <p class="text-muted">Lead Marketer</p>
                            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Diana Petersen Twitter Profile"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Diana Petersen Facebook Profile"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Diana Petersen LinkedIn Profile"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="assets/img/team/3.jpg" alt="..." />
                            <h4>Larry Parker</h4>
                            <p class="text-muted">Lead Developer</p>
                            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Larry Parker Twitter Profile"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Larry Parker Facebook Profile"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Larry Parker LinkedIn Profile"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8 mx-auto text-center"><p class="large text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut eaque, laboriosam veritatis, quos non quis ad perspiciatis, totam corporis ea, alias ut unde.</p></div>
                </div>
            </div> -->
        </section>
        <!-- Clients-->
        <!-- <div class="py-5"> -->
            <!-- <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="#!"><img class="img-fluid img-brand d-block mx-auto" src="assets/img/logos/microsoft.svg" alt="..." aria-label="Microsoft Logo" /></a>
                    </div>
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="#!"><img class="img-fluid img-brand d-block mx-auto" src="assets/img/logos/google.svg" alt="..." aria-label="Google Logo" /></a>
                    </div>
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="#!"><img class="img-fluid img-brand d-block mx-auto" src="assets/img/logos/facebook.svg" alt="..." aria-label="Facebook Logo" /></a>
                    </div>
                    <div class="col-md-3 col-sm-6 my-3">
                        <a href="#!"><img class="img-fluid img-brand d-block mx-auto" src="assets/img/logos/ibm.svg" alt="..." aria-label="IBM Logo" /></a>
                    </div>
                </div>
            </div> -->
        <!-- </div> -->
       <%@include file="./comm/footer.jsp"%>
        <!-- Portfolio Modals-->
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
