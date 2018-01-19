package cn.niit.lms.domain;

public class Rule {
	
	private String Role;
	private int book_limit;
	private int day_fine;
	private int limit_month;
	
	public String getRole() {
		return Role;
	}
	public void setRole(String role) {
		Role = role;
	}
	public int getBook_limit() {
		return book_limit;
	}
	public void setBook_limit(int book_limit) {
		this.book_limit = book_limit;
	}
	public int getDay_fine() {
		return day_fine;
	}
	public void setDay_fine(int day_fine) {
		this.day_fine = day_fine;
	}
	public int getLimit_month() {
		return limit_month;
	}
	public void setLimit_month(int limit_month) {
		this.limit_month = limit_month;
	}
	
	@Override
	public String toString(){
		return "Rule{" + "Role=" + Role + ", book_limit=" + book_limit + ", day_fine=" + day_fine + ", limit_month=" + limit_month + '}';
	}


}
