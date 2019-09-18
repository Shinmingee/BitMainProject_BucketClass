package com.pap.bucketclass.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.pap.bucketclass.entity.Member;
import com.pap.bucketclass.repository.MemberRepository;

@EnableTransactionManagement(proxyTargetClass = true)
@Service
public class LocalMemberDetailsService implements UserDetailsService {

    @Autowired
    private MemberRepository memberRepo;

    @Override
    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String memberId) throws UsernameNotFoundException {
        Member user = memberRepo.findByMemberId(memberId);
        if (user == null) {
            throw new UsernameNotFoundException(memberId);
        }
        return user;
    }
}
