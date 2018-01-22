package cn.niit.lms.domain;

public class BorrowBooks {

	private String ISBN;
	private String Title;
	private String Author;
	private String Borrow_Date;
	private String Return_Date;
	private float Fine;
	private int State;
	
	public String getISBN() {
		return ISBN;
	}

	public void setISBN(String ISBN) {
		this.ISBN = ISBN;
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String Title) {
		this.Title = Title;
	}

	public String getAuthor() {
		return Author;
	}

	public void setAuthor(String Author) {
		this.Author = Author;
	}

	public String getBorrow_Date(){
		return Borrow_Date;
	}
	
	public void setBorrow_Date(String Borrow_Date){
		this.Borrow_Date=Borrow_Date;
	}
	
	public String getRuturn_Date(){
		return Return_Date;
	}
	
	public void setReturn_Date(String Return_Date){
		this.Return_Date=Return_Date;
	}

	public float getFine() {
		return Fine;
	}
	public void setFine(float Fine){
		this.Fine = Fine;
	}
	
	public int getState() {
		return State;
	}
	public void setState(int State){
		this.State = State;
	}

	
}
