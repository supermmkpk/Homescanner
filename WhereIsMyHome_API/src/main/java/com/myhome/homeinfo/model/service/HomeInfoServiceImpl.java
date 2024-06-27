package com.myhome.homeinfo.model.service;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Service;
import org.w3c.dom.*;

import com.myhome.homeinfo.model.HomeInfoDto;

/**
 * <pre>
 * 주택 정보 서비스의 구현 클래스
 * </pre>
 * @author 박봉균
 * @since JDK17
 */
@Service
public class HomeInfoServiceImpl implements HomeInfoService {
	
	public HomeInfoServiceImpl() {	}
	
	@Override
	public List<HomeInfoDto> getHomeInfoList(int pageNo, String locationCode, String dealDate) throws Exception {
		/* 아파트매매 실거래 상세 자료 공공데이터 URL */
		StringBuilder urlBuilder = new StringBuilder("http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev"); 
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=DKVbHeV%2FESU53Qd5JpuG%2FkRUZemd%2Blip4r8jgr7WbBnN%2FSJ4rV2v3pQhlvRSi0uyJ6ZYGTUHaZYGfWIbk9n0hw%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(String.valueOf(pageNo), "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("25", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("LAWD_CD","UTF-8") + "=" + URLEncoder.encode(locationCode, "UTF-8")); /*지역코드*/
        urlBuilder.append("&" + URLEncoder.encode("DEAL_YMD","UTF-8") + "=" + URLEncoder.encode(dealDate, "UTF-8")); /*계약월*/
        URL url = new URL(urlBuilder.toString());
        System.out.println("debug: 공공데이터 requestUrl=" + url);
        
        /* URL과 통신 */
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader bufferedReader;
        
        /* 정상 통신이라면 데이터 읽어오기 */
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            bufferedReader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            bufferedReader = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        
        /* 데이터 라인 단위로 읽기 */
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = bufferedReader.readLine()) != null) {
            sb.append(line);
        }
        bufferedReader.close();
        conn.disconnect();
        
        /* xml <- 라인 단위로 읽은 데이터 */
        String xml = sb.toString();
        System.out.println("debug: xml : " + xml);
        
