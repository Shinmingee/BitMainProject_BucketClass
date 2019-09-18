package com.pap.bucketclass.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pap.bucketclass.entity.Member;
import com.pap.bucketclass.model.PasswordModel;
import com.pap.bucketclass.model.ProviderMyPageModel;
import com.pap.bucketclass.model.RequestModel;
import com.pap.bucketclass.model.ResponseModel;
import com.pap.bucketclass.service.LocalMemberDetailsService;
import com.pap.bucketclass.service.ProviderMyPageService;

@Controller
public class ProviderMyPageController {

	@Autowired
	private ProviderMyPageService providerService;

	@Autowired
	private LocalMemberDetailsService memberDetailsService;

	// 메인에서 이용자가 mypage 버튼을 눌렀을 때 들어오는 경로
	@PreAuthorize("hasRole('ROLE_PROVIDER')")
	@GetMapping(value="/provider/mypage")
	public String CustomerMyPage(Principal principal, ModelMap model) {
		if(principal != null) {
			System.out.println(principal.getName());
		}
		Member member = (Member) memberDetailsService.loadUserByUsername(principal.getName());
		model.addAttribute("member", member);
		return "provider-mypage.page";
	}

	//페이지 전환 후, 프로필 정보에 나타낼 멤버 정보 보내기
	@PreAuthorize("hasRole('ROLE_PROVIDER')")
	@PostMapping(
			value="/provider/mypage", 
			produces= {
					MediaType.APPLICATION_JSON_UTF8_VALUE,
					MediaType.APPLICATION_ATOM_XML_VALUE})
	@ResponseBody
	public Member UpdateMypage(@RequestBody RequestModel model, Principal principal) {
		Member member = providerService.loadMember(principal.getName());
		if(member != null) {
			return member;
		}
		return null;
	}

	//제공자가 MyPage에서 정보를 수정할 때 들어오는 경로 & 수정된 데이터 보내기
	@PreAuthorize("hasRole('ROLE_PROVIDER')")
	@RequestMapping(
			method=RequestMethod.POST,
			value="/provider/mypage/update",
			produces= {
					MediaType.APPLICATION_JSON_UTF8_VALUE,
					MediaType.APPLICATION_ATOM_XML_VALUE})
	@ResponseBody
	public Member updateMypage(@ModelAttribute ProviderMyPageModel providerModel, Principal principal) {
		Member member = providerService.updateMember(providerModel, principal.getName());
		if(member != null) {
			return member;
		}
		return null;
	}

	//제공자가 password를 변경할 때 들어오는 경로
	@PreAuthorize("hasRole('ROLE_PROVIDER')")
	@PatchMapping(
			value="/provider/mypage",
			produces= {
					MediaType.APPLICATION_JSON_UTF8_VALUE,
					MediaType.APPLICATION_ATOM_XML_VALUE}
			)
	@ResponseBody
	public ResponseModel changePassword(@RequestBody PasswordModel model, Principal principal) {

		ResponseModel response = new ResponseModel();

		if(providerService.changePassword(model, principal.getName())) {
			response.setRes("success");
			return response;
		}else{
			response.setRes("fail");
			return response;
		}
	}

}
