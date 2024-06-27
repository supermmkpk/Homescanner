package com.myhome.school.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myhome.school.model.SchoolDto;
import com.myhome.school.model.mapper.SchoolMapper;

/**
 * <pre>
 * 학교 정보 서비스 구현 클래스
 * </pre>
 * @author 박봉균
 * @since JDK17
 */
@Service
public class SchoolServiceImpl implements SchoolService {

	private final SchoolMapper schoolMapper;
	
	@Autowired
	public SchoolServiceImpl(SchoolMapper schoolMapper) {
		this.schoolMapper = schoolMapper;
	}

	@Override
	public List<SchoolDto> listByDong(String dong) throws Exception {
		return schoolMapper.listByDong(dong);
	}
	
}
