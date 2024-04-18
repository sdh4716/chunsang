<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <%@include file="../comm/common_inc.jsp"%>      
</head>
<body>

<!-- sh_wrapper [s] -->
<div id="sh_wrapper">

    <%@include file="../comm/header.jsp"%>
    
    <!-- sh_container [s] -->
    <div id="sh_container">

        <div id="subBnr">
            <div class="inner">
                <div class="txt_area">
                    <p>About</p>
                    <span>펜션소개</span>
                </div>
            </div>
        </div>   
		<script> 
        $(document).ready(function(){
            $('#subBnr .txt_area').delay(200).animate({"opacity":"1"},800);
        });
        </script>         
    
        <!-- sh_container_wrapper [s] -->
        <div id="sh_container_wrapper">

            <!-- sh_content [s] -->
            <div id="sh_content">
                <!-- 서브페이지 [s] -->
                <div id="greeting" class="pagecommon">
                    <div class="tit_area">
                        해발 500m 고지의 맑은 공기<br />
                        <p><b>지리산</b>천상화원</p>
                    </div>
                    <div class="img"></div>
                    <div class="cont">
                        <p class="st">따뜻한 햇볕과 바람이 느껴지는 자연</p>
                        <div class="pl">천상화원에서 머무는 시간이 결코 짧은
                        순간일지라도 늘 새로운 기억으로 남겨질 것입니다.</div><br />  
                        <div class="pl">이곳에 머무르는 시간이 지리산 최고의
                        아름다운 기억으로 남을 수 있도록 늘 최선을
                        다 하는 것이 천상화원 펜션이 지향하는<br />              
                        본연에 마음입니다.</div>
                        <p class="sign">지리산 천상화원 <span></span></p>
                    </div>
                </div>
                <!-- 서브페이지 [e] -->
                
              </div>
            <!-- sh_content [s] -->            
            
        </div>
        <!-- sh_container_wrapper [e] -->
    </div>
    <!-- sh_container [e] -->
    
    <!-- quick_bar [s] -->
	<%@include file="../comm/quick_bar.jsp"%>
	<!-- quick_bar [e] -->
    
    <!-- sh_ft [s] -->
    <div id="sh_ft" class="main">
        <%@include file="../comm/footer.jsp"%>
    </div>
    <!-- sh_ft [e] -->
    
</div>
<!-- sh_wrapper [e] -->

</body>
</html>



