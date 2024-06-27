package com.myhome.notice.model.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;

import com.myhome.notice.model.NoticeDto;

/**
 * <pre>
 * 공지사항 Mapper 인터페이스
 * </pre>
 * @author 박봉균
 * @since JDK17
 */
@Mapper
public interface NoticeMapper {
	List<NoticeDto> getNotices(Integer limit) throws SQLException;
	void writeNotice(NoticeDto notice) throws SQLException;
	NoticeDto detailNotice(int id) throws SQLException;
	void deleteNotice(int id) throws SQLException;
	void modifyNotice(NoticeDto noticeDto) throws SQLException;
}
