package com.pap.bucketclass.service;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pap.bucketclass.entity.ServiceCategory;
import com.pap.bucketclass.entity.ServiceTemplate;
import com.pap.bucketclass.model.CreateTemplateModel;
import com.pap.bucketclass.repository.MemberRepository;
import com.pap.bucketclass.repository.ServiceCategoryRepository;
import com.pap.bucketclass.repository.ServiceTemplateRepository;

@Service
public class TemplateService{
	
	@Autowired
	private ServiceTemplateRepository serviceTemplateRepo;
	
	@Autowired
	private ServiceCategoryRepository serviceCategoryRepo;
	
	@Autowired
	private MemberRepository memberRepo;
	
	@Transactional
	public ServiceTemplate selectOne(Long serviceTemplateId) {
		return serviceTemplateRepo.findByServiceTemplateId(serviceTemplateId);
	}
	
	@Transactional
	public ServiceTemplate createTemplate(CreateTemplateModel templateModel, Principal principal) {
		ServiceCategory serviceCategory = templateModel.toServiceCategory();
		ServiceTemplate serviceTemplate = templateModel.toServiceTemplate();
		serviceTemplate.setServiceCategory(serviceCategoryRepo.save(serviceCategory));
		serviceTemplate.setServiceIsDelete(false);
		serviceTemplate.setMember(memberRepo.findByMemberId(principal.getName())); //나중에 세션으로부터 정보를 얻어올 USERNAME
		return serviceTemplateRepo.save(serviceTemplate);
	}
	
	@Transactional
	public ServiceTemplate updateTemplate(CreateTemplateModel templateModel, int serviceTemplateId, Principal principal) {
		ServiceTemplate serviceTemplate = selectOne(new Long(serviceTemplateId)); //DB에서 찾은 객체
		ServiceTemplate toUpdate = templateModel.toServiceTemplate(); //수정할 객체
		serviceTemplate.setServiceTitle(toUpdate.getServiceTitle());
		serviceTemplate.setAccountBank(toUpdate.getAccountBank());
		serviceTemplate.setAccountNumber(toUpdate.getAccountNumber());
		serviceTemplate.setHashTag(toUpdate.getHashTag());
//		serviceTemplate.setServiceImgUri(serviceImgUri);
		serviceTemplate.setServiceDescription(toUpdate.getServiceDescription());
		
		
		ServiceCategory serviceCategory = serviceCategoryRepo.findByCategoryId(serviceTemplate.getServiceCategory().getCategoryId());
		serviceCategory.setCategoryPeriod(templateModel.toServiceCategory().getCategoryPeriod());
		serviceCategory.setCategoryPlace(templateModel.toServiceCategory().getCategoryPlace());
		serviceCategory.setCategoryScale(templateModel.toServiceCategory().getCategoryScale());
		serviceCategory.setCategorySubject(templateModel.toServiceCategory().getCategorySubject());
		serviceCategory.setCategoryType(templateModel.toServiceCategory().getCategoryType());
		
		serviceTemplate.setServiceCategory(serviceCategory);
		
		return serviceTemplateRepo.save(serviceTemplate);
		
	}
	
}
