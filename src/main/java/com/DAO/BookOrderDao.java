package com.DAO;

import java.util.List;

import com.entity.Book_order;

public interface BookOrderDao {

public boolean saveOrder(List<Book_order> b);
public List<Book_order> getBook(String email);
public List<Book_order> getBook();
}
