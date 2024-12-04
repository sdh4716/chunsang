<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
	<%@include file="../comm/common_inc.jsp"%>
	<link rel="stylesheet" href="https://cdn.ckeditor.com/ckeditor5/43.3.1/ckeditor5.css" />
	
	
	<style>
		.ckeditor-content {
		    line-height: 1.6;
		    word-wrap: break-word;
		    padding:10px;
		}
		
		.ckeditor-content img {
		    max-width: 100%;
		    height: auto;
		    display: block;
		    margin: 10px 0;
		}
		
		.ckeditor-content table {
		    width: 100%;
		    border-collapse: collapse;
		    border: 1px solid #ddd;
		}
		
		.ckeditor-content table th,
		.ckeditor-content table td {
		    border: 1px solid #ddd;
		    padding: 10px;
		    text-align: left;
		}
		
	    .titleBox{
	    	font-weight:bold;
		   	font-size:18px;
		   	clear:both;
		   	background-color:#eee;
		   	padding: 10px;
		   	border-top: 1px solid #ddd;
		   	border-bottom: 1px solid #ddd;
	   }
	   
	   .titleSub{
		   	clear:both;
		   	padding-left: 10px;
		   	padding-right: 10px;
		   	padding-top: 5px;
		   	padding-bottom: 5px;
		   	border-bottom: 1px solid #ddd;
	   }
	   
	   .detail-container {
		    padding: 20px;
		    border: 1px solid #ddd;
		    border-radius: 8px;
		    background-color: #fff;
		    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
		    max-width: 800px;
		    margin: 20px auto;
		    font-family: Arial, sans-serif;
		}
		
		.detail-header {
		    margin-bottom: 20px;
		    border-bottom: 1px solid #eee;
		    padding-bottom: 15px;
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		}
		
		.detail-title {
		    font-size: 1.5rem;
		    font-weight: bold;
		    color: #333;
		    margin: 0;
		    flex: 1;
		}
		
		.detail-meta {
		    font-size: 0.875rem;
		    color: #666;
		    margin-right: 10px;
		}
		
		.detail-meta .detail-author {
		    font-weight: bold;
		}
		
		.detail-meta .detail-date {
		    font-style: italic;
		}
		
		#btnList {
		    padding: 5px 15px;
		    font-size: 0.875rem;
		    border-radius: 4px;
		    cursor: pointer;
		    background-color: #f8f9fa;
		    border: 1px solid #ddd;
		    transition: background-color 0.2s ease, color 0.2s ease;
		}
		
		#btnList:hover {
		    background-color: #007bff;
		    color: #fff;
		}
		
		.detail-content {
		    margin-top: 20px;
		}
		
		.detail-content .ckeditor-content img {
		    max-width: 100%;
		    height: auto;
		    border-radius: 8px;
		    margin: 10px 0;
		}
		
		.detail-content .ckeditor-content {
		    line-height: 1.8;
		    color: #333;
		    font-size: 1rem;
		}
	</style>
</head>
<body>
	<script>
	
	    let boardId = '<c:out value="${param.boardId}"/>';
	    let seq = '<c:out value="${param.seq}"/>';
		
	    $(document).ready(function() {
			
	    	if(boardId == 'GALLERY'){
	    		$("#pageTitleEng").text('Gallery');
	    		$("#pageTitleKor").text('갤러리')
	    	}else if(boardId == 'NOTICE'){
	    		$("#pageTitleEng").text('Notice');
	    		$("#pageTitleKor").text('공지사항')
	    	}
	    	
			$('#subBnr .txt_area').delay(200).animate({
				"opacity" : "1"
			}, 800);
			
			//목록 버튼 클릭
			$("#btnList").click(function(){
				if(boardId == 'GALLERY'){
					location.href='gallery';
		    	}else if(boardId == 'NOTICE'){
		    		location.href='notice';
		    	}
				
			});
			
			getData();
			
		});
		
    	//데이터 조회
		function getData(){
    		
    		const url = "/comm/selectBoardList";
    		const params = { "boardId" : boardId , "seq" : seq };
    		
    		$.ajax({
    			url: url,
    			type: 'GET',
    			data : params,
    			async : false,
    			success: function(data) {
    				
    				console.log(data);
    				setDetail(data.boardList[0]);
    			},
    			error: function(xhr) {
    			  console.log('실패 - ', xhr);
    			}
    		});
    		
    	}
    	
    	//데이터 매핑
    	function setDetail(data){
    		
    		$("#title").text(data.title);
    		$("#writer").text(data.regId);
    		$("#regDt").text(data.regDt);
    		$("#content").html(data.content);
    		
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
						<p id="pageTitleEng"></p>
						<span id="pageTitleKor"></span>
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
				<div id="sh_content" class="detail-container">
					<div class="detail-header">
						<div class="detail-title" id="title">게시글 제목</div>
				        <div class="detail-meta">
				            <span class="detail-author" id="writer">admin</span> · 
				            <span class="detail-date" id="regDt" >2024.01.01</span>
				        </div>
				        <button id="btnList" class="btn btn-outline-secondary">목록</button>
					</div>
				    <div class="detail-content">
        				<div id="content" class="ckeditor-content"></div>
    				</div>
					<!-- <button id="btnList" class="btn btn-outline-secondary" style="float:right; margin-bottom:15px;">목록</button>
            		<div id="title" class="titleBox"></div>
            		<div id="title_sub" class="titleSub">
            			admin
            		</div>
       				<div class="contentBox">
  						<div id="content" style="border:5px;" class="ckeditor-content"></div>
   					</div> -->
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



