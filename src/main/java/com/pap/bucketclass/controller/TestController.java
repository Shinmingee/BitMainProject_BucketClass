package com.pap.bucketclass.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pap.bucketclass.entity.Services;
import com.pap.bucketclass.model.RequestModel;
import com.pap.bucketclass.model.ResultItems;
import com.pap.bucketclass.service.ListingService;
import com.pap.bucketclass.service.MemberService;
import com.pap.bucketclass.service.ServiceRegistSerivce;
import com.pap.bucketclass.service.TemplateService;

@Controller
public class TestController {
	/*********************
	 *TEST*
	 *********************/

	@Autowired
	MemberService memberService;

	@Autowired
	TemplateService makeTemplateService;

	@Autowired
	ListingService listingService; 

	@Autowired
	ServiceRegistSerivce serviceRegistSerivce;

	@RequestMapping(
			path="/test/dataFormView",
			method=RequestMethod.POST,
			produces= {
					MediaType.APPLICATION_JSON_UTF8_VALUE,
					MediaType.APPLICATION_ATOM_XML_VALUE
			})
	public @ResponseBody Services dataFormView() {
		return listingService.selectOneService(new Long(4));
	}
	
	@RequestMapping(
			path="/test/jsonfile",
			method= RequestMethod.POST,
			produces= {
					MediaType.APPLICATION_JSON_UTF8_VALUE,
					MediaType.APPLICATION_ATOM_XML_VALUE
			})
	public @ResponseBody Map<String, Object> jsonIO() throws JsonParseException, JsonMappingException, IOException {
		ClassPathResource resource = new ClassPathResource("/data/response.json");
		ObjectMapper mapper = new ObjectMapper();
//		try {
//			Path path = Paths.get(resource.getURI());
//			List<String> content = Files.readAllLines(path);
//			content.forEach(System.out::println);
//			return content;
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		return null;
		String path= "C:\\Users\\RHIE\\eclipse-workspace\\MainProject\\bucketclass\\target\\classes\\data\\test.json";
		Map<String, Object> map = mapper.readValue(
				new File(path),
				new TypeReference<Map<String,Object>>(){});
		return map;
	}

	// 전체 수업 수정을 위한  my-listing-edit 연결테스트==========================================================
		@RequestMapping(
				path="/provider/service-edit",
				method=RequestMethod.POST
		)
		@ResponseBody
		public Map<String, Object> listingData() throws Exception{
			System.out.println("service-edit POST 접속 성공");
			ObjectMapper mapper = new ObjectMapper();
			String path= "C:\\Users\\RHIE\\eclipse-workspace\\MainProject\\bucketclass\\target\\classes\\data\\test.json";
			Map<String, Object> map = mapper.readValue(
					new File(path),
					new TypeReference<Map<String,Object>>(){});
			System.out.println("map 만들기 완료");
			System.out.println(map.toString());
			return map;
		}

		@RequestMapping(
				path="/provider/service-edit",
				method= RequestMethod.GET)
		public String providerEdit() {
			System.out.println("service-edit Get방식 접속성공");
			return "my-listing-edit";
		}


//		  my-listing-edit readOnlypage 연결테스트
	@RequestMapping(
			path="/provider/service-edit-readonly",
			method=RequestMethod.POST
	)
	@ResponseBody
	public Map<String, Object> listingData2() throws Exception{
		System.out.println("service-edit POST 접속 성공");
		ObjectMapper mapper = new ObjectMapper();
		String path= "C:\\Users\\RHIE\\eclipse-workspace\\MainProject\\bucketclass\\target\\classes\\data\\test.json";
		Map<String, Object> map = mapper.readValue(
				new File(path),
				new TypeReference<Map<String,Object>>(){});
		System.out.println("map 만들기 완료");
		System.out.println(map.toString());
		return map;
	}
		@RequestMapping(
				path="/provider/service-edit-readonly",
				method= RequestMethod.GET)
		public String providerEdit2() {
			System.out.println("service-edit Get방식 접속성공");
			return "my-listing-edit-readonly";
		}



//		   dashboard-add-listing readOnlypage 연결테스트
	@RequestMapping(
			path="/provider/service-add-readonly",
			method=RequestMethod.POST
	)
	@ResponseBody
	public Map<String, Object> listingData3() throws Exception{
		System.out.println("service-edit POST 접속 성공");
		ObjectMapper mapper = new ObjectMapper();
		String path= "C:\\Users\\RHIE\\eclipse-workspace\\MainProject\\bucketclass\\target\\classes\\data\\test.json";
		Map<String, Object> map = mapper.readValue(
				new File(path),
				new TypeReference<Map<String,Object>>(){});
		System.out.println("map 만들기 완료");
		System.out.println(map.toString());
		return map;
	}
		@RequestMapping(
				path="/provider/service-add-readonly",
				method= RequestMethod.GET)
		public String providerEdit3() {
			System.out.println("service-edit Get방식 접속성공");
			return "dashboard-add-listing-readonly";
		}
}
