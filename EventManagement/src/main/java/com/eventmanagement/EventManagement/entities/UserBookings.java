package com.eventmanagement.EventManagement.entities;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import lombok.Getter;
import lombok.Setter;

@Entity(name="user_bookings")
@Getter @Setter
public class UserBookings extends BaseEntity implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Column(name = "user_id")
	private Long UserId;
	
	@Column(name = "events_id")
	private Long eventsId;
	
	
}
