package com.eventmanagement.EventManagement.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eventmanagement.EventManagement.entities.User;

@Service
public class UserService {
	
	@Autowired
	UserRepository userRepository;

	public UserDTO createUser(UserDTO dto) {
		// TODO Auto-generated method stub
		
		User user = new User();
		user.setEmailId(dto.getEmailId());
		user.setFullName(dto.getFullName());
		user.setPassword(dto.getPassword());
//		user.setGender(dto.getGender());
//		user.setPhoneNo(dto.getPhoneNo());
//		user.setYearOfPassout(dto.getYearOfPassout());
		
		User u = userRepository.save(user);
		
		if(u == null)
		{
			return null;
		}
		else {
			return dto;
		}
	}

	public String login(String username, String password) {
		
		User user = userRepository.findByEmailId(username);
		
		if(user ==null) {
			return null;
		}
		
		if(user.getPassword().equals(password)) {
			return "success";
		}
		else {
			return "wrong credentials";
		}
		
	}

}
