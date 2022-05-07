package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.zip.CheckedOutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookOrderImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.Book_order;
import com.entity.Cart;
@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("username");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String paymentType = req.getParameter("paymentType");
			
			String fullAdd = address+","+landmark+","+city+","+state+","+pincode;
			
//			System.out.println(name+email+phno+fullAdd+paymentType);
			CartDAOImpl dao =new CartDAOImpl(DBConnect.getConn());
			dao.getBookByUser(id);
			List<Cart> blist = dao.getBookByUser(id); 
			if (blist.isEmpty()) {
				session.setAttribute("failedMsg", "Please Choose atleast 1 book!!!");
				resp.sendRedirect("checkout.jsp");
			}else {
				BookOrderImpl dao2 = new BookOrderImpl(DBConnect.getConn());
				
				
				Book_order o =null;
				ArrayList<Book_order> orderList = new ArrayList<Book_order>();
				Random r = new Random();
				for (Cart c : blist) {
					o = new Book_order();
					o.setOrderId("BOOK-ORD-00"+r.nextInt(1000));
					o.setUsername(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFulladd(fullAdd);
					o.setBook_name(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice()+"");
					o.setPaymentType(paymentType);
					orderList.add(o);
				
				}
				if ("noselect".equals(paymentType)) {
					session.setAttribute("failedMsg", "Please Choose Payment Mode!!!");
					resp.sendRedirect("checkout.jsp");
				}else if ("card".equals(paymentType)) {
					resp.sendRedirect("https://www.npci.org.in/what-we-do/upi/product-overview");
				}else {
					boolean f= dao2.saveOrder(orderList);
					if(f) {
						
						resp.sendRedirect("order_success.jsp");
					}
					else {
						session.setAttribute("failedMsg", "Order Not Proceed!!!");
						resp.sendRedirect("checkout.jsp");
					}
				}
			}
			
		} catch (Exception e) {
		e.printStackTrace();
		}
	}

	
	
}
