package com.eventmanagement.EventManagement.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController()
@RequestMapping("eventmanagment/user")
public class UserController {
	
	@Autowired
	UserService userService;

	
	@PostMapping(value="/createUser",produces = MediaType.APPLICATION_JSON_VALUE)
	public UserDTO register(@RequestBody UserDTO dto) {
		return userService.createUser(dto);
	}

	@GetMapping(value="/login",produces = MediaType.APPLICATION_JSON_VALUE)
	public String login(@RequestParam String emailId, @RequestParam String password) {
		return userService.login(emailId, password);
	}
	
	
	
}
