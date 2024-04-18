<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <%@include file="../comm/common_inc.jsp"%>    
    
    <script>
    	var grid;
    	var gridData;
    	
    	$(document).ready(function(){
            createGrid();
            
            grid.on('dblclick', (ev) => {
                selEquipNo = grid.getValue(ev.rowKey,"equip_no")
                selEquipNm = grid.getValue(ev.rowKey,"equip_nm")
                $("#equip_no_pop").val(selEquipNo);
                $("#equip_nm_pop").val(selEquipNm);
                fnOpenPop()
            });

            grid.on('editingStart', (ev) => {
                if(ev.columnName == 'status' || ev.columnName == 'class_cd') {
                    grid.stop();
                }
            });

            $('#sEquipNm').keydown(function (e) {
                if(e.keyCode == 13) {
                    e.preventDefault();
                    goSearch();
                }
            })

            //goSearch();
        });
    	
    	function createGrid(){
            grid = new tui.Grid({
                el : document.getElementById('grid'),
                data : gridData,
                scrollX : false,
                scrollY : false,
                bodyHeight : 409,
                editable : false,
                columns : [
                    {
                        header : 'No.',
                        name   : 'equip_nm',
                        width: 100
                    },{
                        header : '제목',
                        align: "center",
                        name   : 'manufacturer'
                    },{
                        header : '작성자',
                        align: "center",
                        name   : '',
                        width: 150
                    },{
                        header : '작성일',
                        align: "center",
                        name   : '',
                        width: 150
                    },{
                        header : '조회수',
                        align: "left",
                        name   : 'serial_no',
                        width: 150
                    }
                ],
                columnOptions: {
                    resizable: true
                }
            });
            const messageMap = {
                display: {
                    noData: '데이터가 존재하지 않습니다.'
                }
            };
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
		            				<button type="button" class="btn btn-outline-primary"><i class="fa fa-pencil"></i>&nbsp; 등록</button>
						            <!-- <button type="button" class="btn btn-outline-success"><i class="fa fa-magic"></i>&nbsp;등록</button> -->
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
        <!-- Footer -->
        <footer class="site-footer">
        <div class="footer-inner bg-white">
            <div class="row">
                <div class="col-sm-6">
                    Copyright © 2018 Ela Admin
                </div>
                <div class="col-sm-6 text-right">
                    Designed by <a href="https://colorlib.com">Colorlib</a>
                </div>
            </div>
        </div>
    </footer>
    </div>
    <!-- /#right-panel -->


    
</body>
</html>
