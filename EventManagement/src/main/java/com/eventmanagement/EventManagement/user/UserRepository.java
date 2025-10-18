package com.eventmanagement.EventManagement.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.eventmanagement.EventManagement.entities.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long>{

	

	User findByEmailId(String username);
	
	
//	User findByUserName(String userName);

}
