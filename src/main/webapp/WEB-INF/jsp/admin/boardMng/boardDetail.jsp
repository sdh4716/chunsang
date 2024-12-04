<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <%@include file="../comm/common_inc.jsp"%>    
    
    <style type="text/css">
    
    .titleBox{
    	font-size:22px;
    	font-weight:bold;
    	clear:both;
    }
    
    #content img{
	    max-width: 100%; /* 컨테이너를 넘지 않도록 설정 */
	    height: auto; /* 가로 세로 비율 유지 */
	    margin: 0 auto; /* 가운데 정렬 */
	    aspect-ratio: attr(width) / attr(height); /* CKEditor의 비율 유지 */
    }
    
    </style>
    
    <script>
    	
    let boardId = '<c:out value="${param.boardId}"/>';
    let seq = '<c:out value="${param.seq}"/>';
    	
    	$(document).ready(function(){
    		
    		//boardId에 따른 버튼 숨김 처리
    		btnInit();
    		
    		//게시판 상세 조회
    		getData();
    		
    		//목록버튼 클릭
    		$("#btnList").click(function(){
    			
    			if(boardId == 'GALLERY'){
    				location.href='/admin/galleryMng';
    			}else{
    				location.href='/admin/noticeMng';
    			}
    			
    			
    		});
    		
    		//수정버튼 클릭
        	$("#btnEdit").click(function(){
        		location.href='/admin/boardWrite?boardId=' + boardId + '&seq=' + seq;
        	});
    		
    		//수정버튼 클릭
        	$("#btnDelete").click(function(){
        		deleteBoard();
        	});
    		
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
    		$("#content").append(data.content);
    		
    	}
    	
    	//삭제 버튼 클릭
    	function deleteBoard(){
    		if(!confirm('게시글을 삭제하시겠습니까?')){
    			return;
    		}
    		
    		const url = "/comm/deleteBoard";
    		const params = { "boardId" : boardId , "seq" : seq };
    		
    		$.ajax({
    			url: url,
    			type: 'POST',
    			data : params,
    			async : false,
    			success: function(data) {
    				
    				console.log(data);
    				
    				if(data.isSuccess == true){
    					alert('삭제되었습니다.');
    					location.href='/admin/noticeMng';
    				}
    			},
    			error: function(xhr) {
    			  console.log('실패 - ', xhr);
    			}
    		});
    	}
    	
    	//버튼 init
    	function btnInit(){
    		if(boardId == 'SPECIAL'){
    			$('#btnList').css('display', 'none');
    			$('#btnDelete').css('display', 'none');
    		}
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
                                <h1>게시글 상세</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="#">게시판관리</a></li>
                                    <li><a href="#">공지사항 관리</a></li>
                                    <li class="active">게시글 상세</li>
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
	            			<div class="card-body ">
					            <form id="dataForm" onsubmit="return false;" style="height:100%;">
	            					<div class="float-right" style="">
			            				<button type="button" id="btnList" class="btn btn-outline-success">목록</button>
			            				<button type="button" id="btnEdit" class="btn btn-outline-primary">수정</button>
			            				<button type="button" id="btnDelete" class="btn btn-outline-danger">삭제</button>
						            </div>
		            				<div class="form-group">
		            					<div id="title" class="titleBox" style=""></div>
		            					<hr/>
		            				</div>
		            				<div class="contentBox">
		            					<div id="content" class="ck-content" style="border:5px;"></div>
		            				</div>
	            				</form>
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
