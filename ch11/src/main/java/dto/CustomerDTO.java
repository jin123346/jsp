package dto;

import java.util.Date;

public class CustomerDTO {
	private String custId;
	private String name;
	private String hp;
	private String addr;
	private String redate;
	
	
	public CustomerDTO() {	}


	public CustomerDTO(String custId, String name, String hp, String addr, String redate) {
		this.custId = custId;
		this.name = name;
		this.hp = hp;
		this.addr = addr;
		this.redate = redate;
	}


	public String getCustId() {
		return custId;
	}


	public void setCustId(String custId) {
		this.custId = custId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getHp() {
		return hp;
	}


	public void setHp(String hp) {
		this.hp = hp;
	}


	public String getAddr() {
		return addr;
	}


	public void setAddr(String addr) {
		this.addr = addr;
	}


	public String getRedate() {
		return redate;
	}


	public void setRedate(String redate) {
		this.redate = redate;
	}


	@Override
	public String toString() {
		return "CustomerDTO [custId=" + custId + ", name=" + name + ", hp=" + hp + ", addr=" + addr + ", redate="
				+ redate + "]";
	}
	
	
	
	
	
	
	

}
