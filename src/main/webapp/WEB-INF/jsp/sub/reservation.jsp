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
						<p>Reservation</p>
						<span>예약안내</span>
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
	                        <li class="snb_on"><a href="room_sky">예약안내</a></li>
						</ul>
						<!-- 소분류 끝 -->
					</div>
				</div>
				<!-- 콘텐츠영역 -->
				<div id="sh_content">
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
											<td rowspan="6" style="color:#000000 !important;">하늘/구름</td>
											<td rowspan="6" style="color:#000000 !important;">하늘방 : 4인<br/>구름방 : 6인</td>
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
											<td height="25%" rowspan="2" style="color:#000000;">여름휴가기간<br/>(7월 넷째주~ 8월 둘째주)</td>
											<td rowspan="2" colspan="2" style="color:#000000;">20만원</td>
										</tr>
										<tr>
										</tr>
								</table>
							</div>
						</div>
						<div class="room_guid">
							<div class="guid_box">
								<p class="guid_tit">예약문의</p>
								<div class="guid_txt">전화문의 : 010-2585-6946<br></div>
							</div>
							<div class="guid_box">
								<p class="guid_tit">기타사항</p>
								<div class="guid_txt">입실: 15시 / 퇴실: 11시<br>
								객실 기준인원(4인) 초과시 1인/15000원 추가됩니다.</div>
							</div>
						</div>
					</div>
				</div>
				<!-- sh_content -->

			</div>
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



