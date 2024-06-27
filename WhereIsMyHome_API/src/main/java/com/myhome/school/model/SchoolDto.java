package com.myhome.school.model;

/**
 * <pre>
 * 학교 정보 DTO 클래스
 * </pre>
 * @author 박봉균
 * @since JDK17
 */
public class SchoolDto {
	private String schoolId; 		//기본키(학교코드)
	private String schoolName;		//학교명
	private String schoolLevel;		//학교 등급(초중고등학교)
	private String estDate;			//설립일       
	private String estType;			//설립구분(공립,사립)        
	private String mainOrBranch;	//본교,분교 
	private String status;			//상태(운영중)
	private String jibunAddress;	//지번 주소   
	private String roadAddress;		//도로명 주소    
	private String eduOfficeCode;	//관할 시도교육청 코드 
	private String eduOfficeName;	//관할 시도교육청명 
	private String latitude;		//위도        
	private String longitude;		//경도
	
	public SchoolDto() {}

	public SchoolDto(String schoolId, String schoolName, String schoolLevel, String estDate, String estType,
			String mainOrBranch, String status, String jibunAddress, String roadAddress, String eduOfficeCode,
			String eduOfficeName, String latitude, String longitude) {
		super();
		this.schoolId = schoolId;
		this.schoolName = schoolName;
		this.schoolLevel = schoolLevel;
		this.estDate = estDate;
		this.estType = estType;
		this.mainOrBranch = mainOrBranch;
		this.status = status;
		this.jibunAddress = jibunAddress;
		this.roadAddress = roadAddress;
		this.eduOfficeCode = eduOfficeCode;
		this.eduOfficeName = eduOfficeName;
		this.latitude = latitude;
		this.longitude = longitude;
	}

	public String getSchoolId() {
		return schoolId;
	}

	public void setSchoolId(String schoolId) {
		this.schoolId = schoolId;
	}

	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public String getSchoolLevel() {
		return schoolLevel;
	}

	public void setSchoolLevel(String schoolLevel) {
		this.schoolLevel = schoolLevel;
	}

	public String getEstDate() {
		return estDate;
	}

	public void setEstDate(String estDate) {
		this.estDate = estDate;
	}

	public String getEstType() {
		return estType;
	}

	public void setEstType(String estType) {
		this.estType = estType;
	}

	public String getMainOrBranch() {
		return mainOrBranch;
	}

	public void setMainOrBranch(String mainOrBranch) {
		this.mainOrBranch = mainOrBranch;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getJibunAddress() {
		return jibunAddress;
	}

	public void setJibunAddress(String jibunAddress) {
		this.jibunAddress = jibunAddress;
	}

	public String getRoadAddress() {
		return roadAddress;
	}

	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}

	public String getEduOfficeCode() {
		return eduOfficeCode;
	}

	public void setEduOfficeCode(String eduOfficeCode) {
		this.eduOfficeCode = eduOfficeCode;
	}

	public String getEduOfficeName() {
		return eduOfficeName;
	}

	public void setEduOfficeName(String eduOfficeName) {
		this.eduOfficeName = eduOfficeName;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	@Override
	public String toString() {
		return "SchoolDto [schoolId=" + schoolId + ", schoolName=" + schoolName + ", schoolLevel=" + schoolLevel
				+ ", estDate=" + estDate + ", estType=" + estType + ", mainOrBranch=" + mainOrBranch + ", status="
				+ status + ", jibunAddress=" + jibunAddress + ", roadAddress=" + roadAddress + ", eduOfficeCode="
				+ eduOfficeCode + ", eduOfficeName=" + eduOfficeName + ", latitude=" + latitude + ", longitude="
				+ longitude + "]";
	}
	
}
