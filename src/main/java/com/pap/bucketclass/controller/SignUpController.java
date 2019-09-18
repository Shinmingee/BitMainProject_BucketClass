package com.pap.bucketclass.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pap.bucketclass.entity.Member;
import com.pap.bucketclass.model.RequestModel;
import com.pap.bucketclass.model.ResponseModel;
import com.pap.bucketclass.model.SignUpModel;
import com.pap.bucketclass.service.SignUpService;

@Controller
public class SignUpController {

	@Autowired
	private SignUpService signUpService;
	
	private ResponseModel response = new ResponseModel();
	
	@GetMapping("/signup")
	public String signUpForm() {
		return "member-register.tiles";
	}

	@RequestMapping(path="/signup", method=RequestMethod.POST,
			produces= {
					MediaType.APPLICATION_JSON_UTF8_VALUE,
					MediaType.APPLICATION_ATOM_XML_VALUE})
	@ResponseBody
	public ResponseModel create(@RequestBody SignUpModel model) {
		try {
			Member member = signUpService.insertMember(model);
			response.setRes("success");
			return response;
		}catch(Exception e) {
			response.setRes("fail");
			return response;
		}
	}
	
	@RequestMapping(
			value = "/signup/check-id/{id}",
			method = RequestMethod.GET
			)
	public @ResponseBody ResponseEntity checkId(@PathVariable("id")String memberId) {
		if(signUpService.checkId(memberId)) {
		return new ResponseEntity<Boolean>(true, null, HttpStatus.OK);
		} else {
			return new ResponseEntity<Boolean>(false, null, HttpStatus.OK);
		}
	}
	
	@RequestMapping(
			value = "/signup/check-email", 
			method=RequestMethod.POST
			)
	public @ResponseBody ResponseEntity checkEmail(@RequestBody RequestModel model) {
		if(signUpService.checkEmail(model.getReq())) {
			return new ResponseEntity<Boolean>(true, null, HttpStatus.OK);
		} else {
			return new ResponseEntity<Boolean>(false, null, HttpStatus.OK);
		}
	}
	
	@RequestMapping(
			path = "signup/check-nickname/{nickname}",
			method = RequestMethod.GET
			)
	public @ResponseBody ResponseEntity checkNickname(@PathVariable("nickname") String memberNickname) {
		if(signUpService.checkNickname(memberNickname)) {
			return new ResponseEntity<Boolean>(true, null, HttpStatus.OK);
		} else {
			return new ResponseEntity<Boolean>(false, null, HttpStatus.OK);
		}
	}
	
}
