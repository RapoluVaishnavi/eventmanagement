package com.eventmanagement.EventManagement.events;

import com.eventmanagement.EventManagement.entities.Events;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter @NoArgsConstructor
public class EventsDTO {

	private Long id;
    private String eventName;
    private String eventType;
    private String description;
    private Double price;
    private Long seatsCount;
    private String image;
    private String eventDateTime;
    private Long unReservedSeatCount;

    
    
    public EventsDTO(Events dto) {
    	
        this.eventName = dto.getEventName();
        this.eventType = dto.getEventType();
        this.description = dto.getDescription();
        this.price = dto.getPrice();
        this.seatsCount = dto.getSeatsCount();
        this.eventDateTime = dto.getEventDateTime();
        this.unReservedSeatCount = dto.getUnReservedSeatCount();
    }


    
    
    
	
}
