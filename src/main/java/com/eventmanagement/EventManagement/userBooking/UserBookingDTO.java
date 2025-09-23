package com.eventmanagement.EventManagement.userBooking;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter @NoArgsConstructor
public class UserBookingDTO {

	
	private Long userId;
    private Long eventsId;
    private String eventName;
    private String eventType;
    private String description;
    private String image;
    private String eventDateTime;
    private Double price;
    
    
}
