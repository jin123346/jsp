package college;

public class StudentVO {
	
	private String stdNo;
	private String stdName;
	private String stdHp;
	private String stdYear;
	private String stdAddress;
	public StudentVO(String stdNo, String stdName, String stdHp, String stdYear, String stdAddress) {
		this.stdNo = stdNo;
		this.stdName = stdName;
		this.stdHp = stdHp;
		this.stdYear = stdYear;
		this.stdAddress = stdAddress;
	}

	public StudentVO() {
		// TODO Auto-generated constructor stub
	}

	public String getStdNo() {
		return stdNo;
	}

	public void setStdNo(String stdNo) {
		this.stdNo = stdNo;
	}

	public String getStdName() {
		return stdName;
	}

	public void setStdName(String stdName) {
		this.stdName = stdName;
	}

	public String getStdHp() {
		return stdHp;
	}

	public void setStdHp(String stdHp) {
		this.stdHp = stdHp;
	}

	public String getStdYear() {
		return stdYear;
	}

	public void setStdYear(String stdYear) {
		this.stdYear = stdYear;
	}

	public String getStdAddress() {
		return stdAddress;
	}

	public void setStdAddress(String stdAddress) {
		this.stdAddress = stdAddress;
	}

	@Override
	public String toString() {
		return "StudentVO [stdNo=" + stdNo + ", stdName=" + stdName + ", stdHp=" + stdHp + ", stdYear=" + stdYear
				+ ", stdAddress=" + stdAddress + "]";
	}
	
	
	

}
