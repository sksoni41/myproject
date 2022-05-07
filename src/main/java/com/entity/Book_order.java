package com.entity;

public class Book_order {
private String orderId;
	private int id;
	private String username;
	private String email;
	private String fulladd;
	private String phno;
	private String book_name;
	private String author;
	private String price;
	private String paymentType;
	public Book_order() {
		super();
		
	}
	
	
	public String getOrderId() {
		return orderId;
	}


	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFulladd() {
		return fulladd;
	}
	public void setFulladd(String fulladd) {
		this.fulladd = fulladd;
	}
	
	public String getPhno() {
		return phno;
	}


	public void setPhno(String phno) {
		this.phno = phno;
	}


	public String getBook_name() {
		return book_name;
	}


	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}


	public String getAuthor() {
		return author;
	}


	public void setAuthor(String author) {
		this.author = author;
	}


	public String getPrice() {
		return price;
	}


	public void setPrice(String price) {
		this.price = price;
	}


	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}


	@Override
	public String toString() {
		return "Book_order [orderId=" + orderId + ", id=" + id + ", username=" + username + ", email=" + email
				+ ", fulladd=" + fulladd + ", phno=" + phno + ", book_name=" + book_name + ", author=" + author
				+ ", price=" + price + ", paymentType=" + paymentType + "]";
	}



	
	
}
