$(document).ready(function(){
	$("#topNav").mouseenter(function(){
		$("#topNavWrap").addClass("on");
	 	$(".top_nav_s").fadeIn(300);
		$(".top_nav_bg").slideDown(200);	
	}).mouseleave(function(){
		$("#topNavWrap").removeClass("on");
		$('.top_nav_s').stop();
	  	$(".top_nav_s").fadeOut(200);
	  	$('.top_nav_bg').stop();
		$(".top_nav_bg").slideUp(300);
	});
	
    m = 0;  
    function navClose() { 
        $("#allBtn").removeClass("active");
        $("#allWrap").fadeOut(600).removeClass("active");	
    }
    $("#allBtn").click(function(){
        m++;
        if(m%2 == 1){
            $("#allBtn").addClass("active");
            $("#allWrap").fadeIn(600).addClass("active");	
        }else{
            navClose(); 
        }; 
    });
	
	$("#allWrap .mn_img>li").hover(function(){
		var num = $(this).index()+1;
		if($(".right_img img").data("num")!=num){
			$(".right_img img").css('opacity','0').stop().attr("src","/sh_img/hd/top_menu/all_bg0"+num+".jpg").animate({opacity:1},500).data("num",num);
		}
	})
	
    /* 반응형 [s] */
	$("#m_navBtn").click(function(){
		n++;
		if(n%2 == 1){
			$("#m_navBtn").addClass("on");
			$("#mnavWrap").fadeIn(300).addClass("on");	
		}else{
			mnavClose(); 
		}; 
	});	
	$("#topmenuM .m_bmenu").click(function(){
		$('.m_smenu').not($(this).next()).slideUp(200);
		$('.m_bmenu').removeClass('on');
		$(this).addClass('on')
		$(this).next().slideDown(200);
	});	

	n = 0;  
	function mnavClose() { 
		$("#m_navBtn").removeClass("on");
		$("#mnavWrap").fadeOut(300).removeClass("on");	
	}	
	/* 반응형 [e] */	
});


/* 메뉴라인 */
window.onload = function () {

    var menuLine = document.querySelector('#menuLine');
    var activeMenuCoords = document.querySelector('.menu-item.active').getBoundingClientRect();
    menuLine.style.left = activeMenuCoords.left + 'px';
    menuLine.style.width = activeMenuCoords.width + 'px';

    var menuItem = document.querySelectorAll('.menu-item');
    for (var i = 0; i < menuItem.length; i++) {
        menuItem[i].addEventListener("mouseenter", enter);
        menuItem[i].addEventListener('mouseleave', leave);
        menuItem[i].addEventListener('click', click)
    }

    function enter() {
        activeMenuCoords = this.getBoundingClientRect();
        menuLine.style.left = activeMenuCoords.left + 'px';
        menuLine.style.width = activeMenuCoords.width + 'px';
    }
    function leave() {
        activeMenuCoords = document.querySelector('.menu-item.active').getBoundingClientRect();
        menuLine.style.left = activeMenuCoords.left + 'px';
        menuLine.style.width = activeMenuCoords.width + 'px';
    }
    function click() {
        for (var i = 0; i < menuItem.length; i++) {
            menuItem[i].classList.remove('active');
        }
        this.classList.add('active');
        activeMenuCoords = this.getBoundingClientRect();
        menuLine.style.left = activeMenuCoords.left + 'px';
        menuLine.style.width = activeMenuCoords.width + 'px';
    }

    window.onresize = function () {
        activeMenuCoords = document.querySelector('.menu-item.active').getBoundingClientRect();
        menuLine.style.left = activeMenuCoords.left + 'px';
        menuLine.style.width = activeMenuCoords.width + 'px';
    }
}	