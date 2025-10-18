package com.eventmanagement.EventManagement.entities;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import lombok.Getter;
import lombok.Setter;


@Entity(name="events")
@Getter @Setter
public class Events  extends BaseEntity implements Serializable {
	

	@Column(name = "event_name")
	private String eventName;

	@Column(name = "event_type")
	private String eventType;

	@Column(name = "description")
	private String description;
	
	@Column(name = "price")
	private Double price;

	@Column(name = "seats_count")
	private Long seatsCount;
	
	@Column(name = "unreserved_seats_count")
	private Long unReservedSeatCount;

//	@Column(name = "image")
//	private String image;
	
	@Column(name = "event_date_time")
	private String eventDateTime;
	
//	@Column(name = "event_time")
//	private String eventTime;
	

}
