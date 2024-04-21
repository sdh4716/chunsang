<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <%@include file="../comm/common_inc.jsp"%>    
    
    <script>
    	let myEditor;
    	
    	$(document).ready(function(){
    		
    		ClassicEditor
            .create( document.querySelector( '#classic' ), {
                language: 'ko' //언어설정
            })
            .then( editor => {
	            console.log( 'Editor was initialized', editor );
	            myEditor = editor;
	        } )
            .catch( error => {
                console.error( error );
            } );
    		
    		//저장 버튼 클릭
    		$("#btnSave").click(function(){
    			
    			if(!confirm("저장하시겠습니까?")){
    				return;
    			}
    			
    			const params = $("#dataForm").serializeArray();
    			const content = myEditor.getData();
    			
    			params.push(content);
    			
    			console.log(params);
    			return;
    			
    	        $.ajax({
    	            url: "<c:url value='/comm/insertBoard'/>",
    	            type: 'POST',
    	            data: params,
    	            async: true,
    	            success: function (data) {
    	            	console.log(data.list);
    	                searchData = data;

    	                $("#searchCnt").text("총 " + numberWithCommas(data.list == null ? 0 : data.list.length) + " 건");

    	                // 현재 출력된 칼럼들의 값을 모두 조사하여 최적의 칼럼 사이즈를 찾아 배열로 반환.
    	                // 만약 칼럼 사이즈들의 총합이 그리드 크기보다 작다면, 나머지 값들을 나눠 가져 그리드 크기에 맞추기
    	                var colSizeList = AUIGrid.getFitColumnSizeList(myGridID, true);
    	                // 구해진 칼럼 사이즈를 적용 시킴.
    	                AUIGrid.setColumnSizeList(myGridID, colSizeList);
    	            },
    	            error: function (xhr) {
    	                console.log('실패 - ', xhr);
    	            }
    	        });
    			
    		});
    		
        });
    	
    	
        
    	
    </script>
    
    <!-- 넓이 높이 조절 -->
	<style>
	.ck.ck-editor {
    	max-width: 100%;
	}
	.ck-editor__editable {
	    min-height: 400px;
	}
	</style>
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
                                <h1><i class="fa fa-pencil"></i>&nbsp; 글쓰기</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="#">게시판관리</a></li>
                                    <li><a href="#">공지사항 관리</a></li>
                                    <li class="active">글쓰기</li>
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
	            				<div class="float-right" style="margin-bottom:20px;">
		            				<button type="button" id="btnSave" class="btn btn-outline-primary">저장</button>
		            				<button type="button" id="btnList" class="btn btn-outline-success">목록</button>
					            </div>
					            <form id="dataForm" onsubmit="return false;">
		            				<div class="form-group">
		            					<input type="text" id="title" name="title" placeholder="제목을 입력해주세요" class="form-control">
		            				</div>
		            				<div id="classic"></div>
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
        <!-- Footer -->
        <footer class="site-footer">
        <div class="footer-inner bg-white">
            <div class="row">
                <div class="col-sm-6">
                    Copyright © 지리산 천상화원 
                </div>
                <div class="col-sm-6 text-right">
                    Worked by <a href="https://github.com/sdh4716">dev1song</a>
                </div>
            </div>
        </div>
    </footer>
    </div>
    <!-- /#right-panel -->


    
</body>
</html>
