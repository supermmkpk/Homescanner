package com.myhome.house.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.myhome.house.model.HouseDealDto;
import com.myhome.house.model.HouseInfoDto;
import com.myhome.house.model.HouseReviewDto;
import com.myhome.house.model.MarkerDto;

public interface HouseService {

	List<Map<String, String>> nearest(Map<String, Double> map) throws Exception;
	List<HouseDealDto> searchHouse(String aptCode) throws Exception;
	List<MarkerDto> getMarkerDoSi() throws Exception;
	List<MarkerDto> getMarkerSiGunGu() throws Exception;
	List<MarkerDto> getMarkerDong(Map<String, Double> map) throws Exception;
	List<HouseInfoDto> searchApartName(String param) throws Exception;
	List<MarkerDto> SearchDongName(String param) throws Exception;
	void insertReview(Map<String, String> map) throws Exception;
	List<HouseReviewDto> listReview(String aptCode) throws Exception;
	List<HouseDealDto> tableHouseDeal(Map<String, String> map) throws Exception;
}
