package Book;

public class Book {
	
	private int no;
	private String bookname;
	private String author;
	private String publisher;
	private int price;
	
	public Book(int no, String bookname, String author, String publisher, int price) {
		super();
		this.no = no;
		this.bookname = bookname;
		this.author = author;
		this.publisher = publisher;
		this.price = price;
	}

	public Book(String bookname, String author, String publisher, int price) {
		this.bookname = bookname;
		this.author = author;
		this.publisher = publisher;
		this.price = price;
	}
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getBookname() {
		return bookname;
	}

	public void setBookname(String bookname) {
		this.bookname = bookname;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "[no=" + no + ", bookname=" + bookname + ", author=" + author + ", publisher=" + publisher
				+ ", price=" + price + "]";
	}
	
}
