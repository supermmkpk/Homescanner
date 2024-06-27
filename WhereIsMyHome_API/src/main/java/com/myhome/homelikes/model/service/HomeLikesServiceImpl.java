package com.myhome.homelikes.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myhome.homelikes.model.HomeLikesDto;
import com.myhome.homelikes.model.mapper.HomeLikesMapper;

/**
 * <pre>
 * 관심 주택정보 서비스 구현 클래스
 * </pre>
 * 
 * @author 박봉균
 * @since JDK17
 */
@Service
public class HomeLikesServiceImpl implements HomeLikesService {
	private final HomeLikesMapper homeLikesMapper;

	@Autowired
	public HomeLikesServiceImpl(HomeLikesMapper homeLikesMapper) {
		this.homeLikesMapper = homeLikesMapper;
	}

	@Override
	public void insert(HomeLikesDto homeLikesDto) throws Exception {
		homeLikesMapper.insert(homeLikesDto);
	}

	@Override
	public List<Map<String, String>> list(String userId) throws Exception {
		return homeLikesMapper.list(userId);
	}

	@Override
	public boolean isLiked(HomeLikesDto homeLikesDto) throws Exception {
		List<HomeLikesDto> result = homeLikesMapper.isLiked(homeLikesDto);
		if (result.size() == 0 || result == null) {
			return false;
		}
		return true;
	}

	@Override
	public void delete(HomeLikesDto homeLikesDto) throws Exception {
		homeLikesMapper.delete(homeLikesDto);
	}

}
