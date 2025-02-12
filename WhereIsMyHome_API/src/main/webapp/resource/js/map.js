/////////////////////  카카오지도 ////////////////////

var map, mapContainer;
function initMap() {
	mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	map = new kakao.maps.Map(mapContainer, mapOption); 
		
		
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();
	
	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
}


function resizeMap() {
        var mapContainer = document.getElementById('map');
        mapContainer.style.width = '100px';
        mapContainer.style.height = '200px'; 
}

function relayout() {    
    map.relayout();
}


var marker, infowindow;
function viewMap(address, name) {
  if (marker != null && infowindow != null) {
    marker.setMap(null);
    infowindow.close();
  }
  // 주소-좌표 변환 객체를 생성합니다
  let geocoder = new kakao.maps.services.Geocoder();

  // 주소로 좌표를 검색합니다
  geocoder.addressSearch(address, function (result, status) {
    // 정상적으로 검색이 완료됐으면
    if (status === kakao.maps.services.Status.OK) {
      var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	  // 결과값으로 받은 위치를 마커로 표시합니다
	  marker = new kakao.maps.Marker({
	    map: map,
	    position: coords,
	  });
	
	  // 인포윈도우로 장소에 대한 설명을 표시합니다
	  infowindow = new kakao.maps.InfoWindow({
	    content: `<div style="width:150px;text-align:center;padding:6px 0;">${name}</div>`,
	  });
	  infowindow.open(map, marker);
	
	  // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	  map.setCenter(coords);
	}
  });
  
}