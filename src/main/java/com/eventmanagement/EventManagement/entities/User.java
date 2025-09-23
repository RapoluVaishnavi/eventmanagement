package com.eventmanagement.EventManagement.entities;

import java.io.Serializable;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import lombok.Getter;
import lombok.Setter;

@Entity(name="user")
@Getter @Setter
public class User extends BaseEntity implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Column(name = "full_name")
	private String fullName;
	
	@Column(name = "email_id")
	private String emailId;
	
//	@Column(name = "user_name")
//	private String username;
	
	@Column(name = "password")
	private String password;
	
//	@Column(name = "phone_no")
//	private String phoneNo;
//
//	@Column(name = "passout_year")
//	private Long yearOfPassout;
//	
//	@Column(name = "gender")
//	private String gender;
	
	
	
}
