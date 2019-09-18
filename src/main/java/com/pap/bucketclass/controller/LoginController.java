package com.pap.bucketclass.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class LoginController {
	
	/*******
	 *로그인*
	 *******/
	@RequestMapping(
			value="/login",
			method=RequestMethod.GET
			)
	public String loginForm()
	{
		return "member-login.tiles";
	}
	
}
