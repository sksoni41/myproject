package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			String check = req.getParameter("check");

			// System.out.println(name+" "+email+" "+phno+" "+password+" "+check);
			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);
			HttpSession session = req.getSession();
			if (check != null) {

				UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
				boolean f2 = dao.checkUser(email);
				if (f2) {
					boolean f = dao.userRegistre(us);
					if (f) {
						// System.out.println("User registered successfully");
						session.setAttribute("succMsg", "Registeration Success..");
						resp.sendRedirect("Register.jsp");
					} else {
						// System.out.println("something went wroung");
						session.setAttribute("failedMsg", "something went wroung");
						resp.sendRedirect("Register.jsp");
					}
				} else {
					session.setAttribute("failedMsg", "Email id already exist!!! Try another");
					resp.sendRedirect("Register.jsp");
				}
			} else {
				// System.out.println("plese cheak agree terms and condition");
				session.setAttribute("failedMsg", "plese cheak agree terms and condition");
				resp.sendRedirect("Register.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
