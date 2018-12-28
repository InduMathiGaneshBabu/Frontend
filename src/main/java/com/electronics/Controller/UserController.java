package com.electronics.Controller;


import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.electronics.Dao.UserDetailDao;
import com.electronics.model.UserDetail;

@Controller
public class UserController
{
	@Autowired
	UserDetailDao userDao;

	
	
	@RequestMapping(value="/login_success")
	public String loginSuccess(HttpSession session,Model m)
	{
		String page="";
		boolean loggedIn=false;
		SecurityContext sContext=SecurityContextHolder.getContext();
		Authentication authentication=sContext.getAuthentication();
		
		String username=authentication.getName();
		Collection<? extends GrantedAuthority> roles=authentication.getAuthorities();
		for(GrantedAuthority role:roles)
		{
			session.setAttribute("role",role.getAuthority());
			
			
			if(role.getAuthority().equals("Role_Admin"))
			{
				loggedIn=true;
				page="AdminHome";
				session.setAttribute("loggedIn",loggedIn);
				session.setAttribute("username", username);
			}
			else
			{
				loggedIn=true;
				page="UserHome";
			
			}
				
		}
		
		return page;
	}
	
	
	
	@RequestMapping( value="/addNewUsers", method=RequestMethod.POST)
	public String AddUsers(@RequestParam("username")String username,@RequestParam("password")String password,@RequestParam("customername")String customername,@RequestParam("emailid")String emailid,@RequestParam("mobileno")String mobileno,@RequestParam("address")String address,@RequestParam("role")String role)
	{
		UserDetail userdetail=new UserDetail();
		userdetail.setUsername(username);
		userdetail.setPassword(password);
		userdetail.setCustomername(customername);
		userdetail.setEmailid(emailid);
		userdetail.setMobileno(mobileno);
		userdetail.setAddress(address);
		userdetail.setRole(role);
		userDao.registerUser(userdetail);
		return "Login";
	}
	
	
	
	
}
