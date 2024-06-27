package com.myhome.notice.model.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myhome.notice.model.NoticeDto;
import com.myhome.notice.model.mapper.NoticeMapper;

/**
 * <pre>
 * 공지사항 서비스 구현 클래스
 * </pre>
 * @author 박봉균
 * @since JDK17
 */
@Service
public class NoticeServiceImpl implements NoticeService{
	private final NoticeMapper noticeMapper;
	
	@Autowired
	private NoticeServiceImpl(NoticeMapper noticeMapper) {
		this.noticeMapper = noticeMapper;
	}

	@Override
	public List<NoticeDto> getNotices(Integer limit) throws Exception {	
		return noticeMapper.getNotices(limit);
	}

	@Override
	public void writeNotice(NoticeDto notice) throws Exception {
		noticeMapper.writeNotice(notice);
		
	}

	@Override
	public NoticeDto detailNotice(int id) throws Exception {
		return noticeMapper.detailNotice(id);
	}

	@Override
	public void deleteNotice(int id) throws Exception {
		// TODO Auto-generated method stub
		noticeMapper.deleteNotice(id);
	}

	@Override
	public void modifyNotice(NoticeDto notice) throws Exception {
		// TODO Auto-generated method stub
		noticeMapper.modifyNotice(notice);
	}
}
