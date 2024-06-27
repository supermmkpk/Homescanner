package com.myhome.school.model.service;

import java.util.List;

import com.myhome.school.model.SchoolDto;

/**
 * <pre>
 * 학교 정보 서비스 인터페이스
 * </pre>
 * @author 박봉균
 * @since JDK17
 */
public interface SchoolService {
	public List<SchoolDto> listByDong(String dong) throws Exception;
}
