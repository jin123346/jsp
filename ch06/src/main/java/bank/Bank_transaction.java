package bank;

public class Bank_transaction {
	private int t_no;
	private String t_a_no;
	private String t_dist;
	private String t_amount;
	private String t_datetime;
	public Bank_transaction(int t_no, String t_a_no, String t_dist, String t_amount, String t_datetime) {
		this.t_no = t_no;
		this.t_a_no = t_a_no;
		this.t_dist = t_dist;
		this.t_amount = t_amount;
		this.t_datetime = t_datetime;
	}

	public Bank_transaction() {
		// TODO Auto-generated constructor stub
	}

	public int getT_no() {
		return t_no;
	}

	public void setT_no(int t_no) {
		this.t_no = t_no;
	}

	public String getT_a_no() {
		return t_a_no;
	}

	public void setT_a_no(String t_a_no) {
		this.t_a_no = t_a_no;
	}

	public String getT_dist() {
		return t_dist;
	}

	public void setT_dist(String t_dist) {
		this.t_dist = t_dist;
	}

	public String getT_amount() {
		return t_amount;
	}

	public void setT_amount(String t_amount) {
		this.t_amount = t_amount;
	}

	public String getT_datetime() {
		return t_datetime;
	}

	public void setT_datetime(String t_datetime) {
		this.t_datetime = t_datetime;
	}

	@Override
	public String toString() {
		return "Bank_transaction [t_no=" + t_no + ", t_a_no=" + t_a_no + ", t_dist=" + t_dist + ", t_amount=" + t_amount
				+ ", t_datetime=" + t_datetime + "]";
	}
	
	
	
	

}
