$(document).ready(function() {
					
	if (location.protocol === 'http:' && location.host != 'localhost:8080' ) {
		location.href = 'https://' + location.host;
		// location.href = 'https' + location.href.substring(4); // query 유지
	}
	
		$('.search-trigger').on('click', function(event) {
		event.preventDefault();
		event.stopPropagation();
		$('.search-trigger').parent('.header-left').addClass('open');
	});

	$('.search-close').on('click', function(event) {
		event.preventDefault();
		event.stopPropagation();
		$('.search-trigger').parent('.header-left').removeClass('open');
	});

	$('.equal-height').matchHeight({
		property: 'max-height'
	});

	// var chartsheight = $('.flotRealtime2').height();
	// $('.traffic-chart').css('height', chartsheight-122);


	// Counter Number
	$('.count').each(function () {
		$(this).prop('Counter',0).animate({
			Counter: $(this).text()
		}, {
			duration: 3000,
			easing: 'swing',
			step: function (now) {
				$(this).text(Math.ceil(now));
			}
		});
	});


	 
	 
	// Menu Trigger
	$('#menuToggle').on('click', function(event) {
		var windowWidth = $(window).width();   		 
		if (windowWidth<1010) { 
			$('body').removeClass('open'); 
			if (windowWidth<760){ 
				$('#left-panel').slideToggle(); 
			} else {
				$('#left-panel').toggleClass('open-menu');  
			} 
		} else {
			$('body').toggleClass('open');
			$('#left-panel').removeClass('open-menu');  
		} 
			 
	}); 

	 
	$(".menu-item-has-children.dropdown").each(function() {
		$(this).on('click', function() {
			var $temp_text = $(this).children('.dropdown-toggle').html();
			$(this).children('.sub-menu').prepend('<li class="subtitle">' + $temp_text + '</li>'); 
		});
	});


	// Load Resize 
	$(window).on("load resize", function(event) { 
		var windowWidth = $(window).width();  		 
		if (windowWidth<1010) {
			$('body').addClass('small-device'); 
		} else {
			$('body').removeClass('small-device');  
		} 
		
	});
});

// 날짜 형식 맞추기 (yyyy-mm-dd)
function formatDate(date){
	const year = date.getFullYear();
    const month = ('0' + (date.getMonth() + 1)).slice(-2);
    const day = ('0' + date.getDate()).slice(-2);
    return `${year}-${month}-${day}`;
}

//ckEditor 이미지 업로드 utils
/*const uploadAdapter = (loader) => {
   return {
     upload: () => {
       return new Promise((resolve, reject) => {
         loader.file.then((file) => {
           // 만약 서버에 이미지 올리고 받는 등 추가 작업 있을 시 추가해서 이미지 주소를 가져온다.
           resolve({
             default: '여기에 이미지 주소 넣으면 됩니다.',
           });
         });
       });
     },
   };
 };*/
 
 
class MyUploadAdapter {
    constructor(loader) {
        this.loader = loader;
        this.url = '/comm/uploadFile'; // 서버 업로드 엔드포인트
    }

    upload() {
        return this.loader.file
            .then((file) => new Promise((resolve, reject) => {
                const formData = new FormData();
                formData.append('file', file);

                $.ajax({
                    url: this.url,
                    type: 'POST',
                    data: formData,
                    processData: false, // 파일 데이터를 쿼리 문자열로 변환하지 않음
                    contentType: false, // Content-Type을 자동으로 설정
                    success: (response) => {
                        if (response.uploaded) {
                            resolve({
                                default: response.url, // 서버에서 반환된 이미지 URL
                            });
                        } else {
                            reject(response.error || '업로드 실패');
                        }
                    },
                    error: (xhr, status, error) => {
                        console.error('AJAX 요청 중 오류 발생:', error);
                        reject('업로드 실패');
                    },
                });
            }));
    }

    abort() {
        console.warn('업로드가 중단되었습니다.');
    }
}

function MyCustomUploadAdapterPlugin(editor) {
    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
        return new MyUploadAdapter(loader);
    };
}

/*const uploadPlugin = (editor) => {
  editor.plugins.get('FileRepository').createUploadAdapter = (
    loader: any
  ) => {
    return uploadAdapter(loader);
  };
};*/

function requestDataPost(url, formData){
	$.ajax({
		url: url,
		type: 'POST',
		data : formData,
		async : false,
		success: function(data) {
			results= data;
		},
		error: function(xhr) {
		  console.log('실패 - ', xhr);
		}
	});
}

function requestDataGet(url, formData){
	$.ajax({
		url: url,
		type: 'GET',
		data : formData,
		async : false,
		success: function(data) {
			results= data;
		},
		error: function(xhr) {
		  console.log('실패 - ', xhr);
		}
	});
}

function requestDataAsync(url, formData, callback){
	$.ajax({
		url: url,
		type: 'POST',
		data : formData,
		async : true,
		success: function(data) {
			// 성공적으로 데이터를 받아왔을 때 callback 함수를 실행하여 후속 처리
            callback(data);
		},
		error: function(xhr) {
		  console.log('실패 - ', xhr);
		}
	});
}

