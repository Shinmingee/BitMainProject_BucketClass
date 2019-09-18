package com.pap.bucketclass.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.pap.bucketclass.entity.Wishlist;
@Repository
public interface WishlistRepository extends JpaRepository<Wishlist, String> {

}
