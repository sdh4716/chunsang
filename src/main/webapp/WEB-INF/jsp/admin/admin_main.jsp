<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
	<%@include file="./comm/common_inc.jsp"%>  
	
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>천상화원 관리자</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="/assets/icon.png">
    <link rel="shortcut icon" href="/assets/icon.png">

	<!--  Chart js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.7.3/dist/Chart.bundle.min.js"></script>

    <style>
	    /* 이벤트 간의 간격을 조정 */
	    .fc-daygrid-event {
	      margin-bottom: 5px;  /* 각 이벤트 사이에 5px의 간격을 추가 */
	    }
	    
   	    @media(max-width:768px){
	   	    .reservationCalendar{
		    	width: 100% !important;
		    	min-height: 500px;
		    	font-size: 12px;
		    }
		    
		    .reservationCalendar .fc-event-title fc-sticky{
		    	
		    }
   	    }
	    

    </style>
    
    <script>
    	
    	const startDt = new Date();
	    const endDt = new Date();
	    startDt.setDate(endDt.getDate() - 7);	
    
		$("document").ready(function(){
	        
			//최근 7일 방문자 통계 조회
			selectUserVisit();
	        
			//예약정보 캘린더 초기화
			calendarInit('admin');
			
			//최근 7일 방문자 상세정보 조회
			selectUserVisitDetail();
			
		});	
    	
		function selectUserVisit(){
			
			const url = "/admin/selectUserVisit";
    		const params = { "srchStDt" : formatDate(startDt) , "srchEndDt" : formatDate(endDt) };
    		
    		$.ajax({
    			url: url,
    			type: 'GET',
    			//data : params,
    			data : params,
    			async : false,
    			success: function(data) {
    				setVisitChart(data.visitList);
    			},
    			error: function(xhr) {
    			  console.log('실패 - ', xhr);
    			}
    		});
			
		}
		
		function setVisitChart(visitList){
			
		    // 최근 7일의 날짜(label)와 방문자 수(data)를 담을 배열
		    const labels = [];
		    const data = [];

		    // visitData 배열을 순회하여 label과 data에 각각 push
		    visitList.forEach(item => {
		        labels.push(item.accessTime); // accessTime 값을 label로 사용
		        data.push(item.visitCnt);     // visitCnt 값을 data로 사용
		    });

		    // Chart.js로 차트를 그리기 위한 코드
		    var ctx = document.getElementById('userVisit').getContext('2d');
		    var myLineChart = new Chart(ctx, {
		        type: 'line', // 차트 유형을 'line'으로 설정
		        data: {
		            labels: labels, // X축: 날짜
		            datasets: [{
		                label: '방문자 수',  // 데이터셋 라벨
		                data: data,         // Y축: 각 날짜별 방문자 수
		                fill: false,        // 선 아래 영역을 채울지 여부
		                borderColor: 'rgba(75, 192, 192, 1)', // 선 색상
		                tension: 0.1        // 곡선 정도
		            }]
		        },
		        options: {
		            responsive: true,
		            plugins: {
		                legend: {
		                    display: true,
		                    position: 'top', // 범례 위치
		                }
		            },
		            scales: {
		                x: {
		                    display: true,
		                    title: {
		                        display: true,
		                        text: '날짜'  // X축 라벨
		                    }
		                },
		                y: {
		                    display: true,
		                    title: {
		                        display: true,
		                        text: '방문자 수'  // Y축 라벨
		                    }
		                }
		            }
		        }
		    });
			
		}
		
		function selectUserVisitDetail(){
			
			const url = "/admin/selectUserVisitDetail";
    		const params = { "srchStDt" : formatDate(startDt) , "srchEndDt" : formatDate(endDt) };
    		
    		$.ajax({
    			url: url,
    			type: 'GET',
    			//data : params,
    			data : params,
    			async : false,
    			success: function(data) {
    				
    				console.log("visitDetail");
    				console.log(data);
    			},
    			error: function(xhr) {
    			  console.log('실패 - ', xhr);
    			}
    		});
			
		}
		
	</script>
	
	
</head>

