package com.pap.bucketclass.service;

import static com.pap.bucketclass.util.RoleFilter.containRoleByName;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.pap.bucketclass.entity.Member;
import com.pap.bucketclass.model.PasswordModel;
import com.pap.bucketclass.model.ProviderMyPageModel;
import com.pap.bucketclass.repository.MemberRepository;

@Service
public class ProviderMyPageService {
	
	@Autowired
	private LocalMemberDetailsService memberDetailsService;
	@Autowired
	private MemberRepository memberRepo;
	
	@Transactional
	public Member loadMember(String memberId) {
		Member member = (Member) memberDetailsService.loadUserByUsername(memberId);
		Member found = null;
		if(containRoleByName(member.getRoles(), "ROLE_PROVIDER")) {
			found = memberRepo.findByMemberId(memberId);
		}else {
			throw new AccessDeniedException("403 error");
		}
		return found;
	}
	
	@Transactional
	public String imageUpload(MultipartFile file, String memberId) {
		Member member = memberRepo.findByMemberId(memberId);
		String fileName = StringUtils.cleanPath(file.getOriginalFilename());
		if(member != null) {
			member.setMemberImg(fileName);
			memberRepo.save(member);
		}else {
			throw new AccessDeniedException("403 error");
		}
		return fileName;
	}
	
	@Transactional
	public Member updateMember(ProviderMyPageModel providerModel, String memberId) {
		Member member = memberRepo.findByMemberId(memberId);
		String fileName = StringUtils.cleanPath(providerModel.getMemberImg().getOriginalFilename());
		if (member != null) {
			member.setMemberNickname(providerModel.getMemberNickname());
			member.setMemberEmail(providerModel.getMemberEmail());
			member.setIntroduce(providerModel.getIntroduce());
			member.setMemberImg(fileName);
			member.setCareer(providerModel.getCareer());
			member.setCerti(providerModel.getCerti());
		} else {
			throw new AccessDeniedException("403 error");
		}
		return memberRepo.save(member);
	}
	
	@Transactional
	public Boolean changePassword(PasswordModel model, String memberId) {
		Member member = memberRepo.findByMemberId(memberId);
		if(member != null && 
				member.getPassword().equals(model.getMemberPassword()) &&
				!(model.getMemberPassword().equals(model.getNewPassword()))) {
			member.setMemberPassword(model.getNewPassword());
			memberRepo.save(member);
			return true;
		}else {
			return false;
		}
	}
}
