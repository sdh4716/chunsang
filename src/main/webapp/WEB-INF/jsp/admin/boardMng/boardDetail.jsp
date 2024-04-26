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
    
    .contentBox{
	    /* min-height: 360px; */
    }
    
    </style>
    
    <script>
    	
    let myEditor;
    let boardId = '<c:out value="${param.boardId}"/>';
    let seq = '<c:out value="${param.seq}"/>';
    	
    	$(document).ready(function(){
    		
    		getData();
    		
    		//목록버튼 클릭
    		$("#btnList").click(function(){
    			location.href='/admin/noticeMng';
    		});
    		
    		//수정버튼 클릭
        	$("#btnEdit").click(function(){
        		location.href='/admin/boardWrite?boardId=' + boardId + '&seq=' + seq;
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
						            </div>
		            				<div class="form-group">
		            					<div id="title" class="titleBox" style=""></div>
		            					<hr/>
		            				</div>
		            				<div class="contentBox">
		            					<div id="content" style="border:5px;"></div>
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
