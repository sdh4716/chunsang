<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <%@include file="../comm/common_inc.jsp"%>    
    <script type="module" src="/js/common/ckeditor5Init.js"></script>
    <style>
    	#thumbnailCandidates {
		    display: flex;
		    flex-wrap: wrap;
		    gap: 10px;
		    margin-top: 20px;
		}
		
		.thumbnail-item {
		    border: 2px solid transparent;
		    border-radius: 8px;
		    padding: 5px;
		    cursor: pointer;
		    transition: border-color 0.3s ease;
		}
		
		.thumbnail-item img {
		    width: 400px;
		    height: 300px;
		    object-fit: cover;
		    border-radius: 5px;
		}
		
		.thumbnail-item:hover {
		    border-color: #007bff; /* 파란색 테두리 */
		}
		
		.selected-thumbnail {
		    border-color: #007bff; /* 선택된 썸네일 파란색 강조 */
		    box-shadow: 0 0 10px rgba(0, 123, 255, 0.5);
		}
    </style>
    
    <script>
    	
    	let myEditor;
    	let boardId = '<c:out value="${param.boardId}"/>';
        let seq = '<c:out value="${param.seq}"/>';
    	
    	$(document).ready(function(){
    		
    		//boardId에 따른 버튼 숨김 처리
    		initDisplay();
    		
    		//ckEditor init
    		/* ClassicEditor
    	        .create( document.querySelector( '#classic' ), {
    	            language: 'ko', //언어설정
    	   	        simpleUpload: {
    	            	uploadUrl: '/comm/uploadFile', // 서버 업로드 엔드포인트
    	        	}
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
    	        } ); */
    		
    		//목록버튼 클릭
    		$("#btnList").click(function(){
       			if(boardId == 'GALLERY'){
    				location.href='/admin/galleryMng';
    			}else{
    				location.href='/admin/noticeMng';
    			}
    		});
    		
    		//저장버튼 클릭
    		$("#btnSave").click(function(){
    			//게시글 저장
    			saveBoard();
    		});
        });
    	
    	//데이터 조회
		function getData() {
		    return new Promise((resolve, reject) => {
		        const url = "/comm/selectBoardList";
		        const params = { "boardId": boardId, "seq": seq };
		
		        $.ajax({
		            url: url,
		            type: 'GET',
		            data: params,
		            success: function (data) {
		                // 데이터를 성공적으로 로드한 경우
		                setDetail(data.boardList[0]);
		                resolve(data.boardList[0]); // 데이터를 반환
		            },
		            error: function (xhr) {
		                console.log('데이터 로드 실패:', xhr);
		                reject(xhr); // 에러를 반환
		            }
		        });
		    });
		}
    	
		//데이터 매핑
    	function setDetail(data){
			
    		$("#title").val(data.title);
    		myEditor.setData(data.content);
    	}
		
		//validation 처리
		function validate(){
			
			if($("#title").val() == ""){
				alert("제목을 입력해주세요.");
				return false;
			}
			
			if(myEditor.getData() == null){
				alert("내용을 입력해주세요.");
				return false;
			}
			
			if(boardId == 'GALLERY'){
				
				//선택된 썸네일이 없을 경우
				if(!checkSelectedThumbnail()){
					return false;
				}
			}
			
			return true;
		}
		
		// 선택된 썸네일이 있는지 확인
		function checkSelectedThumbnail() {
		    const $thumbnails = $('.thumbnail-item'); // 모든 썸네일 아이템 가져오기

		    if ($thumbnails.length === 0) {
		        // 썸네일이 하나도 없는 경우
		        console.log("No thumbnails available.");
		        alert("등록된 사진이 없습니다.\n사진을 등록해주세요.");
		        return false;
		    }

		    const $selectedThumbnail = $thumbnails.filter('.selected-thumbnail'); // 선택된 썸네일 필터링

		    if ($selectedThumbnail.length < 1) {
		        // 선택된 썸네일이 있는 경우
		        alert("선택된 썸네일이 없습니다.\n아래 썸네일의 사진을 클릭해 선택해주세요.");
		        return false; // 선택된 썸네일 반환
		    }
		    
		    return true;
		}

		
    	//버튼 init
    	function initDisplay(){
    		if(boardId == 'SPECIAL'){
    			$('#btnList').css('display', 'none');
    		}
    		
    		if(boardId == 'GALLERY'){
    			$('#thumbnailDiv').css('display', '');
    		}
    	}
    	
    	//게시글 저장
    	function saveBoard(){
    		
			if(!validate()){
				return;
			}
			
			if(!confirm("저장하시겠습니까?")){
				return;
			}
			
		    if (boardId === "GALLERY") {
		    	// GALLERY인 경우, 썸네일 경로 저장
		        const $selectedThumbnail = $(".thumbnail-item.selected-thumbnail img");
		    	
		        // 이미지 이름만 추출
		        const imageUrl = $selectedThumbnail.attr("src");
		        const imageName = imageUrl.substring(imageUrl.lastIndexOf("/") + 1); // 이미지 이름만 추출

		        // 썸네일 경로 서버에 저장 후 처리
		        saveThumbnail(imageName, function(thumbnailDir) {
		            if (thumbnailDir) {
		                // 썸네일 경로를 hidden input에 설정
		                $("#thumbnailDir").val(thumbnailDir);

		                // 게시글 저장 (update 또는 insert)
		                proceedWithSave();
		            } else {
		                alert("썸네일 저장에 실패했습니다.");
		            }
		        });
		    } else {
		        // GALLERY가 아닌 경우 바로 저장
		        proceedWithSave();
		    }
    	}
    	
    	// 게시글 저장 실행 (update 또는 insert)
    	function proceedWithSave() {
    	    
    		const params = $("#dataForm").serializeArray();
			const content = myEditor.getData();
			
			params.push({name : "boardId", value : boardId});
			params.push({name : "content", value : content});
    		
    		
    		if (boardId !== "" && seq !== "") {
    	        // update를 위한 seq 추가
    	        params.push({ name: "seq", value: seq });
    	        updateBoard(params);
    	    } else {
    	        insertBoard(params);
    	    }
    	}
    	
    	// 서버에 썸네일 경로 저장
    	function saveThumbnail(imageName, callback) {
    	   	
    		$.ajax({
    	        url: "/comm/createThumbnail",
    	        type: "POST",
    	        data: { 'imageName': imageName },
    	        success: function(response) {
    	            if (response.success === "true") {
    	                console.log("썸네일 저장 성공:", response.thumbnailDir);
    	                callback(response.thumbnailDir); // 썸네일 경로 반환
    	            } else {
    	                console.error("썸네일 저장 실패:", response.error);
    	                callback(null);
    	            }
    	        },
    	        error: function(xhr, status, error) {
    	            console.error("AJAX 요청 중 오류 발생:", error);
    	            callback(null);
    	        },
    	    });
    	}
    	
    	function updateBoard(params){
    		//수정일 경우
			$.ajax({
	            url: '/comm/updateBoard',
	            type: 'POST',
	            async: false,
	            data: params,
	            success: function (data) {
	            	if(data.isSuccess == true){
	            		alert("저장되었습니다.");
	            		location.href='/admin/boardDetail?boardId=' + boardId + '&seq=' + seq;
	            	}
	            },
	            error: function (xhr) {
	                alert("저장에 실패하였습니다.\n관리자에게 문의하시기 바랍니다.");
	            }
	        });
    	}
    	
    	function insertBoard(params){
    		//신규저장일 경우
			$.ajax({
	            url: '/comm/insertBoard',
	            type: 'POST',
	            async: false,
	            data: params,
	            success: function (data) {
	            	if(data.isSuccess == true){
	            		alert("저장되었습니다.");
	            		
	            		if(boardId == 'GALLERY'){
	            			location.href='/admin/galleryMng';
	            		}else{
	            			location.href='/admin/noticeMng';
	            		}
	            	}
	            },
	            error: function (xhr) {
	                alert("저장에 실패하였습니다.\n관리자에게 문의하시기 바랍니다.");
	            }
	        });
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
		            					<input type="hidden" id="thumbnailDir" name="thumbnailDir"/>
		            				</div>
		            				
		            				<div id="classic"></div>
	            				</form>
	            			</div>
	            		</div>
            		</div>
            	</div>
            	<div class="row" id="thumbnailDiv">
            		<div class="col">
            			<div class="card">
	            			<div class="card-body ">
		                        <div class="page-header float-left">
		                            <div class="page-title">
		                                <h1>썸네일</h1>
		                            </div>
		                            <div id="thumbnailCandidates">
		                            </div>
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
