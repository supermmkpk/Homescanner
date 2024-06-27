package com.myhome.homelikes.model.service;

import java.util.List;
import java.util.Map;

import com.myhome.homelikes.model.HomeLikesDto;

/**
 * <pre>
 * 관심 주택 서비스 인터페이스
 * </pre>
 * @author 박봉균
 * @since JDK17
 */
public interface HomeLikesService {
	void insert(HomeLikesDto homeLikesDto) throws Exception;
	List<Map<String, String>> list(String userId) throws Exception;
	boolean isLiked(HomeLikesDto homeLikesDto) throws Exception;
	void delete(HomeLikesDto homeLikesDto) throws Exception;
}
