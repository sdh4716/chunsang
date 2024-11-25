<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
	<%@include file="../comm/common_inc.jsp"%>
	
</head>
<body>

	<script>
			$(document).ready(function() {
				
				$('#subBnr .txt_area').delay(200).animate({
					"opacity" : "1"
				}, 800);
				
				createGrid();
				getData();
				
			});
			
			// 데이터 조회
	    	function getData(){
	    		
	    		const url = "/comm/selectBoardList";
	    		
	    		$.ajax({
	    			url: url,
	    			type: 'GET',
	    			data : [],
	    			async : false,
	    			success: function(data) {
	    				console.log(data);
	    				grid.resetData(data.boardList);
	    			},
	    			error: function(xhr) {
	    			  console.log('실패 - ', xhr);
	    			}
	    		});
	    		
	    	}
			
			// tui그리드 생성
	    	function createGrid(){
	            grid = new tui.Grid({
	                el : document.getElementById('grid'),
	                scrollX : false,
	                scrollY : false,
	                bodyHeight : 409,
	                editable : false,
	                pageOptions: {
	                    perPage: 5
	                },
	                columns : [
	                	{
	                        header : 'No.',
	                        name   : 'seq',
	                        align  : "center",
	                    },{
	                        header : '제목',
	                        name   : 'title',
	                  	 	align  : "center",
	                  	 	renderer: {
	                  	 		type : CustomLinkRenderer
	                  	 	},
	                    	minWidth : 190
	                    },{
	                        header : '작성자',
	                        name   : 'regId',
	                        align  : "center",
	                    },{
	                        header : '작성일',
	                        name   : 'regDt',
	                        align  : "center",
	                    }
	                ],
	                columnOptions: {
	                    resizable: true
	                }
	                
	            });
	        }
			
	    	// 게시글 상세로 가기 위한 CustomLinkRenderer
	    	class CustomLinkRenderer {
	        	
	    		constructor(props){
	        		
	    			const el = document.createElement('a');
	    			
	    			
	        		this.el = el;
	        		this.render(props);
	        	}
	        	
	        	getElement() {
	        		return this.el;
	        	}
	        	
	        	render(props){
	        		
	        		const boardId = grid.getValue(props.rowKey,"boardId");
	        		const seq = grid.getValue(props.rowKey,"seq");
	        		
	        		this.el.href = '/noticeDetail?boardId=' + boardId + '&seq=' + seq;
	        		this.el.innerText = String(props.value);
	        	}
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
						<p>Notice</p>
						<span>공지사항</span>
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
					<div class="room_info_area">
						
						<div id="grid"></div>
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



