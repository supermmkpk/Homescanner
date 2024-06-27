package com.myhome.notice.model.service;

import java.util.List;
import java.util.Optional;

import com.myhome.notice.model.NoticeDto;

/**
 * <pre>
 * 공지사항 서비스 인터페이스
 * </pre>
 * @author 박봉균
 * @since JDK17
 */
public interface NoticeService {
	List<NoticeDto> getNotices(Integer limit) throws Exception;
	void writeNotice(NoticeDto notice) throws Exception;
	NoticeDto detailNotice(int id) throws Exception;
	void deleteNotice(int id) throws Exception;
	void modifyNotice(NoticeDto notice) throws Exception;
}
