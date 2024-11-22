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
    		
    		selectRoomPrice();
    		
            // 등록버튼 클릭
            $("#btnSave").click(function(){
            	saveRoomPrice();
            });
            
            window.addEventListener('resize', () => {
                grid.refreshLayout(); // TUI Grid 레이아웃 강제 재조정
            });
            
        });
    	
    	// 데이터 조회
    	function selectRoomPrice(){
    		
    		const url = "/comm/selectRoomPrice";
    		
    		$.ajax({
    			url: url,
    			type: 'GET',
    			data : [],
    			async : false,
    			success: function(data) {
    				console.log(data);
    				grid.resetData(data.roomPriceList);
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
                columns : [
                	{
                        header : '객실명',
                        name   : 'roomNm',
                        align  : "center",
                        rowSpan: true // 동일 값 병합
                    },{
                        header : '기간종류',
                        name   : 'periodType',
                  	 	align  : "center"
                    },{
                        header : '주중,주말',
                        name   : 'dayType',
                        align  : "center"
                   },{
                        header: '요금(만원)',
                        name: 'price',
                        align: "center",
                        editor: {
                            type: 'text',
                            options: {
                                // 숫자만 입력 가능하도록 설정
                                onInput: (ev) => {
                                    const input = ev.target;
                                    input.value = input.value.replace(/[^0-9]/g, ''); // 숫자 외 제거
                                }
                            }
                        }
                    }
                ],
                columnOptions: {
                    resizable: true
                }
                
            });
            
            // 입력값 검증
            grid.on('beforeChange', (ev) => {
                
            	const columnName = ev.changes[0].columnName;
            	const nextValue = ev.changes[0].nextValue;
            	
            	// 'price' 컬럼에만 숫자 검증 적용
            	if(columnName == 'price'){
            		if (!/^\d*$/.test(nextValue)) {
                        ev.stop(); // 숫자가 아닌 값이면 변경 취소
                        alert('숫자만 입력 가능합니다.');
                    }
            	}
                
            });
        }
    	
    	//객실 요금 저장
    	function saveRoomPrice(){
    		
    		const modifiedRows = grid.getModifiedRows();
    		const updatedRows = modifiedRows.updatedRows;
    		
    	    if (updatedRows.length === 0) {
    	        alert("수정된 데이터가 없습니다.");
    	        return;
    	    }
    	    
    	    if(!confirm("저장하시겠습니까?")) return;
    		
			$.ajax({
	            url: '/comm/updateRoomPrice',
	            type: 'POST',
	            async: false,
	            contentType: 'application/json', // 필수
	            data: JSON.stringify(updatedRows),
	            success: function (data) {
	            	if(data.isSuccess == true){
	            		
	            		alert("저장되었습니다.");
	            		
	            		//객실요금 재조회
	            		selectRoomPrice()
	            	}
	            },
	            error: function (xhr) {
	                alert("저장에 실패하였습니다.\n관리자에게 문의하시기 바랍니다.");
	            }
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
                                <h1>객실 요금 관리</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="#">객실 관리</a></li>
                                    <li class="active">객실 요금 관리</li>
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
		            				<button type="button" id="btnSave" class="btn btn-outline-primary">저장</button>
					            </div>
					            <div style="width:100%; overflow-x:auto;">
					            	<div id="grid"></div>
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