        return domParser(xml);
    }
	
	private List<HomeInfoDto> domParser(String xml) throws Exception {
		
		List<HomeInfoDto> list = new ArrayList<>();
		try {
			// xml을 파싱해주는 객체를 생성               
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder documentBuilder = factory.newDocumentBuilder();
			// xml 문자열은 InputStream으로 변환
			InputStream inputStream = new ByteArrayInputStream(xml.getBytes());
			
			/* 파싱 시작 */
			Document document = documentBuilder.parse(inputStream);
			
			
			// <items>태그의 모든 <item> 가져오기                
			NodeList items = document.getElementsByTagName("item");
			System.out.println(items);
			
			//각 아이템에 대하여
			for(int idx = 0; idx < items.getLength(); idx++) {
				Element item = (Element) items.item(idx);
				
				// 원하는 태그 데이터 찾아오기 
				String dealAmount = item.getElementsByTagName("거래금액").item(0).getTextContent();	//거래금액(만원)
				String buildYear = item.getElementsByTagName("건축년도").item(0).getTextContent();		//건축년도
				String dealYear = item.getElementsByTagName("년").item(0).getTextContent();		//계약년도
				String dealMonth = item.getElementsByTagName("월").item(0).getTextContent();		//계약일
				String dealDay = item.getElementsByTagName("일").item(0).getTextContent();			//계약월
				String roadName = item.getElementsByTagName("도로명").item(0).getTextContent();		//도로명
				String dong = item.getElementsByTagName("법정동").item(0).getTextContent();  		//법정동
				String apartmentName = item.getElementsByTagName("아파트").item(0).getTextContent();	//아파트명
				String exclusiveArea = item.getElementsByTagName("전용면적").item(0).getTextContent();	//전용면적(m^2)
				String jibun = item.getElementsByTagName("지번").item(0).getTextContent();			//지번
				String floor = item.getElementsByTagName("층").item(0).getTextContent(); 			//층
				String dealerLocation = item.getElementsByTagName("중개사소재지").item(0).getTextContent();	//중개사소재지	
				String registrationDate = item.getElementsByTagName("등기일자").item(0).getTextContent();	//등기일자
				String address = dealerLocation + " " + dong + " " + jibun;				//주소
				
				HomeInfoDto homeInfoDto = new HomeInfoDto();
				homeInfoDto.setDealAmount(dealAmount);
				homeInfoDto.setBuildYear(buildYear);
				homeInfoDto.setDealYear(dealYear);
				homeInfoDto.setDealMonth(dealMonth);
				homeInfoDto.setDealDay(dealDay);
				homeInfoDto.setRoadName(roadName);
				homeInfoDto.setDong(dong);
				homeInfoDto.setApartmentName(apartmentName);
				homeInfoDto.setExclusiveArea(exclusiveArea);
				homeInfoDto.setJibun(jibun);
				homeInfoDto.setFloor(floor);
				homeInfoDto.setDealerLocation(dealerLocation);
				homeInfoDto.setRegistrationDate(registrationDate);
				homeInfoDto.setAddress(address);
				
				list.add(homeInfoDto);
			}
		} catch(Exception e) {
			throw e;
		}
		
		return list;	
	}

	@Override
	public List<HomeInfoDto> getHomeSearchListDesc(int pageNo, String locationCode, String dealDate, String type)
			throws Exception {
		/* 아파트매매 실거래 상세 자료 공공데이터 URL */
		StringBuilder urlBuilder = new StringBuilder("http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev"); 
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=DKVbHeV%2FESU53Qd5JpuG%2FkRUZemd%2Blip4r8jgr7WbBnN%2FSJ4rV2v3pQhlvRSi0uyJ6ZYGTUHaZYGfWIbk9n0hw%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(String.valueOf(pageNo), "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("25", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("LAWD_CD","UTF-8") + "=" + URLEncoder.encode(locationCode, "UTF-8")); /*지역코드*/
        urlBuilder.append("&" + URLEncoder.encode("DEAL_YMD","UTF-8") + "=" + URLEncoder.encode(dealDate, "UTF-8")); /*계약월*/
        URL url = new URL(urlBuilder.toString());
        System.out.println("debug: 공공데이터 requestUrl=" + url);
        
        /* URL과 통신 */
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader bufferedReader;
        
        /* 정상 통신이라면 데이터 읽어오기 */
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            bufferedReader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            bufferedReader = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        
        /* 데이터 라인 단위로 읽기 */
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = bufferedReader.readLine()) != null) {
            sb.append(line);
        }
        bufferedReader.close();
        conn.disconnect();
        
        /* xml <- 라인 단위로 읽은 데이터 */
        String xml = sb.toString();
        System.out.println("debug: xml : " + xml);
        List<HomeInfoDto> list = domParser(xml);
        
        return HomeInfoSortDesc.Sort(list,type);
	}

	@Override
	public List<HomeInfoDto> getHomeSearchListAsc(int pageNo, String locationCode, String dealDate, String type)
			throws Exception {
		/* 아파트매매 실거래 상세 자료 공공데이터 URL */
		StringBuilder urlBuilder = new StringBuilder("http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev"); 
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=DKVbHeV%2FESU53Qd5JpuG%2FkRUZemd%2Blip4r8jgr7WbBnN%2FSJ4rV2v3pQhlvRSi0uyJ6ZYGTUHaZYGfWIbk9n0hw%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(String.valueOf(pageNo), "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("25", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("LAWD_CD","UTF-8") + "=" + URLEncoder.encode(locationCode, "UTF-8")); /*지역코드*/
        urlBuilder.append("&" + URLEncoder.encode("DEAL_YMD","UTF-8") + "=" + URLEncoder.encode(dealDate, "UTF-8")); /*계약월*/
        URL url = new URL(urlBuilder.toString());
        System.out.println("debug: 공공데이터 requestUrl=" + url);
        
        /* URL과 통신 */
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader bufferedReader;
        
        /* 정상 통신이라면 데이터 읽어오기 */
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            bufferedReader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            bufferedReader = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        
        /* 데이터 라인 단위로 읽기 */
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = bufferedReader.readLine()) != null) {
            sb.append(line);
        }
        bufferedReader.close();
        conn.disconnect();
        
        /* xml <- 라인 단위로 읽은 데이터 */
        String xml = sb.toString();
        System.out.println("debug: xml : " + xml);
        List<HomeInfoDto> list = domParser(xml);
        
        return HomeInfoSortAsc.Sort(list,type);
	}

	@Override
	public List<HomeInfoDto> getHomeSearchInfoList(int pageNo, String locationCode, String dealDate,
			String searchText) throws Exception {
		StringBuilder urlBuilder = new StringBuilder("http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev"); 
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=DKVbHeV%2FESU53Qd5JpuG%2FkRUZemd%2Blip4r8jgr7WbBnN%2FSJ4rV2v3pQhlvRSi0uyJ6ZYGTUHaZYGfWIbk9n0hw%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(String.valueOf(pageNo), "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("25", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("LAWD_CD","UTF-8") + "=" + URLEncoder.encode(locationCode, "UTF-8")); /*지역코드*/
        urlBuilder.append("&" + URLEncoder.encode("DEAL_YMD","UTF-8") + "=" + URLEncoder.encode(dealDate, "UTF-8")); /*계약월*/
        URL url = new URL(urlBuilder.toString());
        System.out.println("debug: 공공데이터 requestUrl=" + url);
        
        /* URL과 통신 */
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader bufferedReader;
        
        /* 정상 통신이라면 데이터 읽어오기 */
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            bufferedReader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            bufferedReader = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        
        /* 데이터 라인 단위로 읽기 */
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = bufferedReader.readLine()) != null) {
            sb.append(line);
        }
        bufferedReader.close();
        conn.disconnect();
        
        /* xml <- 라인 단위로 읽은 데이터 */
        String xml = sb.toString();
        System.out.println("debug: xml : " + xml);
        List<HomeInfoDto> returnList = new ArrayList<>();
        
        List<HomeInfoDto> list = domParser(xml);
        for(HomeInfoDto homeInfoDto : list) {
        	if(!HomeInfoSearch.KMP(homeInfoDto.getApartmentName(), searchText)) continue;
        	returnList.add(homeInfoDto);
        }
        return returnList;
	}

}
