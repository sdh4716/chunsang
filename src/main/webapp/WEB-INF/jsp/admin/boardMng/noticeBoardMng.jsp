<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <%@include file="../comm/common_inc.jsp"%>    
    
    <style type="text/css">
    	
    	a:hover {
    		text-decoration:underline;
    	}
    
    </style>
    	
    <script>
    	var grid;
    	
    	$(document).ready(function(){
            
    		createGrid();
            getData();
            
            // 등록버튼 클릭
            $("#btnBoardWrite").click(function(){
            	location.href="/admin/boardWrite?bType=notice";
            });
            
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
                        width  : 100
                    },{
                        header : '제목',
                        name   : 'title',
                  	 	align  : "center",
                  	 	renderer: {
                  	 		type : CustomLinkRenderer
                  	 	}
                    },{
                        header : '작성자',
                        name   : 'regId',
                        align  : "center",
                        width  : 150
                    },{
                        header : '작성일',
                        name   : 'regDt',
                        align  : "center",
                        width  : 150
                    },{
                        header : '조회수',
                        name   : 'hitCnt',
                        align  : "center",
                        width  : 150
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
        		
        		this.el.href = '/admin/boardDetail?boardId=' + boardId + '&seq=' + seq;
        		this.el.innerText = String(props.value);
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
                                <h1>공지사항 관리</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="#">게시판관리</a></li>
                                    <li class="active">공지사항 관리</li>
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
	            				<div class="float-right" style="margin-bottom:20px;">
		            				<button type="button" id="btnBoardWrite" class="btn btn-outline-primary">등록</button>
					            </div>
	            				<div id="grid"></div>
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
