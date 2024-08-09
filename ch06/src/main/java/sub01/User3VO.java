package sub01;

public class User3VO {
	private String uid;
	private String name;
	private String birth;
	private String hp;
	private String addr;
	public User3VO(String uid, String name, String birth, String hp, String addr) {
		this.uid = uid;
		this.name = name;
		this.birth = birth;
		this.hp = hp;
		this.addr = addr;
	}
	public User3VO() {
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
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
	@Override
	public String toString() {
		return "User3VO [uid=" + uid + ", name=" + name + ", birth=" + birth + ", hp=" + hp + ", addr=" + addr + "]";
	}
	
	

}
