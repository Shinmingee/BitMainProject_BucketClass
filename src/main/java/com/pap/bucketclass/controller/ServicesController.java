package com.pap.bucketclass.controller;

import java.security.Principal;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pap.bucketclass.entity.ServiceTemplate;
import com.pap.bucketclass.entity.Services;
import com.pap.bucketclass.model.CreateTemplateModel;
import com.pap.bucketclass.model.PostServiceModel;
import com.pap.bucketclass.model.QueryServiceModel;
import com.pap.bucketclass.model.RequestModel;
import com.pap.bucketclass.model.ResponseModel;
import com.pap.bucketclass.model.ResultItems;
import com.pap.bucketclass.model.SingleServiceModel;
import com.pap.bucketclass.service.ListingService;
import com.pap.bucketclass.service.MemberService;
import com.pap.bucketclass.service.ServiceRegistSerivce;
import com.pap.bucketclass.service.TemplateService;

@Controller
public class ServicesController {

	@Autowired
	MemberService memberService;

	@Autowired
	TemplateService templateService;

	@Autowired
	ListingService listingService; 

	@Autowired
	ServiceRegistSerivce serviceRegistService;

	/****************************
	 * public 기본 실제 서비스 검색 *
	 *****************************/
	/***리스팅 뷰어 GET***/
	@RequestMapping(
			path="/service-listing",
			method= RequestMethod.GET)
	public String formServiceList() {
		return "listings-list-full-width.tiles";
	}

	/***리스팅 뷰어 POST***/
	@RequestMapping(
			path="/service-listing",
			method= RequestMethod.POST,
			produces= {
					MediaType.APPLICATION_JSON_UTF8_VALUE,
					MediaType.APPLICATION_ATOM_XML_VALUE
			})
	public @ResponseBody ResultItems<Services> getAllService(
			@RequestBody(required=false)  QueryServiceModel queryModel,
			@RequestParam(
					name="serviceTitle",
					required=false) String serviceTitle,
			@RequestParam(
					name="categorySubject",
					required=false) String categorySubject) {
		int size = 5, page = 1; //default
		//정렬 : (기본) 최근 등록순

		if(Optional.ofNullable(serviceTitle).isPresent()){
			System.out.println("param serviceTitle exists");
			queryModel.setServiceTitle(serviceTitle);
		}
		if(Optional.ofNullable(categorySubject).isPresent()) {
			queryModel.setCategorySubject(categorySubject);
		}

		String defaultSort ="serviceModifiedDate";
		Pageable pageable = PageRequest.of(page - 1, size, Sort.by(defaultSort).descending());
		Page<Services> serviceList = listingService.searchingListAndPageable(queryModel, pageable);
		return new ResultItems<Services>(serviceList.stream().collect(Collectors.toList()), page, size, serviceList.getTotalElements());
	}

