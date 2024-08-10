package bank;

public class Bank_CustomerVO {
	private String c_no;
	private String c_name;
	private int c_dis;
	private String c_phone;
	private String c_addr;
	
	
	public Bank_CustomerVO() {
		// TODO Auto-generated constructor stub
	}


	public Bank_CustomerVO(String c_no, String c_name, int c_dis, String c_phone, String c_addr) {
		this.c_no = c_no;
		this.c_name = c_name;
		this.c_dis = c_dis;
		this.c_phone = c_phone;
		this.c_addr = c_addr;
	}


	public String getC_no() {
		return c_no;
	}


	public void setC_no(String c_no) {
		this.c_no = c_no;
	}


	public String getC_name() {
		return c_name;
	}


	public void setC_name(String c_name) {
		this.c_name = c_name;
	}


	public int getC_dis() {
		return c_dis;
	}


	public void setC_dis(int c_dis) {
		this.c_dis = c_dis;
	}


	public String getC_phone() {
		return c_phone;
	}


	public void setC_phone(String c_phone) {
		this.c_phone = c_phone;
	}


	public String getC_addr() {
		return c_addr;
	}


	public void setC_addr(String c_addr) {
		this.c_addr = c_addr;
	}


	@Override
	public String toString() {
		return "Bank_CustomerVO [c_no=" + c_no + ", c_name=" + c_name + ", c_dis=" + c_dis + ", c_phone=" + c_phone
				+ ", c_addr=" + c_addr + "]";
	}

	
	
	
	
	
}
