package com.jboard.dto;

public class UserDTO {
	private String uid;
	private String pass;
	private String name;
	private String nick;
	private String email;
	private String hp;
	private String role;
	private String zip;
	private String addr1;
	private String addr2;
	private String regip;
	private String regdate;
	private String leavedate;
	
	public UserDTO() {
	}
	public UserDTO(String uid, String pass, String name, String nick, String email, String hp, String role, String zip,
			String addr1, String addr2, String regip, String regdate, String leavedate) {
		this.uid = uid;
		this.pass = pass;
		this.name = name;
		this.nick = nick;
		this.email = email;
		this.hp = hp;
		this.role = role;
		this.zip = zip;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.regip = regip;
		this.regdate = regdate;
		this.leavedate = leavedate;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getRegip() {
		return regip;
	}
	public void setRegip(String regip) {
		this.regip = regip;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getLeavedate() {
		return leavedate;
	}
	public void setLeavedate(String leavedate) {
		this.leavedate = leavedate;
	}
	@Override
	public String toString() {
		return "UserDTO [uid=" + uid + ", pass=" + pass + ", name=" + name + ", nick=" + nick + ", email=" + email
				+ ", hp=" + hp + ", role=" + role + ", zip=" + zip + ", addr1=" + addr1 + ", addr2=" + addr2
				+ ", regip=" + regip + ", regdate=" + regdate + ", leavedate=" + leavedate + "]";
	}

	
	

}
