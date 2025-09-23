package com.eventmanagement.EventManagement.events;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController()
@RequestMapping("eventmanagement/events")
public class EventsController {
	
	
	@Autowired
	private EventsService eventsService;
	
	@PostMapping(value="/addEvent",produces = MediaType.APPLICATION_JSON_VALUE)
	public Boolean addEvent(@RequestBody EventsDTO dto) {
		System.err.println(" ad event  :::  "+dto.getEventName());
		return eventsService.addEvent(dto);
	}
	
	
	@GetMapping("/getAllEvents")
	public List<EventsDTO> getAllEvents()
	{
		return eventsService.getAllEvents();
	
	}
	
	
	@DeleteMapping("/delete")
	public Boolean deleteEmployeeRoles(@RequestBody EventsDTO dto)
	{
		return eventsService.deleteEvent(dto);
	}
	

}
