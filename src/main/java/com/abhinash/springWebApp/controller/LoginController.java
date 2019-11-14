package com.abhinash.springWebApp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	@RequestMapping(value = { "/", "/login", "/index", "/home"})
	public String showLoginPage() {
		return "login/login";
	}

}

