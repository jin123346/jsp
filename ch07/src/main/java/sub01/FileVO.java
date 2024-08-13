package sub01;


public class FileVO {
	private int no;
	private String uid;
	private String name;
	private String Oname;
	private String Sname;
	private String rdate;
	public FileVO(int no, String uid, String name, String oname, String sname, String rdate) {
		this.no = no;
		this.uid = uid;
		this.name = name;
		Oname = oname;
		Sname = sname;
		this.rdate = rdate;
	}
	
	public FileVO() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public String getOname() {
		return Oname;
	}

	public void setOname(String oname) {
		Oname = oname;
	}

	public String getSname() {
		return Sname;
	}

	public void setSname(String sname) {
		Sname = sname;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	@Override
	public String toString() {
		return "FileVO [no=" + no + ", uid=" + uid + ", name=" + name + ", Oname=" + Oname + ", Sname=" + Sname
				+ ", rdate=" + rdate + "]";
	}

	
}
