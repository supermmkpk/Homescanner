package com.myhome.house.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.myhome.house.model.HouseDealDto;
import com.myhome.house.model.HouseInfoDto;
import com.myhome.house.model.HouseReviewDto;
import com.myhome.house.model.MarkerDto;
import com.myhome.house.model.service.HouseService;
import com.myhome.notice.model.NoticeDto;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;

@Tag(name = "House", description = "집 관")
@RestController
@RequestMapping("/house")
@CrossOrigin("*")
@Slf4j
public class HouseController {
	private final HouseService houseService;

	@Autowired
	public HouseController(HouseService houseService) {
		this.houseService = houseService;
	}

	@Operation(summary = "가까운 집 찾기 ", description = "가까운 집을 위도 경도를 사용하여 Haversine공식을 통해 가까운 집을 30채 구하고, 최신 매매 가격을 같이 조회")
	@PostMapping("/nearest")
	public ResponseEntity<?> nearest(@RequestBody Map<String, Double> map) {
		try {
			List<Map<String, String>> houseList = houseService.nearest(map);
			return ResponseEntity.ok(houseList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

	@Operation(summary = "해당 집 매매정보 찾기  ", description = "건물 id를 이용하여 해당 건물의 매매정보를 구함 ")
	@GetMapping("/searchHouseDeal/{aptCode}")
	public ResponseEntity<?> searchHouse(@PathVariable String aptCode) {
		System.out.println(aptCode);
		try {
			System.out.println("들어옴 ");
			List<HouseDealDto> houseDealList = houseService.searchHouse(aptCode);
			return ResponseEntity.ok(houseDealList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("실패 "+ e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@Operation(summary = "특별시 및 도 이름 마커 리턴  ", description = "특별시 및 도 마커Dto List 리턴함 ")
	@GetMapping("/getMarkerDoSi")
	public ResponseEntity<?> getMarkerDoSi() {
		try {
			List<MarkerDto> markerList = houseService.getMarkerDoSi();
			return ResponseEntity.ok(markerList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("실패 "+ e.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@Operation(summary = "시 군구 마커를 리턴 ", description = "시 군구 마커 리스트를 반환함 ")
	@GetMapping("/getMarkerSiGunGu")
	public ResponseEntity<?> getMarkerSiGunGu() {
			try {
				List<MarkerDto> markerList = houseService.getMarkerSiGunGu();
				return ResponseEntity.ok(markerList);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println("실패 "+ e.getMessage());
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
	}
	
	@Operation(summary = "동 마커 찾기  ", description = "위도 경도를기준으로 일정 위치에 있는 동 마커를 반환함 ")
	@PostMapping("/getMarkerDong")
	public ResponseEntity<?> getMarkerDong(@RequestBody Map<String, Double> map) {
			try {
				List<MarkerDto> markerList = houseService.getMarkerDong(map);
				return ResponseEntity.ok(markerList);
			} catch (Exception e) {
				System.out.println("실패 "+ e.getMessage());
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
	}
	
	@Operation(summary = "아파트 이름 검색 ", description = "아파트 이름 검색 ")
	@GetMapping("/searchApartName/{param}")
	public ResponseEntity<?> searchApartName(@PathVariable String param) {
			try {
				List<HouseInfoDto> houseInfoList = houseService.searchApartName(param);
				return ResponseEntity.ok(houseInfoList);
			} catch (Exception e) {
				System.out.println("실패 "+ e.getMessage());
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
	}
	
	@Operation(summary = "동 이름 겁색  ", description = "동 이름 겁색 ")
	@GetMapping("/SearchDongName/{param}")
	public ResponseEntity<?> SearchDongName(@PathVariable String param) {
			try {
				List<MarkerDto> markerList = houseService.SearchDongName(param);
				return ResponseEntity.ok(markerList);
			} catch (Exception e) {
				System.out.println("실패 "+ e.getMessage());
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
	}
	
	@Operation(summary = "리뷰 가져오 ", description = "리뷰 가져오 ")
	@GetMapping("/listReview/{aptCode}")
	public ResponseEntity<?> listReview(@PathVariable String aptCode) {
			try {
				System.out.println(aptCode);
				List<HouseReviewDto> markerList = houseService.listReview(aptCode);
				return ResponseEntity.ok(markerList);
			} catch (Exception e) {
				System.out.println("실패 "+ e.getMessage());
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
	}

	@Operation(summary = "리뷰 추가 ", description = "리뷰 추")
	@PostMapping("/insertReview")
	public ResponseEntity<?> insertReview(@RequestBody Map<String, String> map) {
			try {
				houseService.insertReview(map);
				return new ResponseEntity<>(HttpStatus.OK);
			} catch (Exception e) {
				System.out.println("실패 "+ e.getMessage());
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
	}
	
	@Operation(summary = "테이블을 위한 거래정보", description = "해당 번호들 사이의 값을 리턴 ")
	@PostMapping("/tableHouseDeal")
	public ResponseEntity<?> tableHouseDeal(@RequestBody Map<String, String> map) {
			try {
				List<HouseDealDto> List = houseService.tableHouseDeal(map);
				return ResponseEntity.ok(List);
			} catch (Exception e) {
				System.out.println("실패 "+ e.getMessage());
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
	}
}
