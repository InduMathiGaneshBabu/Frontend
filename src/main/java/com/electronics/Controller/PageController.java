package com.electronics.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController 
{

	@RequestMapping(value="/login")
	public String showlogin()
	{
		return "Login";
	}
	@RequestMapping(value="/aboutus")
	public String showAbout()
	{
		return "Aboutus";
	}
	@RequestMapping(value="/register")
	public String showRegister()
	{
		return "Register";
	}
	@RequestMapping(value="/signup")
	public String showSignup()
	{
		return "SignUp";
	}
	
}
