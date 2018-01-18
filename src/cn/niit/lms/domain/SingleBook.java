package cn.niit.lms.domain;

public class SingleBook {
	
	private String ISBN;
	private String Title;
	private String Author;
	private String Category;
	private int BID;
	
	public SingleBook() {
		
	}
	
	public int getBID() {
        return BID;
    }
    public void setBID(int BID) {
        this.BID = BID;
    }
	
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
    
    public String getCategory(){
    	return Category;
    }
    public void setCategory(String Category){
    	this.Category=Category;
    }
}
