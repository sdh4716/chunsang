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
                    <p>Location</p>
                    <span>오시는 길</span>
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

			<!-- sh_aside [s] -->
            <div id="sh_aside"> 
    	        <div id="sh_aside_wrapper">
                    <ul id="sh_snb">
                        <li class="snb_on"><a href="">오시는 길</a></li>
                    </ul>            
				</div>
            </div>
            <!-- sh_aside [e] -->
            
            <!-- sh_content [s] -->
        <div id="sh_content">
			
			<div id="greeting" class="pagecommon">
                <div class="tit_area" style="font-size : 20px;">
                    <p>지리산 천상화원</p>
                    <br/>
                    지번주소 : 경상남도 함양군 마천면 강청리 370-6
                    <br>
                    도로명 주소 : 경상남도 함양군 마천면 강청길 21-20
                </div>
            </div>

			<div class="container">
		       	<div id="map" style="width:100%;height:700px;border:1px lightgray;" ></div>
		       </div>
		       <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3efb7d3ca841cbc4b1da3ed2b5ad29c5"></script>
		       <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3efb7d3ca841cbc4b1da3ed2b5ad29c5&libraries=LIBRARY"></script>
		       <script>
		        var container = document.getElementById('map');
				var options = {
					center: new kakao.maps.LatLng(35.3797021308435, 127.66849060933335),
					draggable: true, // 지도를 생성할때 지도 이동 및 확대/축소를 막으려면 draggable: false 옵션을 추가하세요
					level: 3,
				};
				
				var map = new kakao.maps.Map(container, options);
				
				// 마커가 표시될 위치입니다 
				var markerPosition  = new kakao.maps.LatLng(35.3797021308435, 127.66849060933335); 
		
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				    position: markerPosition
				});
		
				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
				
				var iwContent = '<div style="padding:5px;">지리산 천상화원<br><a href="https://map.kakao.com/link/map/지리산 천상화원,35.3797021308435, 127.66849060933335" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/지리산 천상화원,35.3797021308435, 127.66849060933335" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다
		
				// 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
				    position : iwPosition, 
				    content : iwContent 
				});
				  
				// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
				infowindow.open(map, marker); 
				
				map.setZoomable(false);
				
		       </script>



				
                <!-- 서브페이지 [s] -->
                <!-- <div id="greeting" class="pagecommon">
                    <div class="tit_area">
                        빠르게 발전하고있는 Smart IT 세상<br />
                        <p><b>IT상장기업 샤이닝</b>이 여러분과 함께 만들어 갑니다.</p>
                    </div>
                    <div class="img"></div>
                    <div class="cont">
                        <p class="st">먼저 고객 여러분의 변함없는 관심과 사랑에 깊이 감사드립니다.</p>
                        <div class="pl">저희 샤이닝은수익창출만을 위한 경영이념보다는 함께 공유하고 함께 커갈수 있는
                        친구같은 파트너로서 사람을 위한 기술로 보다 윤택하고 신선하게 변화시키기 위해 모든 역량을 집중하고 있습니다.</div><br />  
                        <div class="pl">나태하지 않고, 현실에 안주하지 않는 자세로 끊임 없는 도전과 혁신으로 현 분야의 최고의 기업이 되기위해
                        함께 생각하고 함께 이뤄내는 샤이닝이 되고자 합니다.
                        언제나 지켜봐주시는 분들에게 실망되지 않는 기업이 되겠습니다.<br />              
                        감사합니다.</div>
                        <p class="sign">샤이닝 <span>임직원 일동</span></p>
                    </div>
                </div> -->
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
   <%@include file="../comm/footer.jsp"%>
    <!-- sh_ft [e] -->
    
</div>
<!-- sh_wrapper [e] -->

</body>
</html>



