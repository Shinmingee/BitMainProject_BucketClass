package com.pap.bucketclass.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pap.bucketclass.entity.Member;
import com.pap.bucketclass.entity.ServiceAddress;
import com.pap.bucketclass.entity.ServiceCategory;
import com.pap.bucketclass.entity.ServiceTemplate;
import com.pap.bucketclass.entity.Services;
import com.pap.bucketclass.model.QueryServiceModel;
import com.pap.bucketclass.model.SingleServiceModel;
import com.pap.bucketclass.repository.MemberRepository;
import com.pap.bucketclass.repository.ServiceAddressRepository;
import com.pap.bucketclass.repository.ServiceCategoryRepository;
import com.pap.bucketclass.repository.ServiceRepository;
import com.pap.bucketclass.repository.ServiceTemplateRepository;

@Service
public class ListingService {
	
	@Autowired
	MemberRepository memberRepo;
	
	@Autowired
	ServiceAddressRepository serviceAddressRepo;
	
	@Autowired
	ServiceCategoryRepository serviceCategoryRepo;
	
	@Autowired
	ServiceRepository serviceRepo;
	
	@Autowired
	ServiceTemplateRepository serviceTemplateRepo;
	
    @Transactional(readOnly = true)
    public Page<Services> listPageable(Pageable pageable) {
        return serviceRepo.findAll(pageable);
    }
	
    @Transactional(readOnly = true)
    public List<Services> listOfService() {
        return serviceRepo.findAll();
    }
    
    @Transactional(readOnly = true)
    public Services selectOneService(Long serviceId) {
        return serviceRepo.findByServiceId(serviceId);
    }
    
    @Transactional
    public SingleServiceModel  sendToSinglePage(int serviceId) {
    	Services services = serviceRepo.findByServiceId(new Long(serviceId));
    	ServiceCategory serviceCategory = services.getServiceCategory();
    	ServiceAddress serviceAddress = services.getServiceAddress();
    	Member member = memberRepo.findByMemberId(services.getMemberId()); 
    	SingleServiceModel singleServiceModel = new SingleServiceModel();
    	singleServiceModel.settingDataForSendToSinglePage(services, serviceCategory, member, serviceAddress);
    	return singleServiceModel;
    }
    
    @Transactional
    public Page<ServiceTemplate> templateSearchingListAndPageable(Pageable pageable){
    	return serviceTemplateRepo.findAll(pageable);
    }
    
    @Transactional(readOnly=true)
    public Page<Services> searchingListAndPageable(QueryServiceModel queryServiceModel,Pageable pageable){
    	String serviceTitle = queryServiceModel.getServiceTitle();
    	String categorySubject =queryServiceModel.getCategorySubject();
    	String categoryType =  queryServiceModel.getCategoryType();
    	String categoryPeriod =  queryServiceModel.getCategoryPeriod();
    	String categoryScale = queryServiceModel.getCategoryScale();
    	String categoryPlace = queryServiceModel.getCategoryPlace();
    	
    	serviceTitle = Optional.ofNullable(serviceTitle).orElse("");
    	categorySubject =Optional.ofNullable(categorySubject).orElse("");
    	categoryType = Optional.ofNullable(categoryType).orElse(""); 
    	categoryPeriod = Optional.ofNullable(categoryPeriod).orElse(""); 
    	categoryScale = Optional.ofNullable(categoryScale).orElse("");
    	categoryPlace = Optional.ofNullable(categoryPlace).orElse("");
    	
    	
    	serviceTitle = "%" + serviceTitle +"%" ;
    	categorySubject = "%" + categorySubject +"%" ;
    	categoryType = "%" + categoryType +"%" ;
    	categoryPeriod = "%" + categoryPeriod +"%" ;
    	categoryScale = "%" + categoryScale +"%" ;
    	categoryPlace = "%" + categoryPlace +"%" ;
    	
    	System.out.println("=======================");
    	System.out.println(serviceTitle);
    	System.out.println(categorySubject);
    	System.out.println(categoryType);
    	System.out.println(categoryPeriod);
    	System.out.println(categoryScale);
    	System.out.println(categoryPlace);
    	System.out.println("=======================");
    	return serviceRepo.findByServiceTitleLikeAndServiceCategory_CategorySubjectLikeAndServiceCategory_CategoryTypeLikeAndServiceCategory_CategoryPeriodLikeAndServiceCategory_CategoryScaleLikeAndServiceCategory_CategoryPlaceLike(
    			serviceTitle, categorySubject, categoryType, categoryPeriod,categoryScale,  categoryPlace, pageable);
    }
    
    
    ///Test///
    @Transactional(readOnly=true)
    public Page<Services> searchingListAndPageableTest(String serviceTitle, String servicePrice, Pageable pageable){	
    	serviceTitle = Optional.ofNullable(serviceTitle).orElse("");
    	System.out.println(serviceTitle instanceof String);
    	System.out.println(serviceTitle);
    	servicePrice = Optional.ofNullable(servicePrice).orElse("0");
    	System.out.println(servicePrice);
    	serviceTitle = "%" + serviceTitle;
    	serviceTitle = serviceTitle + "%";
    	System.out.println("=======================");
    	System.out.println(serviceTitle);
    	System.out.println(servicePrice);
    	System.out.println("=======================");
    	return serviceRepo.findByServiceTitleLikeAndServicePriceLike(serviceTitle, servicePrice, pageable);
    }
    
}