// FullCalendar에 "예약 가능" 배경 이벤트를 추가하는 함수
function addAvailableDates(calendar, calendarStart, calendarEnd) {
    const backgroundEvents = [];

    let currentDate = new Date(calendarStart);
    while (currentDate <= calendarEnd) {
        backgroundEvents.push({
            start: new Date(currentDate),
            end: new Date(currentDate),
            rendering: 'background',  // 배경으로 표시
            backgroundColor: 'green',  // 예약 가능은 초록색 배경
            allDay: true
        });
        currentDate.setDate(currentDate.getDate() + 1);  // 하루씩 증가
    }

    calendar.addEventSource(backgroundEvents);  // FullCalendar에 배경 이벤트 추가
}

function getAirbnbCalendarData(calendar, calendarStart, calendarEnd, userType) {
    
    // 비동기적으로 데이터 요청하고 처리하는 콜백
    requestDataAsync("/airbnb/getAirbnbCalendarData", {"userType" : userType}, function(results) {
        // 받아온 데이터를 콘솔에 출력
        console.log(results.reservations);

        // 이벤트 데이터를 FullCalendar 형식으로 변환
        const events = convertToFullCalendarEvents(results.reservations, calendarStart, calendarEnd);

        // FullCalendar에 이벤트 추가
        calendar.addEventSource(events);
    });
}

// 타임스탬프 데이터를 FullCalendar 이벤트 형식으로 변환하는 함수
function convertToFullCalendarEvents(reservations, calendarStart, calendarEnd) {
    const events = [];
    const reservedDates = {};  // 예약된 날짜를 방별로 추적하는 객체
    const today = new Date();  // 오늘 날짜

    // 1. 달력의 모든 날짜를 초기화
    let currentDate = new Date(calendarStart);
    while (currentDate <= calendarEnd) {
        const dateKey = currentDate.toDateString();
        reservedDates[dateKey] = { "구름": false, "하늘": false };  // 모든 날짜에 대해 방별 예약 상태 초기화
        currentDate.setDate(currentDate.getDate() + 1);  // 하루씩 증가
    }

    // 2. 예약된 날짜를 처리하여 예약된 기간 동안 예약 불가로 설정
    reservations.forEach(reservation => {
        let title = '';
        let backgroundColor = '';

        if (reservation.status === 'Reserved') {
            title = reservation.roomName + '방 : 예약됨';  // '예약됨' 상태
            backgroundColor = 'blue';  // 예약됨은 파란색
        } else if (reservation.status === 'Airbnb (Not available)') {
            title = reservation.roomName + '방 : 예약불가';  // '예약불가' 상태
            backgroundColor = 'gray';  // 예약 불가는 회색
        }

        const startDate = new Date(reservation.startDate);
        const endDate = new Date(reservation.endDate);

        // 예약된 기간 동안의 날짜를 예약 불가로 설정
        let reservedDate = new Date(startDate);
        while (reservedDate <= endDate) {
            const dateKey = reservedDate.toDateString();

            // 방에 대해 예약 상태 설정
            if (reservedDates[dateKey]) {
                reservedDates[dateKey][reservation.roomName] = true;
            }

            reservedDate.setDate(reservedDate.getDate() + 1);  // 하루씩 증가
        }

        // 예약된 이벤트 추가
        events.push({
            title: title,
            start: startDate,
            end: endDate,
            allDay: true,
            backgroundColor: backgroundColor,
            borderColor: backgroundColor
        });
    });

   /*  // 3. 예약되지 않은 날짜에 대해 '예약 가능' 처리 (오늘 이전은 제외)
    currentDate = new Date(calendarStart);
    while (currentDate <= calendarEnd) {
        const dateKey = currentDate.toDateString();
        const rooms = ["구름", "하늘"];  // 방 이름 배열

        rooms.forEach(room => {
            // 오늘 이전의 날짜는 예약 가능으로 표시하지 않음
            if (currentDate >= today) {
                // 해당 날짜에 해당 방에 예약이 없으면 "예약 가능" 이벤트 추가
                if (!reservedDates[dateKey][room]) {
                    events.push({
                        title: room + ' : 예약 가능',
                        start: new Date(currentDate),
                        end: new Date(currentDate),
                        allDay: true,
                        backgroundColor: 'green',  // 초록색으로 예약 가능 표시
                        borderColor: 'green'
                    });
                }
            }
        });

        currentDate.setDate(currentDate.getDate() + 1);  // 하루씩 증가
    } */

    return events;
}

//Airbnb (Not available)
function calendarInit(userType){
	
	let calendarStartDt;
	let calendarEndDt;
	
	const calendarEl = document.getElementById('calendar')
	
	// FullCalendar 초기화
    const calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        locale: 'ko',  // 한국어 로케일 설정
        datesSet: function(info) {
            // Airbnb 데이터 가져와서 예약 가능 및 예약된 날짜 처리
            calendarStartDt = info.start;
            calendarEndDt = info.end;
        }
    });

	// 캘린더 렌더링 (한 번만 호출)
	calendar.render();
	
	// Airbnb 데이터 가져와서 FullCalendar에 이벤트 추가
	getAirbnbCalendarData(calendar, calendarStartDt, calendarEndDt, userType);
	
}