	/***리스팅 뷰어 POST - PAGE***/
	@RequestMapping(
			path="/service-listing/{page}",
			method= RequestMethod.POST, 
			produces= {
					MediaType.APPLICATION_JSON_UTF8_VALUE,
					MediaType.APPLICATION_ATOM_XML_VALUE
			})
	public @ResponseBody ResultItems<Services> changePage(
			@PathVariable(
					name="page",
					required=false) String pageStr,
			@RequestBody(required=false) QueryServiceModel queryModel,
			@RequestParam(
					name="serviceTitle",
					required=false) String serviceTitle,
			@RequestParam(
					name="categorySubject",
					required=false) String categorySubject) {
		int size = 5; int page = 1;
		if(pageStr != null) {
			page = Integer.parseInt(pageStr);
		}
		System.out.println("$$$$ page : " + page);
		System.out.println("$$$$ serviceTitle : " + serviceTitle);
		System.out.println("$$$$ categorySubject : " + categorySubject);
		System.out.println("$$$$ queryModel : " + queryModel);
		System.out.println();
		queryModel = Optional.ofNullable(queryModel).orElse(new QueryServiceModel());
		if(Optional.ofNullable(serviceTitle).isPresent()){
			System.out.println("param serviceTitle exists");
			queryModel.setServiceTitle(serviceTitle);
		}
		if(Optional.ofNullable(categorySubject).isPresent()) {
			queryModel.setCategorySubject(categorySubject);
		}

		Pageable pageable = null;
		if(!Optional.ofNullable(queryModel).isPresent()) {
			queryModel.setOrderBy("serviceModifiedDate");
			pageable = PageRequest.of(page - 1, size, Sort.by("serviceModifiedDate").descending());
		}
		String sortByName = queryModel.getOrderBy();

		switch(sortByName) {
		case "최근 등록순":
			queryModel.setOrderBy("serviceModifiedDate");
			pageable = PageRequest.of(page - 1, size, Sort.by("serviceModifiedDate").descending());
			break;
		case "높은 가격순":
			queryModel.setOrderBy("servicePrice");
			pageable = PageRequest.of(page - 1, size, Sort.by("servicePrice").descending());
			break;
		case "낮은 가격순":
			queryModel.setOrderBy("servicePrice");
			pageable = PageRequest.of(page - 1, size, Sort.by("servicePrice").ascending());
			break;
		}
		System.out.println("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");
		System.out.println(pageable.getSort());
		System.out.println("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");
		Page<Services> serviceList = listingService.searchingListAndPageable(queryModel, pageable);
		return new ResultItems<Services>(serviceList.stream().collect(Collectors.toList()), page, size, serviceList.getTotalElements());
	}

	/*************************
	 * public 싱글 서비스 페이지 *
	 **************************/
	/***싱글 뷰어 GET + PATH(serviceId)***/
	@RequestMapping(
			path="/service-listing/{serviceId}/view",
			method= RequestMethod.GET)
	public String singeServicePageForm(
			@PathVariable(
					name="serviceId",
					required=false) String serviceId){
		System.out.println("1234124123412341234");
		return "listings-single-page.tiles";
	}

	/***싱글 뷰어 POST + PATH(serviceId)***/
	@RequestMapping(
			path="/service-listing/{serviceId}/view",
			method= RequestMethod.POST,
			produces= {
					MediaType.APPLICATION_JSON_UTF8_VALUE,
					MediaType.APPLICATION_ATOM_XML_VALUE
			})
	public @ResponseBody SingleServiceModel sendDataToSingleService(
			@RequestBody RequestModel requestModel,
			@PathVariable(
					name="serviceId",
					required=false) int serviceId){
		System.out.println("post 들어옴");
		System.out.println(listingService.sendToSinglePage(serviceId));
		return listingService.sendToSinglePage(serviceId);
	}

	/**********************************************
	 * [PROVIDER] pending + active page + expired *
	 ***********************************************/
	/////////////////////////////////////
	/***pending page  GET***/
	@RequestMapping(
			path="/provider/pending-listing",
			method= RequestMethod.GET)
	public String providerServiceListFormPending() {
		return "pending-listing.page";
	}

	/***pending page POST***/
	@RequestMapping(
			path="/provider/pending-listing",
			method= RequestMethod.POST,
			produces= {
					MediaType.APPLICATION_JSON_UTF8_VALUE,
					MediaType.APPLICATION_ATOM_XML_VALUE
			})
	public @ResponseBody ResultItems<ServiceTemplate> providerPageableInitServicePending(@RequestBody RequestModel requestModel){
		int size = 5, page = 1; //default
		//정렬 : (기본) 최근 등록순
		
		String defaultSort ="serviceModifiedDate";
		Pageable pageable = PageRequest.of(page - 1, size, Sort.by(defaultSort).descending());
		Page<ServiceTemplate> serviceList = listingService.templateSearchingListAndPageable(pageable);
		return new ResultItems<ServiceTemplate>(serviceList.stream().collect(Collectors.toList()), page, size, serviceList.getTotalElements());
	}

