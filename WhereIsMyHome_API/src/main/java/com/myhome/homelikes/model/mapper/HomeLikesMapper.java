package com.myhome.homelikes.model.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.myhome.homelikes.model.HomeLikesDto;

/**
 * <pre>
 * 관심 주택 Mapper 인터페이스
 * </pre>
 * @author 박봉균
 * @since JDK17
 */
@Mapper
public interface HomeLikesMapper {
	void insert(HomeLikesDto homeLikesDto) throws SQLException;
	List<Map<String, String>> list(String userId) throws SQLException;
	List<HomeLikesDto> isLiked(HomeLikesDto homeLikesDto) throws SQLException;
	void delete(HomeLikesDto homeLikesDto) throws SQLException;
}
