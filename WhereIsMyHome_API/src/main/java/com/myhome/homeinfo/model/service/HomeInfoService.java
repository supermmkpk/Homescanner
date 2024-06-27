package com.myhome.homeinfo.model.service;

import java.util.List;

import com.myhome.homeinfo.model.HomeInfoDto;

/**
 * <pre>
 * 주택정보 서비스 인터페이스
 * </pre>
 * @author 박봉균
 * @since JDK17
 */
public interface HomeInfoService {

	List<HomeInfoDto> getHomeInfoList(int pageNo, String locationCode, String dealDate) throws Exception;

	List<HomeInfoDto> getHomeSearchListDesc(int pageNo, String locationCode, String dealDate, String type) throws Exception;
	List<HomeInfoDto> getHomeSearchListAsc(int pageNo, String locationCode, String dealDate, String type) throws Exception;
	List<HomeInfoDto> getHomeSearchInfoList(int pageNo, String locationCode, String dealDate, String searchText)throws Exception;
}
