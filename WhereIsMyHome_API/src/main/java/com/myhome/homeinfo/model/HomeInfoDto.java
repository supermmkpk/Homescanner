package com.myhome.homeinfo.model;


/**
 * <pre>
 * 주택 정보 DTO 클래스
 * </pre>
 * @author 박봉균
 * @since JDK17
 */
public class HomeInfoDto {

	private String dealAmount;		//거래금액(만원)
	private String buildYear;		//건축년도
	private String dealYear;		//계약년도
	private String dealMonth;		//계약일
	private String dealDay;			//계약월
	private String roadName;		//도로명
	private String dong;  			//법정동
	private String apartmentName;	//아파트명
	private String exclusiveArea;	//전용면적(m^2)
	private String jibun;			//지번
	private String floor; 			//층
	private String dealerLocation;	//중개사소재지	
	private String registrationDate;//등기일자
	private String address;			//주소
	
	
	public String getDealAmount() {
		return dealAmount;
	}
	public void setDealAmount(String dealAmount) {
		this.dealAmount = dealAmount;
	}
	public String getBuildYear() {
		return buildYear;
	}
	public void setBuildYear(String buildYear) {
		this.buildYear = buildYear;
	}
	public String getDealYear() {
		return dealYear;
	}
	public void setDealYear(String dealYear) {
		this.dealYear = dealYear;
	}
	public String getDealMonth() {
		return dealMonth;
	}
	public void setDealMonth(String dealMonth) {
		this.dealMonth = dealMonth;
	}
	public String getDealDay() {
		return dealDay;
	}
	public void setDealDay(String dealDay) {
		this.dealDay = dealDay;
	}
	public String getRoadName() {
		return roadName;
	}
	public void setRoadName(String roadName) {
		this.roadName = roadName;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getApartmentName() {
		return apartmentName;
	}
	public void setApartmentName(String apartmentName) {
		this.apartmentName = apartmentName;
	}
	public String getExclusiveArea() {
		return exclusiveArea;
	}
	public void setExclusiveArea(String exclusiveArea) {
		this.exclusiveArea = exclusiveArea;
	}
	public String getJibun() {
		return jibun;
	}
	public void setJibun(String jibun) {
		this.jibun = jibun;
	}
	public String getFloor() {
		return floor;
	}
	public void setFloor(String floor) {
		this.floor = floor;
	}
	public String getDealerLocation() {
		return dealerLocation;
	}
	public void setDealerLocation(String dealerLocation) {
		this.dealerLocation = dealerLocation;
	}
	public String getRegistrationDate() {
		return registrationDate;
	}
	public void setRegistrationDate(String registrationDate) {
		this.registrationDate = registrationDate;
	}	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "HomeInfoDto [dealAmount=" + dealAmount + ", buildYear=" + buildYear + ", dealYear=" + dealYear
				+ ", dealMonth=" + dealMonth + ", dealDay=" + dealDay + ", roadName=" + roadName + ", dong=" + dong
				+ ", apartmentName=" + apartmentName + ", exclusiveArea=" + exclusiveArea + ", jibun=" + jibun
				+ ", floor=" + floor + ", dealerLocation=" + dealerLocation + ", registrationDate=" + registrationDate
				+ ", address=" + address + "]";
	}
	
	
}
