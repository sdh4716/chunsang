<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <%@include file="../comm/common_inc.jsp"%>    
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.imagesloaded/4.1.4/imagesloaded.pkgd.min.js"></script>
	
	<!-- Pagination.js -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.5/pagination.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.5/pagination.css">
    
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
    		
    		//등록 버튼 클릭
    		$('#btnBoardWrite').click(function(){
    			location.href="/admin/boardWrite?boardId=GALLERY";
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
                    const url = '/admin/boardDetail?boardId=GALLERY&seq=' + item.seq;
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
</head>

<body>
    <%@include file="../comm/left_menu.jsp"%>    
    <!-- Right Panel -->
    <div id="right-panel" class="right-panel">
        <%@include file="../comm/header.jsp"%>    
        <div class="breadcrumbs">
            <div class="breadcrumbs-inner">
                <div class="row m-0">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                                <h1>갤러리 관리</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="#">게시판관리</a></li>
                                    <li class="active">갤러리 관리</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Content -->
        <div class="content">
            <!-- Animated -->
            <div class="animated fadeIn">
            	<div class="row">
            		<div class="col">
            			<div class="card">
	            			<div class="card-body">
	            				<div class="float-right" style="margin-bottom:40px;">
           							<button type="button" id="btnBoardWrite" class="btn btn-outline-primary">등록</button>
		            			</div>
				                <div class="gallery-container">
        							<div class="grid"></div> <!-- 갤러리 아이템을 배치할 컨테이너 -->
        							<div id="pagination-container" style="justify-items: center; margin-top:30px;"></div> <!-- Pagination.js 컨테이너 -->
    							</div>
	            			</div>
	            		</div>
            		</div>
            	</div>
            </div>
            <!-- .animated -->
        </div>
        <!-- /.content -->
        <div class="clearfix"></div>
        <%@include file="../comm/footer.jsp"%> 
    </div>
    <!-- /#right-panel -->
    
</body>
</html>
