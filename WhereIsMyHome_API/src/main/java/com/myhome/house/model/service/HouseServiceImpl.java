package com.myhome.house.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myhome.house.model.HouseDealDto;
import com.myhome.house.model.HouseInfoDto;
import com.myhome.house.model.HouseReviewDto;
import com.myhome.house.model.MarkerDto;
import com.myhome.house.model.SearchTableDto;
import com.myhome.house.model.mapper.HouseMapper;

@Service
public class HouseServiceImpl implements HouseService {

	private final HouseMapper houseMapper;
	
	@Autowired
	public HouseServiceImpl(HouseMapper houseMapper) {
		this.houseMapper=houseMapper;
	}
	
	@Override
	public List<Map<String, String>> nearest(Map<String, Double> map) throws Exception {
		// TODO Auto-generated method stub
		return houseMapper.nearest(map);
	}

	@Override
	public List<HouseDealDto> searchHouse(String aptCode) throws Exception {
		// TODO Auto-generated method stub
		return houseMapper.searchHouse(aptCode);
	}

	@Override
	public List<MarkerDto> getMarkerDoSi() throws Exception {
		// TODO Auto-generated method stub
		return houseMapper.getMarkerDoSi();
	}

	@Override
	public List<MarkerDto> getMarkerSiGunGu() throws Exception {
		// TODO Auto-generated method stub
		return houseMapper.getMarkerSiGunGu();
	}

	@Override
	public List<MarkerDto> getMarkerDong(Map<String, Double> map) throws Exception {
		// TODO Auto-generated method stub
		return houseMapper.getMarkerDong(map);
	}

	@Override
	public List<HouseInfoDto> searchApartName(String param) throws Exception {
		// TODO Auto-generated method stub
		return houseMapper.searchApartName(param);
	}

	@Override
	public List<MarkerDto> SearchDongName(String param) throws Exception {
		// TODO Auto-generated method stub
		return houseMapper.SearchDongName(param);
	}

	@Override
	public void insertReview(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		houseMapper.insertReview(map);
	}

	@Override
	public List<HouseReviewDto> listReview(String aptCode) throws Exception {
		// TODO Auto-generated method stub
		return houseMapper.listReview(aptCode);
	}

	@Override
	public List<HouseDealDto> tableHouseDeal(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		SearchTableDto searchTableDto = new SearchTableDto();
		searchTableDto.setAptCode(map.get("aptCode"));
		searchTableDto.setSort(map.get("sort"));
		searchTableDto.setOffset(Integer.parseInt(map.get("offset")));
		searchTableDto.setLimit(Integer.parseInt(map.get("limit")));
		return houseMapper.tableHouseDeal(searchTableDto);
	}

}
