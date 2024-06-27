package com.myhome.house.model.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.myhome.house.model.HouseDealDto;
import com.myhome.house.model.HouseInfoDto;
import com.myhome.house.model.HouseReviewDto;
import com.myhome.house.model.MarkerDto;
import com.myhome.house.model.SearchTableDto;

@Mapper
public interface HouseMapper {

	List<Map<String, String>> nearest(Map<String, Double> map) throws SQLException;
	List<HouseDealDto> searchHouse(String aptCode) throws SQLException;
	List<MarkerDto> getMarkerDoSi() throws SQLException;
	List<MarkerDto> getMarkerSiGunGu() throws SQLException;
	List<MarkerDto> getMarkerDong(Map<String, Double> map) throws SQLException;
	List<HouseInfoDto> searchApartName(String param) throws SQLException;
	List<MarkerDto> SearchDongName(String param) throws SQLException;
	void insertReview(Map<String, String> map) throws SQLException;
	List<HouseReviewDto> listReview(String aptCode) throws SQLException;
	List<HouseDealDto> tableHouseDeal(SearchTableDto searchTableDto) throws SQLException;
}
