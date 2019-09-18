package com.pap.bucketclass.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Repository;

import com.pap.bucketclass.entity.Services;
@Repository
public interface ServiceRepository extends JpaRepository<Services, Long> {
	public Services findByServiceId(Long serviceId);
	
	public Page<Services> findByServiceTitleLikeAndServiceCategory_CategorySubjectLikeAndServiceCategory_CategoryTypeLikeAndServiceCategory_CategoryPeriodLikeAndServiceCategory_CategoryScaleLikeAndServiceCategory_CategoryPlaceLike(
			String serviceTitle, 
			String categorySubject,
			String categoryType,
			String categoryPeriod,
			String categoryScale,
			String categoryPlace,
			Pageable pageable);
	
	///Test////
	public Page<Services> findByServiceTitleLikeAndServicePriceLike(String serviceTitle, String servicePrice, Pageable pageable);
	
}
