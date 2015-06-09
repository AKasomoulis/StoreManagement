package gr.uoa.di.storemanagement.web;

import gr.uoa.di.storemanagement.datalayer.entities.user.User;
import gr.uoa.di.storemanagement.datalayer.entities.user.UserForApproval;
import gr.uoa.di.storemanagement.datalayer.entities.user.dao.UserDaoImpl;
import gr.uoa.di.storemanagement.datalayer.entities.user.dao.UserForApprovalDaoImpl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Account_activation extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	private String activationCode;
	private String username;
	
	private UserForApprovalDaoImpl userfaDao;
	private UserDaoImpl userDao;
	private User user;
	private UserForApproval usfa;
	private String roleName;
	
	private String url;
	private ServletContext context;
	private RequestDispatcher dispatcher;	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		userfaDao = new UserForApprovalDaoImpl();
		
		activationCode = request.getParameter("code");
		
		username = userfaDao.getUserWithCode(activationCode);
		
		if (username != null) {
			
			usfa = new UserForApproval();
			
			/* Read not approved user from database*/
			usfa = userfaDao.read(username);
			
			/* Delete from UserForApproval table*/
			userfaDao.delete(usfa);
			
			userDao = new UserDaoImpl();
			
			user = new User();
			
			user.setUsername(usfa.getUsername());
			user.setFirstName(usfa.getFirstName());
			user.setLastName(usfa.getLastName());
			user.setPassword(usfa.getPassword());
			user.setEmail(usfa.getEmail());
			user.setRole(usfa.getRole());
			
			/* Insert it in user table*/
			userDao.create(user);
			url = "/WEB-INF/accountConfirmed.jsp";
		}
		else {
			url = "/error.html";
		}
		
		context = getServletContext();
		dispatcher = context.getRequestDispatcher(url);
		dispatcher.forward(request, response);		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
