<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
	<%@include file="../comm/common_inc.jsp"%>
	<script src="/js/packages/mansonry/mansonry.pkgd.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.imagesloaded/4.1.4/imagesloaded.pkgd.min.js"></script>
	
	<!-- Pagination.js -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.5/pagination.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.5/pagination.css">
</head>
<body>

	<script>
		
		$(document).ready(function(){
	        
			// 데이터 조회
	        //getData();
			
			// Pagination.js 초기화
    	    $('#pagination-container').pagination({
    	        dataSource: fetchGalleryData(), // 데이터 소스
    	        pageSize: 6, // 페이지당 표시할 아이템 수
    	        callback: function (data, pagination) {
    	            renderGallery(data); // 현재 페이지의 데이터를 렌더링
    	            initializeMasonry(); // Masonry.js 적용
    	        }
    	    });
	        
	    });
		
    	function fetchGalleryData(){
    		
    		const url = "/comm/selectBoardList";
    		const params = { "boardId" : 'GALLERY'};
    		let galleryData = [];
    		
    		$.ajax({
    			url: url,
    			type: 'GET',
    			data : params,
    			async : false,
    			success: function(data) {
    				galleryData = data.boardList;
    			},
    			error: function(xhr) {
    				console.log('실패 - ', xhr);
    			}
    		});
    		
    		return galleryData;
    	}
    	
        // Masonry.js 초기화 함수
        function initializeMasonry() {
            const grid = document.querySelector('.grid');
            
            // imagesLoaded 사용
            imagesLoaded(grid, () => {
                new Masonry(grid, {
                    itemSelector: '.grid-item',
                    columnWidth: '.grid-item',
                    gutter: 20,
                    percentPosition: true
                });
            });
        }

        // 갤러리 렌더링 함수
        function renderGallery(data) {
            const grid = document.querySelector('.grid');
            grid.innerHTML = ''; // 기존 아이템 제거

            data.forEach(item => {
                const div = document.createElement('div');
                div.className = 'grid-item';
                div.style.cursor = 'pointer'; // 클릭 커서 설정
                
                
                // 클릭 이벤트 추가
                div.addEventListener('click', () => {
                    const url = '/boardDetail?boardId=GALLERY&seq=' + item.seq;
                    window.location.href = url; // 해당 URL로 이동
                });
                
                div.innerHTML = '<img src="' + item.thumbnailDir + '" alt="' + item.title + '">' +
                    '<div class="info">' +
                        '<h4>' + item.title + '</h4>' +
                        '<div class="meta">' + '작성일: ' + item.regDt + ' 작성자: ' + item.regId + '</div>' +
                    '</div>';
                grid.appendChild(div);
            });
        }
	</script>


	<!-- sh_wrapper [s] -->
	<div id="sh_wrapper">

		<%@include file="../comm/header.jsp"%>

		<!-- sh_container [s] -->
		<div id="sh_container">

			<div id="subBnr">
				<div class="inner">
					<div class="txt_area">
						<p>Gallery</p>
						<span>갤러리</span>
					</div>
				</div>
			</div>

			<div id="sh_container_wrapper">

				<!-- 서브메뉴 -->
				<div id="sh_aside">
					<div id="sh_aside_wrapper">
						<ul id="sh_snb">
							<!-- <li><a href="/bbs/board.php?bo_table=room&wr_id=4">데이지</a>
							</li>
							<li><a href="/bbs/board.php?bo_table=room&wr_id=3">민들레</a>
							</li> -->
						</ul>
						<!-- 소분류 끝 -->
					</div>
				</div>
				<!-- 콘텐츠영역 -->
				<div id="sh_content">
					<div class="gallery-container">
						<div class="grid"></div> <!-- 갤러리 아이템을 배치할 컨테이너 -->
						<div id="pagination-container" style="justify-items: center; margin-top:30px;"></div> <!-- Pagination.js 컨테이너 -->
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



