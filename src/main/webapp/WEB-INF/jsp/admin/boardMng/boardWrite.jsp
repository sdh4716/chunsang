<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <%@include file="../comm/common_inc.jsp"%>    
    
    <script>
    	let myEditor;
    	let boardId = '<c:out value="${param.boardId}"/>';
        let seq = '<c:out value="${param.seq}"/>';
    	
    	$(document).ready(function(){
    		
    		//ckEditor init
    		ClassicEditor
            .create( document.querySelector( '#classic' ), {
                language: 'ko' //언어설정
            })
            .then( editor => {
	            console.log( 'ckEditor이 초기화되었습니다.', editor );
	            myEditor = editor;
	            
	          	//수정일 경우
	    		if(boardId != '' && seq != ''){
	    			getData();
	    		}
	        } )
            .catch( error => {
                console.error( error );
            } );
    		
    		//목록버튼 클릭
    		$("#btnList").click(function(){
    			location.href='/admin/noticeMng'
    		});
    		
    		//저장버튼 클릭
    		$("#btnSave").click(function(){
    			
    			const params = $("#dataForm").serializeArray();
    			const content = myEditor.getData();
    			
    			params.push({name : "boardId", value : "BOARD_01"});
    			params.push({name : "content", value : content});
    			
    			if(!validate()){
    				return;
    			}
    			
    			if(!confirm("저장하시겠습니까?")){
    				return;
    			}
    			
	    		if(boardId != '' && seq != ''){
	    			
	    			//update를 위한 seq 추가
	    			params.push({name : "seq", value : seq});
	    			
	    			//수정일 경우
	    			$.ajax({
	    	            url: '/comm/updateBoard',
	    	            type: 'POST',
	    	            async: false,
	    	            data: params,
	    	            success: function (data) {
	    	            	if(data.isSuccess == true){
	    	            		alert("저장되었습니다.");
	    	            		location.href='/admin/noticeMng';
	    	            	}
	    	            },
	    	            error: function (xhr) {
	    	                alert("저장에 실패하였습니다.\n관리자에게 문의하시기 바랍니다.");
	    	            }
	    	        });
	    		}else{
	    			//신규저장일 경우
	    			$.ajax({
	    	            url: '/comm/insertBoard',
	    	            type: 'POST',
	    	            async: false,
	    	            data: params,
	    	            success: function (data) {
	    	            	if(data.isSuccess == true){
	    	            		alert("저장되었습니다.");
	    	            		location.href='/admin/noticeMng';
	    	            	}
	    	            },
	    	            error: function (xhr) {
	    	                alert("저장에 실패하였습니다.\n관리자에게 문의하시기 바랍니다.");
	    	            }
	    	        });
	    		}
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
    				setDetail(data.boardList[0]);
    			},
    			error: function(xhr) {
    			  console.log('실패 - ', xhr);
    			}
    		});
    		
    	}
    	
		//데이터 매핑
    	function setDetail(data){
			console.log(data);
			
    		$("#title").val(data.title);
    		myEditor.setData(data.content);
    	}
		
		//validation 처리
		function validate(){
			let bool = true;
			
			if($("#title").val() == null){
				alert("제목을 입력해주세요.");
				bool = false;
			}
			
			if(myEditor.getData() == null){
				alert("내용을 입력해주세요.");
				bool = false;
			}
			
			return bool;
		}
    	
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
		            				<button type="button" id="btnList" class="btn btn-outline-success">목록</button>
		            				<button type="button" id="btnSave" class="btn btn-outline-primary">저장</button>
					            </div>
					            <form id="dataForm" onsubmit="return false;" style="clear:both;">
		            				<div class="form-group">
		            					<%-- <input type="hidden" id="boardId" value="<c:out value="${param.boardId}"/>" />
		            					<input type="hidden" id="seq" value="<c:out value="${param.seq}"/>" /> --%>
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
        <%@include file="../comm/footer.jsp"%> 
    </div>
    <!-- /#right-panel -->


    
</body>
</html>
