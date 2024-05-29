<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<p>Room View</p>
						<span>객실소개</span>
					</div>
				</div>
			</div>
			<script>
				$(document).ready(function() {
					$('#subBnr .txt_area').delay(200).animate({
						"opacity" : "1"
					}, 800);
				});
			</script>


			<div id="sh_container_wrapper">

				<!-- 서브메뉴 -->
				<div id="sh_aside">
					<div id="sh_aside_wrapper">
						<ul id="sh_snb">
							<!-- <li><a href="/bbs/board.php?bo_table=room&wr_id=4">데이지</a>
							</li>
							<li><a href="/bbs/board.php?bo_table=room&wr_id=3">민들레</a>
							</li> -->
	                        <li class="snb_on"><a href="room_sky">하늘</a></li>
	                        <li class=""><a href="room_cloud">구름</a></li>
						</ul>
						<!-- 소분류 끝 -->
					</div>
				</div>
				<!-- 콘텐츠영역 -->
				<div id="sh_content">
					
					<!-- 하늘 -->
					<article id="sh_bo_v">
						<div class="tit">
							<p>하늘</p>
							<span>거실,방 구조로 된 아늑한 침실형 객실</span>
						</div>
						<ul class="v_room_info">
							<li>
								<p class="info_c">객실명</p>
								<p class="info_name">하늘</p>
							</li>
							<li>
								<p class="info_c">스타일</p>
								<p class="info_name">거실,방 구조</p>
							</li>
							<li>
								<p class="info_c">크기</p>
								<p class="info_name">10 평</p>
							</li>
							<li>
								<p class="info_c">인원(기준/최대)</p>
								<p class="info_name">4/4</p>
							</li>
						</ul>
						<section id="bo_v_atc">
							<div id="bo_v_img">
								<div class="gallery_img">
									<img
										src="img/room/sky_1.png"
										id="large_img" alt="객실이름">
								</div>

								<ul class="gallery_thumb">
									<li
										data-large="img/room/sky_1.png"
										style="background: url(img/room/sky_1.png)"
										class="on"></li>
									<li
										data-large="img/room/sky_2.png"
										style="background: url(img/room/sky_2.png)"></li>
									<li
										data-large="img/room/sky_3.png"
										style="background: url(img/room/sky_3.png)"></li>
								</ul>
							</div>
							<div class="room_info_area">
								<div class="room_price">
									<p class="info_tit">가격정보<br><font style="font-size:18px;color:#ff0000;">*4인 기준</font></p>
									<div class="price_cont">
										<table width="100%" height="100%" class="room_text_table" style="background-color:#f3f3f3;min-height:300px;">
												<tr> 
													<td height="15%" width="30%" style="">구분</td>
													<td width="17%" style="color:#000000 !important;">객실명</td>
													<td width="" style="color:#000000 !important;">최대인원</td>
													<td width="" style="color:#000000 !important;">주중</td>
													<td width="" style="color:#000000 !important;">주말,공휴일</td>
												</tr>
												<tr>
													<td height="30%" rowspan="2" style="color:#000000 !important;">비수기</td>
													<td rowspan="6" style="color:#000000 !important;">하늘</td>
													<td rowspan="6" style="color:#000000 !important;">4인</td>
													<td rowspan="2" style="color:#000000 !important;">10만원 </td>
													<td rowspan="2" style="color:#000000 !important;">15만원 </td>						
												</tr>
												<tr>
												</tr>
												<tr>
													<td rowspan="2" style="color:#000000;">성수기</td>
													<td height="30%" rowspan="2" colspan="2" style="color:#000000;">15만원</td>
												</tr>
												<tr>
												</tr>
												<tr>
													<td height="25%" rowspan="2" style="color:#000000;">여름휴가기간<br/>(7월 셋째주~ 8월 셋째주)</td>
													<td rowspan="2" colspan="2" style="color:#000000;">20만원</td>
												</tr>
												<tr>
												</tr>
							
												<!--<tr>
													<td rowspan='2' style="color:#000000;">여름휴가기간<br/>(7월 넷째주~ 8월 둘째주)</td>
													<td style="color:#000000;"> d</td>
													<td style="color:#000000;"> d</td>
													<td style="color:#000000;"> d</td>
												</tr>
												<tr>
													<td style="color:#000000;"> d</td>
													<td style="color:#000000;"> d</td>
													<td style="color:#000000;"> d</td>
												</tr>-->
										</table>
									</div>
								</div>
								<div class="room_guid">
									<div class="guid_box">
										<p class="guid_tit">시설안내</p>
										<div class="guid_txt">TV, 가스레인지, 전자레인지, 전기밥솥, WIFI, 비데
											주방용품일체, <br>샤워용품( 샴푸, 린스, 바디워시 )</div>
									</div>
									<div class="guid_box">
										<p class="guid_tit">기타사항</p>
										<div class="guid_txt">입실: 15시 / 퇴실: 11시<br>
										객실 기준인원(4인) 초과시 1인/15000원 추가됩니다.</div>
									</div>
								</div>
							</div>

							<!-- <div id="other_room">
								<h3>다른 객실 보기</h3>
								<div class="slide_area">
									<ul class="swiper-wrapper">
										<li class="swiper-slide"><a
											href="/bbs/board.php?bo_table=room&wr_id=1">
												<div class="pdt_img">
													<img
														src="http://ps1017.shiningcorp.com/data/file/room/thumb-1935566037_rSL03AcR_b7b2430d52af817eccf9702aa8673fbec24ad068_290x186.jpg"
														alt="민들레" style="width: 100%">
												</div>
												<div class="pdt_tit">
													<span>가족룸, 제트스파</span> 민들레
												</div>
										</a></li>
										<li class="swiper-slide"><a
											href="/bbs/board.php?bo_table=room&wr_id=2">
												<div class="pdt_img">
													<img
														src="http://ps1017.shiningcorp.com/data/file/room/thumb-1935566037_kJU1KPHu_471123123e7cd6efa9c9e7168b3d77dba2a154cc_290x186.jpg"
														alt="바이올렛" style="width: 100%">
												</div>
												<div class="pdt_tit">
													<span>가족룸, 제트스파</span> 바이올렛
												</div>
										</a></li>
										<li class="swiper-slide"><a
											href="/bbs/board.php?bo_table=room&wr_id=3">
												<div class="pdt_img">
													<img
														src="http://ps1017.shiningcorp.com/data/file/room/thumb-1935566037_JciExwq9_650984ce6d2fe55243f054c193ebb91afb32a5df_290x186.jpg"
														alt="민들레" style="width: 100%">
												</div>
												<div class="pdt_tit">
													<span>가족룸, 제트스파</span> 민들레
												</div>
										</a></li>
									</ul>
								</div>
								<div class="arr_btn">
									<button class="prev"></button>
									<button class="next"></button>
								</div>
							</div> -->

							<!-- <ul class="rsv_btn_area">
								<li class="rsv_btn"><a
									href="/bbs/board.php?bo_table=reservation">실시간예약 <span></span></a></li>
								<li class="rsv_btn02"><a
									href="/bbs/board.php?bo_table=reservation_info">예약안내 <span></span></a></li>
							</ul> -->
						</section>

						<!-- 버튼 [s] -->
						<!-- <div class="btn_area">
							<ul class="left">
							</ul>
							<ul class="right">
								<li><a href="./board.php?bo_table=room&amp;page="
									class="btn_line"> 목록</a></li>
							</ul>
						</div> -->
						<!-- 버튼 [e] -->

					</article>
					<!-- } 게시판 읽기 끝 -->
					<script>
						$(document).ready(function() {
							$(".gallery_thumb li").click(function() {
								var large_img_src = $("#large_img").attr("src");
								var src = $(this).data('large');
								if (large_img_src == src) {return false;}
								$('#large_img').fadeOut(0);
								$("#large_img").attr("src",src);
								$('#large_img').fadeIn(300);
								$(".gallery_thumb li").removeClass('on');
								$(this).addClass('on');
							});
							var galleryTop = new Swiper('.slide_area',
								{
									spaceBetween : 0,
									loop : true,
									slidesPerView : 3,
									spaceBetween : 10,
									navigation : {
										nextEl : '.arr_btn .next',
										prevEl : '.arr_btn .prev',
									},
									autoplay : {
										delay : 2500,
										disableOnInteraction : false,
									},
								});
						});
					</script>
				</div>
				<!-- sh_content -->

			</div>
			<!-- sh_container_wrapper -->
			<!-- sh_container_wrapper [s] -->
			<!-- <div id="sh_container_wrapper">

				sh_aside [s]
				<div id="sh_aside">
					<div id="sh_aside_wrapper">
						<ul id="sh_snb">
							<li class="snb_on"><a href="">별채 1호</a></li>
							<li class=""><a href="">별채 2호</a></li>
						</ul>
					</div>
				</div>
				sh_aside [e]

				sh_content [s]
				<div id="sh_content">

					<div class="container">
						<div id="greeting" class="pagecommon">
							<div class="tit_area">
								빠르게 발전하고있는 Smart IT 세상<br />
								<p>
									<b>IT상장기업 샤이닝</b>이 여러분과 함께 만들어 갑니다.
								</p>
							</div>
							<div class="img"></div>
							<div class="cont">
								<p class="st">먼저 고객 여러분의 변함없는 관심과 사랑에 깊이 감사드립니다.</p>
								<div class="pl">저희 샤이닝은수익창출만을 위한 경영이념보다는 함께 공유하고 함께 커갈수 있는
									친구같은 파트너로서 사람을 위한 기술로 보다 윤택하고 신선하게 변화시키기 위해 모든 역량을 집중하고 있습니다.</div>
								<br />
								<div class="pl">
									나태하지 않고, 현실에 안주하지 않는 자세로 끊임 없는 도전과 혁신으로 현 분야의 최고의 기업이 되기위해 함께
									생각하고 함께 이뤄내는 샤이닝이 되고자 합니다. 언제나 지켜봐주시는 분들에게 실망되지 않는 기업이 되겠습니다.<br />
									감사합니다.
								</div>
								<p class="sign">
									샤이닝 <span>임직원 일동</span>
								</p>
							</div>
						</div>
					</div>




					서브페이지 [s]
					<div id="greeting" class="pagecommon">
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
                </div>
					서브페이지 [e]

				</div>
				sh_content [s]

			</div> -->
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



