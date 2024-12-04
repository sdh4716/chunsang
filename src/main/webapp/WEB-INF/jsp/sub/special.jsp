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
	</style>
</head>
<body>
	<script>
	
	    let boardId = '<c:out value="${param.boardId}"/>';
	    let seq = '<c:out value="${param.seq}"/>';
		
	    $(document).ready(function() {
			
			$('#subBnr .txt_area').delay(200).animate({
				"opacity" : "1"
			}, 800);
			
			//목록 버튼 클릭
			$("#btnList").click(function(){
				location.href='notice';
			});
			
			getData();
			
		});
		
    	//데이터 조회
		function getData(){
    		
    		const url = "/comm/selectBoardList";
    		const params = { "boardId" : 'SPECIAL' , "seq" : 1 };
    		
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
						<p>Special</p>
						<span>부대시설</span>
					</div>
				</div>
			</div>

			<div id="sh_container_wrapper">

				<!-- 콘텐츠영역 -->
				<div id="sh_content" style="padding:10px; ">
       				<div class="contentBox">
  						<div id="content" style="border:5px;" class="ck-content"></div>
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



