package com.myhome.homeinfo.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.myhome.homeinfo.model.HomeInfoDto;
import com.myhome.homeinfo.model.SearchCondition;
import com.myhome.homeinfo.model.SortCondition;
import com.myhome.homeinfo.model.service.HomeInfoService;
import com.myhome.homeinfo.model.service.HomeInfoServiceImpl;
import com.myhome.homelikes.model.HomeLikesDto;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.parameters.RequestBody;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * <pre>
 * 주택정보 컨트롤러 클래스
 * </pre>
 * @author 박봉균
 * @since JDK17
 */

//HomeInfoController 클래스를 컨트롤러 Bean으로 등록하고, 정의된 모든 요청 URL은 "/homeInfo"로 시작하도록 매핑
@Tag(name="HomeInfo", description="주택 실시간 정보")
@RestController
@RequestMapping("/homeInfo")
@CrossOrigin("*")
public class HomeInfoController{
	
	private final HomeInfoService homeInfoService;
	
	@Autowired
	public HomeInfoController(HomeInfoService homeInfoService){
		super();
		this.homeInfoService=homeInfoService;
	}
	
	/*
	@Operation(summary="아파트 실거래가 조회", description="동별,월별 아파트 실거래가를 조회합니다")
	@GetMapping("/list")
	public ResponseEntity<?> list(@ModelAttribute Map<String, String> map){
		System.out.println("debug: --아파트 실거래가 조회--");
		int pageNo = Integer.parseInt(map.get("pageno"));
		String locationCode = map.get("gugun").substring(0, 5);
		String dealDate = map.get("year") + map.get("month");
		System.out.printf("debug: pageNo=%d, locationCode=%s, dealDate=%s\n", pageNo, locationCode, dealDate);
		
		List<HomeInfoDto> list;
		try {
			list = homeInfoService.getHomeInfoList(pageNo, locationCode, dealDate);
			return ResponseEntity.ok(list);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
	}
	*/

	/*
	@Operation(summary="아파트 실거래가 상세 조회", description="아파트의 상세 정보를 조회합니다")
	@GetMapping("/view")
	public String view(@RequestBody HomeInfoDto homeInfoDto) {
		System.out.println("debug: --주택 상세--");
		
		try {
			model.addAttribute("homeInfoDto", homeInfoDto);
			return "homeInfo/homeInfoView";
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("error", "상세보기에서 에러가 발생했습니다.");
			return "error/error";
		}
	}
	*/
	
	
	@Operation(summary="아파트 실거래가 조회", description="전체 조회하고 검색 조건(type=all/name)이 있으면 아파트명으로 검색합니다.")
	@GetMapping("")
	public ResponseEntity<?> searchList(@RequestBody SearchCondition searchCondition) {
		System.out.println("debug: --아파트 실거래가 조회--");
		String type = searchCondition.getType();
		int pageNo = Integer.parseInt(searchCondition.getPageNo());
		String locationCode = searchCondition.getGugun().substring(0, 5);
		String dealDate = searchCondition.getYear() + searchCondition.getMonth();
		String searchText = searchCondition.getSearchText();
		System.out.printf("debug: pageNo=%d, locationCode=%s, dealDate=%s\n", pageNo, locationCode, dealDate);
		
		try {
			List<HomeInfoDto> list = new ArrayList<>();

			if(type.equals("name")) {
				list = homeInfoService.getHomeSearchInfoList(pageNo, locationCode, dealDate, searchText);
				System.out.println("debug: 조회 성공 : " + list);
			}
			else {
				list = homeInfoService.getHomeInfoList(pageNo, locationCode, dealDate);
				System.out.println("debug: 조회 성공 : " + list);
			}
			return ResponseEntity.ok(list);
			
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@Operation(summary="아파트 정렬", description="정렬 조건(type=apartmentName,floor,exclusiveArea,dong,dealAmount)으로 정렬합니다.")
	@GetMapping("/sort")
	public ResponseEntity<?> sort(@RequestBody SortCondition sortCondition) {
		String sortType = sortCondition.getSortType();
		try {
			List<HomeInfoDto> list = new ArrayList<>();
			if(sortType.equals("asc")) {
				list = sortAsc(sortCondition);	
			}
			if(sortType.equals("desc")) {
				list = sortDesc(sortCondition);
			}
			return ResponseEntity.ok(list);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

	private List<HomeInfoDto> sortDesc(SortCondition sortCondition) throws Exception {
		System.out.println("debug: -- 정렬 오름차순 --");
		int pageNo = Integer.parseInt(sortCondition.getPageNo());
		String locationCode = sortCondition.getGugun().substring(0, 5);
		String dealDate = sortCondition.getYear() + sortCondition.getMonth();
		String type = sortCondition.getType();
		System.out.printf("debug: pageNo=%d, locationCode=%s, dealDate=%s\n", pageNo, locationCode, dealDate);
		return homeInfoService.getHomeSearchListDesc(pageNo, locationCode, dealDate, type);
//		System.out.println("debug: 조회 성공 : " + list);
	}

	private List<HomeInfoDto> sortAsc(SortCondition sortCondition) throws Exception {
		System.out.println("debug: -- 정렬 오름차순 --");
		int pageNo = Integer.parseInt(sortCondition.getPageNo());
		String locationCode = sortCondition.getGugun().substring(0, 5);
		String dealDate = sortCondition.getYear() + sortCondition.getMonth();
		String type = sortCondition.getType();
		System.out.printf("debug: pageNo=%d, locationCode=%s, dealDate=%s\n", pageNo, locationCode, dealDate);
		return homeInfoService.getHomeSearchListAsc(pageNo, locationCode, dealDate, type);
//		System.out.println("debug: 조회 성공 : " + list);

	}	
	
}
