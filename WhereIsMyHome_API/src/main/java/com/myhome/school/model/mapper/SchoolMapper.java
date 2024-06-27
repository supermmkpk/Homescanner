package com.myhome.school.model.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myhome.school.model.SchoolDto;

/**
 * <pre>
 * 학교 정보 Mapper 인터페이스
 * </pre>
 * @author 박봉균
 * @since JDK17
 */
@Mapper
public interface SchoolMapper {
	public List<SchoolDto> listByDong(String dong) throws SQLException;
}
