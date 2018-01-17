package cn.niit.lms.domain;

public class Book {

	private String ISBN;
	private String Title;
	private String Author;
	private String Category;
	private int Amount;
	private int Remain_Amount;
	private int Price;
	public Book(String ISBN,String Title,String Author,String Category,int Amount,int Remain_Amount,int Price){
		this.ISBN=ISBN;
		this.Title=Title;
		this.Author=Author;
		this.Category=Category;
		this.Amount=Amount;
		this.Remain_Amount=Remain_Amount;
		this.Price=Price;		
	}
	public Book() {
		
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
    
    public int getAmount() {
        return Amount;
    }
    public void setAmount(int Amount) {
        this.Amount = Amount;
    }
    
    public int getRemain_Amount() {
        return Remain_Amount;
    }
    public void setRemain_Amount(int Remain_Amount) {
        this.Remain_Amount = Remain_Amount;
    }
    
    public int getPrice() {
        return Price;
    }
    public void setPrice(int Price) {
        this.Price = Price;
    }
    
    @Override
    public String toString(){
    	return "Book{" + "ISBN=" + ISBN + ", Title=" + Title + ", Author=" + Author + ", Category=" + Category + ", Amount=" + Amount
				+ ", Remain_Amount=" + Remain_Amount + ", Price=" + Price + '}';
    	
    }
}
