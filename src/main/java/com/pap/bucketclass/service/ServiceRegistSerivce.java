package com.pap.bucketclass.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pap.bucketclass.entity.ServiceAddress;
import com.pap.bucketclass.entity.ServiceTemplate;
import com.pap.bucketclass.entity.Services;
import com.pap.bucketclass.model.PostServiceModel;
import com.pap.bucketclass.repository.MemberRepository;
import com.pap.bucketclass.repository.ServiceAddressRepository;
import com.pap.bucketclass.repository.ServiceRepository;
import com.pap.bucketclass.repository.ServiceTemplateRepository;

@Service
public class ServiceRegistSerivce {
	@Autowired
	private ServiceTemplateRepository serviceTemplateRepo;
	
	@Autowired
	private ServiceRepository serviceRepo;
	
	@Autowired
	private ServiceAddressRepository serviceAddressRepo;
	
	@Autowired
	private MemberRepository memberRepo;
		
	@Transactional
	public ServiceTemplate selectOneServiceTemplate(Long serviceTemplateId) {
		return serviceTemplateRepo.findByServiceTemplateId(serviceTemplateId);
	}
	
	@Transactional
	public Services insertServices(PostServiceModel model, Long serviceTemplateId) {
		//There's no relation between services and serviceTemplate, just need data.
		System.out.println(model);
		Services services = new Services();
		services.setNewDataToPostService(model);
		ServiceTemplate serviceTemplate = serviceTemplateRepo.findByServiceTemplateId(serviceTemplateId);
		services.setDateFromTemplate(serviceTemplate); 
		
		ServiceAddress savedServiceAddress = serviceAddressRepo.save(model.toServiceAddress());
		services.setServiceAddress(savedServiceAddress);
		services.setServiceRegisterIsActive(true);
		
		services.setServiceCategory(serviceTemplate.getServiceCategory());
		services.setMemberId(serviceTemplate.getMember().getUsername());
		
		return serviceRepo.save(services);
	}
	
//	@Transactional
//	public Services updateServices() {
//		
//	}
}