<body>
    <%@include file="./comm/left_menu.jsp"%>    
    <!-- Right Panel -->
    <div id="right-panel" class="right-panel">
        <%@include file="./comm/header.jsp"%>    
        <!-- Content -->
        <div class="content">
            <!-- Animated -->
            <div class="animated fadeIn">
            </div>
                <!-- /Widgets -->
                <!-- Orders -->
                <div class="orders">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="box-title">예약정보 </h4>
                                </div>
                                <div class="card-body--" style="">
                                	<div id="calendar" class="reservationCalendar" style="width:50%; margin: 0 auto; padding:20px;"></div>
                                </div>
                            </div> <!-- /.card -->
                        </div>  <!-- /.col-lg-8 -->
                    </div>
                </div>
                <!-- /.orders -->
                <!--  Traffic  -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="box-title">최근 7일 방문자통계 </h4>
                            </div>
                            <div class="row">
                                <div class="col-lg-8">
                                    <div class="card-body">
	                                	<div>
	                                		<canvas id="userVisit" width="" height="100%"></canvas>
	                                	</div>
		                            </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="card-body">
                                        <div class="progress-box progress-1">
                                            <h4 class="por-title">Visits</h4>
                                            <div class="por-txt">96,930 Users (40%)</div>
                                            <div class="progress mb-2" style="height: 5px;">
                                                <div class="progress-bar bg-flat-color-1" role="progressbar" style="width: 40%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                        <div class="progress-box progress-2">
                                            <h4 class="por-title">Bounce Rate</h4>
                                            <div class="por-txt">3,220 Users (24%)</div>
                                            <div class="progress mb-2" style="height: 5px;">
                                                <div class="progress-bar bg-flat-color-2" role="progressbar" style="width: 24%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                        <div class="progress-box progress-2">
                                            <h4 class="por-title">Unique Visitors</h4>
                                            <div class="por-txt">29,658 Users (60%)</div>
                                            <div class="progress mb-2" style="height: 5px;">
                                                <div class="progress-bar bg-flat-color-3" role="progressbar" style="width: 60%;" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                        <div class="progress-box progress-2">
                                            <h4 class="por-title">Targeted  Visitors</h4>
                                            <div class="por-txt">99,658 Users (90%)</div>
                                            <div class="progress mb-2" style="height: 5px;">
                                                <div class="progress-bar bg-flat-color-4" role="progressbar" style="width: 90%;" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                    </div> <!-- /.card-body -->
                                </div>
                            </div> <!-- /.row -->
                            <div class="card-body"></div>
                        </div>
                    </div><!-- /# column -->
                </div>
                <!--  /Traffic -->
                <div class="clearfix"></div>
                <!-- To Do and Live Chat -->
                <!-- /Calender Chart Weather -->
                <!-- Modal - Calendar - Add New Event -->
                <div class="modal fade none-border" id="event-modal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title"><strong>Add New Event</strong></h4>
                            </div>
                            <div class="modal-body"></div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-success save-event waves-effect waves-light">Create event</button>
                                <button type="button" class="btn btn-danger delete-event waves-effect waves-light" data-dismiss="modal">Delete</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /#event-modal -->
                <!-- Modal - Calendar - Add Category -->
                <div class="modal fade none-border" id="add-category">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title"><strong>Add a category </strong></h4>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label class="control-label">Category Name</label>
                                            <input class="form-control form-white" placeholder="Enter name" type="text" name="category-name"/>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="control-label">Choose Category Color</label>
                                            <select class="form-control form-white" data-placeholder="Choose a color..." name="category-color">
                                                <option value="success">Success</option>
                                                <option value="danger">Danger</option>
                                                <option value="info">Info</option>
                                                <option value="pink">Pink</option>
                                                <option value="primary">Primary</option>
                                                <option value="warning">Warning</option>
                                            </select>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-danger waves-effect waves-light save-category" data-dismiss="modal">Save</button>
                            </div>
                        </div>
                    </div>
                </div>
            <!-- /#add-category -->
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
                        Copyright &copy; 2018 Ela Admin
                    </div>
                    <div class="col-sm-6 text-right">
                        Designed by <a href="https://colorlib.com">Colorlib</a>
                    </div>
                </div>
            </div>
        </footer>
        <!-- /.site-footer -->
    </div>
    <!-- /#right-panel -->

    <!-- Scripts -->
    
    <!-- <script src="assets/js/init/fullcalendar-init.js"></script> -->

    <!--Local Stuff-->
    <script>
        jQuery(document).ready(function($) {
            "use strict";

            // Pie chart flotPie1
            var piedata = [
                { label: "Desktop visits", data: [[1,32]], color: '#5c6bc0'},
                { label: "Tab visits", data: [[1,33]], color: '#ef5350'},
                { label: "Mobile visits", data: [[1,35]], color: '#66bb6a'}
            ];

            $.plot('#flotPie1', piedata, {
                series: {
                    pie: {
                        show: true,
                        radius: 1,
                        innerRadius: 0.65,
                        label: {
                            show: true,
                            radius: 2/3,
                            threshold: 1
                        },
                        stroke: {
                            width: 0
                        }
                    }
                },
                grid: {
                    hoverable: true,
                    clickable: true
                }
            });
            // Pie chart flotPie1  End
            // cellPaiChart
            var cellPaiChart = [
                { label: "Direct Sell", data: [[1,65]], color: '#5b83de'},
                { label: "Channel Sell", data: [[1,35]], color: '#00bfa5'}
            ];
            $.plot('#cellPaiChart', cellPaiChart, {
                series: {
                    pie: {
                        show: true,
                        stroke: {
                            width: 0
                        }
                    }
                },
                legend: {
                    show: false
                },grid: {
                    hoverable: true,
                    clickable: true
                }

            });
            // cellPaiChart End
            // Line Chart  #flotLine5
            var newCust = [[0, 3], [1, 5], [2,4], [3, 7], [4, 9], [5, 3], [6, 6], [7, 4], [8, 10]];

            var plot = $.plot($('#flotLine5'),[{
                data: newCust,
                label: 'New Data Flow',
                color: '#fff'
            }],
            {
                series: {
                    lines: {
                        show: true,
                        lineColor: '#fff',
                        lineWidth: 2
                    },
                    points: {
                        show: true,
                        fill: true,
                        fillColor: "#ffffff",
                        symbol: "circle",
                        radius: 3
                    },
                    shadowSize: 0
                },
                points: {
                    show: true,
                },
                legend: {
                    show: false
                },
                grid: {
                    show: false
                }
            });
            // Line Chart  #flotLine5 End
            // Traffic Chart using chartist
            if ($('#traffic-chart').length) {
                var chart = new Chartist.Line('#traffic-chart', {
                  labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                  series: [
                  [0, 18000, 35000,  25000,  22000,  0],
                  [0, 33000, 15000,  20000,  15000,  300],
                  [0, 15000, 28000,  15000,  30000,  5000]
                  ]
              }, {
                  low: 0,
                  showArea: true,
                  showLine: false,
                  showPoint: false,
                  fullWidth: true,
                  axisX: {
                    showGrid: true
                }
            });

                chart.on('draw', function(data) {
                    if(data.type === 'line' || data.type === 'area') {
                        data.element.animate({
                            d: {
                                begin: 2000 * data.index,
                                dur: 2000,
                                from: data.path.clone().scale(1, 0).translate(0, data.chartRect.height()).stringify(),
                                to: data.path.clone().stringify(),
                                easing: Chartist.Svg.Easing.easeOutQuint
                            }
                        });
                    }
                });
            }
            // Traffic Chart using chartist End
            //Traffic chart chart-js
            if ($('#TrafficChart').length) {
                var ctx = document.getElementById( "TrafficChart" );
                ctx.height = 150;
                var myChart = new Chart( ctx, {
                    type: 'line',
                    data: {
                        labels: [ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul" ],
                        datasets: [
                        {
                            label: "Visit",
                            borderColor: "rgba(4, 73, 203,.09)",
                            borderWidth: "1",
                            backgroundColor: "rgba(4, 73, 203,.5)",
                            data: [ 0, 2900, 5000, 3300, 6000, 3250, 0 ]
                        },
                        {
                            label: "Bounce",
                            borderColor: "rgba(245, 23, 66, 0.9)",
                            borderWidth: "1",
                            backgroundColor: "rgba(245, 23, 66,.5)",
                            pointHighlightStroke: "rgba(245, 23, 66,.5)",
                            data: [ 0, 4200, 4500, 1600, 4200, 1500, 4000 ]
                        },
                        {
                            label: "Targeted",
                            borderColor: "rgba(40, 169, 46, 0.9)",
                            borderWidth: "1",
                            backgroundColor: "rgba(40, 169, 46, .5)",
                            pointHighlightStroke: "rgba(40, 169, 46,.5)",
                            data: [1000, 5200, 3600, 2600, 4200, 5300, 0 ]
                        }
                        ]
                    },
                    options: {
                        responsive: true,
                        tooltips: {
                            mode: 'index',
                            intersect: false
                        },
                        hover: {
                            mode: 'nearest',
                            intersect: true
                        }

                    }
                } );
            }
            //Traffic chart chart-js  End
            // Bar Chart #flotBarChart
            $.plot("#flotBarChart", [{
                data: [[0, 18], [2, 8], [4, 5], [6, 13],[8,5], [10,7],[12,4], [14,6],[16,15], [18, 9],[20,17], [22,7],[24,4], [26,9],[28,11]],
                bars: {
                    show: true,
                    lineWidth: 0,
                    fillColor: '#ffffff8a'
                }
            }], {
                grid: {
                    show: false
                }
            });
            // Bar Chart #flotBarChart End
        });
    </script>
</body>
</html>
