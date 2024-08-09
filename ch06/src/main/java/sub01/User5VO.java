package sub01;

public class User5VO {
	private int seq;
	private String name;
	private String gender;
	private int age;
	private String addr;
	@Override
	public String toString() {
		return "User5VO [seq=" + seq + ", name=" + name + ", gender=" + gender + ", age=" + age + ", addr=" + addr
				+ "]";
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public User5VO(int seq, String name, String gender, int age, String addr) {
		this.seq = seq;
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.addr = addr;
	}
	
	public User5VO() {
		// TODO Auto-generated constructor stub
	}
	
	
	
}
