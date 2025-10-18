package com.eventmanagement.EventManagement.userBooking;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.eventmanagement.EventManagement.events.EventsDTO;

@RestController()
@RequestMapping("eventmanagment/userBooking")
public class UserBookingController {

	@Autowired
	private UserBookingService userBookingService;
	
	
	@PostMapping(value = "/registerEvent", produces = MediaType.APPLICATION_JSON_VALUE)
	public Boolean registerEvent(@RequestBody UserBookingDTO bookingDTO) {
		return userBookingService.registerEvent(bookingDTO);
	}
	
	
	@GetMapping("/getAllRegisteredEvents")
	public List<UserBookingDTO> getAllRegisteredEvents(@RequestParam Long userId)
	{
		return userBookingService.getAllRegisteredEvents(userId);
	
	}
	
	
	
	
	
}