	/***pending page  POST+PATH(page)***/
	@RequestMapping(
			path="/provider/pending-listing/{page}",
			method= RequestMethod.POST,
			produces= {
					MediaType.APPLICATION_JSON_UTF8_VALUE,
					MediaType.APPLICATION_ATOM_XML_VALUE
			})
	public @ResponseBody ResultItems<ServiceTemplate> providerPageableServicePending(
			@RequestBody RequestModel requestModel,
			@PathVariable("page") int page
			){
		int size = 5;

		String defaultSort ="serviceModifiedDate";
		Pageable pageable = PageRequest.of(page - 1, size, Sort.by(defaultSort).descending());
		Page<ServiceTemplate> serviceList = listingService.templateSearchingListAndPageable(pageable);
		return new ResultItems<ServiceTemplate>(serviceList.stream().collect(Collectors.toList()), page, size, serviceList.getTotalElements());
	}
	/////////////////////////////////////
	/***active page  GET***/
	@RequestMapping(
			path="/provider/active-listing",
			method= RequestMethod.GET)
	public String providerServiceListFormActive() {
		return "active-listing.page";
	}

	/***active page POST***/
	@RequestMapping(
			path="/provider/active-listing",
			method= RequestMethod.POST,
			produces= {
					MediaType.APPLICATION_JSON_UTF8_VALUE,
					MediaType.APPLICATION_ATOM_XML_VALUE
			})
	public @ResponseBody ResultItems<Services> providerPageableInitServiceActive(@RequestBody RequestModel requestModel){
		int size = 5, page = 1; //default
		//정렬 : (기본) 최근 등록순

		String defaultSort ="serviceModifiedDate";
		Pageable pageable = PageRequest.of(page - 1, size, Sort.by(defaultSort).descending());
		Page<Services> serviceList = listingService.searchingListAndPageable(new QueryServiceModel(), pageable);
		return new ResultItems<Services>(serviceList.stream().collect(Collectors.toList()), page, size, serviceList.getTotalElements());
	}

	/***active page  POST+PATH(page)***/
	@RequestMapping(
			path="/provider/active-listing/{page}",
			method= RequestMethod.POST,
			produces= {
					MediaType.APPLICATION_JSON_UTF8_VALUE,
					MediaType.APPLICATION_ATOM_XML_VALUE
			})
	public @ResponseBody ResultItems<Services> providerPageableServiceActive(
			@RequestBody RequestModel requestModel,
			@PathVariable("page") int page
			){
		int size = 5;

		String defaultSort ="serviceModifiedDate";
		Pageable pageable = PageRequest.of(page - 1, size, Sort.by(defaultSort).descending());
		Page<Services> serviceList = listingService.searchingListAndPageable(new QueryServiceModel(), pageable);
		return new ResultItems<Services>(serviceList.stream().collect(Collectors.toList()), page, size, serviceList.getTotalElements());
	}

	//////////////////////////////////////////
	/***expired page  GET***/
	@RequestMapping(
			path="/provider/expired-listing",
			method= RequestMethod.GET)
	public String providerServiceListFormExpired() {
		return "expired-listing.page";
	}

	/***expired page POST***/
	@RequestMapping(
			path="/provider/expired-listing",
			method= RequestMethod.POST,
			produces= {
					MediaType.APPLICATION_JSON_UTF8_VALUE,
					MediaType.APPLICATION_ATOM_XML_VALUE
			})
	public @ResponseBody ResultItems<Services> providerPageableInitServiceExpired(@RequestBody RequestModel requestModel){
		int size = 5, page = 1; //default
		//정렬 : (기본) 최근 등록순

		String defaultSort ="serviceModifiedDate";
		Pageable pageable = PageRequest.of(page - 1, size, Sort.by(defaultSort).descending());
		Page<Services> serviceList = listingService.searchingListAndPageable(new QueryServiceModel(), pageable);
		return new ResultItems<Services>(serviceList.stream().collect(Collectors.toList()), page, size, serviceList.getTotalElements());
	}

