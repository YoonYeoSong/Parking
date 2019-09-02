package api.test.main;

public class Parking {
	private String parkingCode;
	private String parkingName;
	private String addr;
	private String parkingType;
	private String parkingTypeNm;
	private int operationRule;
	private String operationRuleNm;
	private String tel;
	private int queStatus;
	private String queStatusNm;
	private int capacity;
	private int curParking;
	
	public Parking() {
		// TODO Auto-generated constructor stub
	}
	
	public Parking(String parkingCode, String parkingName, String addr, String parkingType, String parkingTypeNm,
			int operationRule, String operationRuleNm, String tel, int queStatus, String queStatusNm, int capacity,
			int curParking) {
		super();
		this.parkingCode = parkingCode;
		this.parkingName = parkingName;
		this.addr = addr;
		this.parkingType = parkingType;
		this.parkingTypeNm = parkingTypeNm;
		this.operationRule = operationRule;
		this.operationRuleNm = operationRuleNm;
		this.tel = tel;
		this.queStatus = queStatus;
		this.queStatusNm = queStatusNm;
		this.capacity = capacity;
		this.curParking = curParking;
	}
	
	

	@Override
	public String toString() {
		return "Parking [parkingCode=" + parkingCode + ", parkingName=" + parkingName + ", addr=" + addr
				+ ", parkingType=" + parkingType + ", parkingTypeNm=" + parkingTypeNm + ", operationRule="
				+ operationRule + ", operationRuleNm=" + operationRuleNm + ", tel=" + tel + ", queStatus=" + queStatus
				+ ", queStatusNm=" + queStatusNm + ", capacity=" + capacity + ", curParking=" + curParking + "]";
	}

	public String getParkingCode() { return parkingCode; } 
	public void setParkingCode(String parkingCode) { this.parkingCode = parkingCode; } 
	public String getParkingName() { return parkingName; } 
	public void setParkingName(String parkingName) { this.parkingName = parkingName; } 
	public String getAddr() { return addr; } 
	public void setAddr(String addr) { this.addr = addr; } 
	public String getParkingType() { return parkingType; } 
	public void setParkingType(String parkingType) { this.parkingType = parkingType; } 
	public String getParkingTypeNm() { return parkingTypeNm; } 
	public void setParkingTypeNm(String parkingTypeNm) { this.parkingTypeNm = parkingTypeNm; } 
	public int getOperationRule() { return operationRule; } 
	public void setOperationRule(int operationRule) { this.operationRule = operationRule; } 
	public String getOperationRuleNm() { return operationRuleNm; } 
	public void setOperationRuleNm(String operationRuleNm) { this.operationRuleNm = operationRuleNm; } 
	public String getTel() { return tel; } 
	public void setTel(String tel) { this.tel = tel; } 
	public int getQueStatus() { return queStatus; } 
	public void setQueStatus(int queStatus) { this.queStatus = queStatus; } 
	public String getQueStatusNm() { return queStatusNm; } 
	public void setQueStatusNm(String queStatusNm) { this.queStatusNm = queStatusNm; } 
	public int getCapacity() { return capacity; } 
	public void setCapacity(int capacity) { this.capacity = capacity; } 
	public int getCurParking() { return curParking; } 
	public void setCurParking(int curParking) { this.curParking = curParking; } 
	
//				<CUR_PARKING_TIME>2019-07-14 22:56:50</CUR_PARKING_TIME>
//				<PAY_YN>N</PAY_YN>
//				<PAY_NM>무료</PAY_NM>
//				<NIGHT_FREE_OPEN>N</NIGHT_FREE_OPEN>
//				<NIGHT_FREE_OPEN_NM>야간 미개방</NIGHT_FREE_OPEN_NM>
//				<WEEKDAY_BEGIN_TIME>0000</WEEKDAY_BEGIN_TIME>
//				<WEEKDAY_END_TIME>0000</WEEKDAY_END_TIME>
//				<WEEKEND_BEGIN_TIME>0000</WEEKEND_BEGIN_TIME>
//				<WEEKEND_END_TIME>0000</WEEKEND_END_TIME>
//				<HOLIDAY_BEGIN_TIME>0000</HOLIDAY_BEGIN_TIME>
//				<HOLIDAY_END_TIME>0000</HOLIDAY_END_TIME>
//				<SYNC_TIME>2019-06-10 10:01:23</SYNC_TIME>
//				<SATURDAY_PAY_YN>Y</SATURDAY_PAY_YN>
//				<SATURDAY_PAY_NM>유료</SATURDAY_PAY_NM>
//				<HOLIDAY_PAY_YN>Y</HOLIDAY_PAY_YN>
//				<HOLIDAY_PAY_NM>유료</HOLIDAY_PAY_NM>
//				<FULLTIME_MONTHLY>0</FULLTIME_MONTHLY>
//				<GRP_PARKNM>1111013800003</GRP_PARKNM>
//				<RATES>0</RATES>
//				<TIME_RATE>0</TIME_RATE>
//				<ADD_RATES>0</ADD_RATES>
//				<ADD_TIME_RATE>0</ADD_TIME_RATE>
//				<BUS_RATES>0</BUS_RATES>
//				<BUS_TIME_RATE>0</BUS_TIME_RATE>
//				<BUS_ADD_TIME_RATE>0</BUS_ADD_TIME_RATE>
//				<BUS_ADD_RATES>0</BUS_ADD_RATES>
//				<DAY_MAXIMUM>0</DAY_MAXIMUM>
//				<LAT>37.57134087</LAT>
//				<LNG>126.98776281</LNG>
//				<ASSIGN_CODE>PIS02</ASSIGN_CODE>
//				<ASSIGN_CODE_NM>미배정,미점유</ASSIGN_CODE_NM>

}