	/***expired page  POST+PATH(page)***/
	@RequestMapping(
			path="/provider/expired-listing/{page}",
			method= RequestMethod.POST,
			produces= {
					MediaType.APPLICATION_JSON_UTF8_VALUE,
					MediaType.APPLICATION_ATOM_XML_VALUE
			})
	public @ResponseBody ResultItems<Services> providerPageableServiceExpired(
			@RequestBody RequestModel requestModel,
			@PathVariable("page") int page
			){
		int size = 5;

		String defaultSort ="serviceModifiedDate";
		Pageable pageable = PageRequest.of(page - 1, size, Sort.by(defaultSort).descending());
		Page<Services> serviceList = listingService.searchingListAndPageable(new QueryServiceModel(), pageable);
		return new ResultItems<Services>(serviceList.stream().collect(Collectors.toList()), page, size, serviceList.getTotalElements());
	}


	/********************************
	 *  [PROVIDER] 서비스 템플릿  등록 *
	 *********************************/
	@RequestMapping(
			path="/provider/add-service",
			method= RequestMethod.GET)
	public String templateForm() {
		return "dashboard-add-listing.page";
	}

	@RequestMapping(
			path="/provider/add-service",
			method= RequestMethod.POST,
			produces= {
					MediaType.APPLICATION_JSON_UTF8_VALUE,
					MediaType.APPLICATION_ATOM_XML_VALUE	
			})
	public @ResponseBody ResponseModel createTemplate(@RequestBody CreateTemplateModel model, Principal principal) {
		ServiceTemplate getService = templateService.createTemplate(model, principal);
		ResponseModel resModel = new ResponseModel();
		if (getService != null) {resModel.setRes("success");}else{resModel.setRes("fail");}
		return resModel;
	}

	/******************************
	 *  [PROVIDER] 서비스 실제 등록 *
	 *******************************/
	@RequestMapping(
			path="/provider/my-template/{serviceTemplateId}/regist",
			method= RequestMethod.GET)
	public String createServiceForm(@PathVariable("serviceTemplateId") Long serviceTemplateId) {
		return "dashboard-registration-listings.page";
	}

	@RequestMapping(
			path="/provider/my-template/{serviceTemplateId}/regist",
			method= RequestMethod.POST,
			produces= {
					MediaType.APPLICATION_JSON_UTF8_VALUE,
					MediaType.APPLICATION_ATOM_XML_VALUE
			})
	public @ResponseBody ResponseModel createService(
			@RequestBody PostServiceModel model,
			@PathVariable("serviceTemplateId") Long serviceTemplateId) {
		ResponseModel resModel = new ResponseModel();
		Services service =  serviceRegistService.insertServices(model, serviceTemplateId);
		System.out.println(service);
		if(service !=null) {
			resModel.setRes("success");
		}else {
			resModel.setRes("fail");
		}
		System.out.println(resModel.getRes());
		return resModel;
	}

	/**************************************************
	 * [PROVIDER] 실제 서비스 UPDATE, READ, DELETE*
	 ***************************************************/

	/*** READ ONLY ***/
	@RequestMapping(
			path= "/provider/my-listing/{serviceId}/read",
			method= RequestMethod.GET)
	public String serviceViewForm(@PathVariable("serviceId") int serviceId) {
		return "my-listing-edit-readonly.page";
	}

	@RequestMapping(
			path= "/provider/my-listing/{serviceId}/read",
			method= RequestMethod.POST,
			produces= {
					MediaType.APPLICATION_JSON_UTF8_VALUE,
					MediaType.APPLICATION_ATOM_XML_VALUE	
			})
	public @ResponseBody Services viewExistRegistService(@PathVariable("serviceId") int serviceId) {
		return listingService.selectOneService(new Long(serviceId));
	}

	/*** UPDATE ***/
	@RequestMapping(
			path= "/provider/my-listing/{serviceId}/update",
			method= RequestMethod.GET)
	public String serviceUpdateForm(@PathVariable("serviceId") int serviceId) {
		return "my-listing-edit.page";
	}

	@RequestMapping(
			path= "/provider/my-listing/{serviceId}/update",
			method= RequestMethod.POST,
			produces= {
					MediaType.APPLICATION_JSON_UTF8_VALUE,
					MediaType.APPLICATION_ATOM_XML_VALUE	
			})
	public @ResponseBody Services viewExistRegistServiceForUpdate(@PathVariable("serviceId") int serviceId) {
		return listingService.selectOneService(new Long(serviceId));
	}

	@RequestMapping(
			path= "/provider/my-listing/{serviceId}/update",
			method= RequestMethod.PUT,
			produces= {
					MediaType.APPLICATION_JSON_UTF8_VALUE,
					MediaType.APPLICATION_ATOM_XML_VALUE	
			})
	public @ResponseBody ResponseModel updateExistRegistService(
			@RequestBody PostServiceModel model,
			@PathVariable("serviceId") int serviceId) {
		ResponseModel resModel = new ResponseModel();
		//		Services service =  serviceRegistService.updateServices(model, serviceId);
		//		System.out.println(service);
		//		if(service !=null) {
		//			resModel.setRes("success");
		//		}else {
		//			resModel.setRes("fail");
		//		}
		System.out.println(resModel.getRes());
		return resModel;
	}

	/**********************************************
	 * [PROVIDER] 템플릿  UPDATE, READ, DELETE*
	 ***********************************************/

	/*** READ ONLY ***/
	@RequestMapping(
			path= "/provider/my-template/{serviceTemplateId}/read",
			method= RequestMethod.GET)
	public String templateViewForm(@PathVariable("serviceTemplateId") int serviceTemplateId) {
		return "dashboard-add-listing-readonly.page";
	}

	@RequestMapping(
			path= "/provider/my-template/{serviceTemplateId}/read",
			method= RequestMethod.POST,
			produces= {
					MediaType.APPLICATION_JSON_UTF8_VALUE,
					MediaType.APPLICATION_ATOM_XML_VALUE	
			})
	public @ResponseBody ServiceTemplate viewExistTemplate(@PathVariable("serviceTemplateId") int serviceTemplateId) {
		return templateService.selectOne(new Long(serviceTemplateId));
	}

	/*** UPDATE ***/
	@RequestMapping(
			path= "/provider/my-template/{serviceTemplateId}/update",
			method= RequestMethod.GET)
	public String templateUpdateForm(@PathVariable("serviceTemplateId") int serviceTemplateId) {
		return "dashboard-add-listing-edit.page";
	}

	@RequestMapping(
			path= "/provider/my-template/{serviceTemplateId}/update",
			method= RequestMethod.POST,
			produces= {
					MediaType.APPLICATION_JSON_UTF8_VALUE,
					MediaType.APPLICATION_ATOM_XML_VALUE	
			})
	public @ResponseBody ServiceTemplate showExistTemplateForUpdate(@PathVariable("serviceTemplateId") int serviceTemplateId) {
		return templateService.selectOne(new Long(serviceTemplateId));
	}

	@RequestMapping(
			path= "/provider/my-template/{serviceTemplateId}/update",
			method= RequestMethod.PUT,
			produces= {
					MediaType.APPLICATION_JSON_UTF8_VALUE,
					MediaType.APPLICATION_ATOM_XML_VALUE	
			})
	public @ResponseBody ResponseModel updateExistTemplate(
			@PathVariable("serviceTemplateId") int serviceTemplateId,
			@RequestBody CreateTemplateModel model, 
			Principal principal
			) {
		ServiceTemplate getService = templateService.updateTemplate(model,  serviceTemplateId, principal);
		ResponseModel resModel = new ResponseModel();
		if (getService != null) {resModel.setRes("success");}else{resModel.setRes("fail");}
		return resModel;
	}
}
