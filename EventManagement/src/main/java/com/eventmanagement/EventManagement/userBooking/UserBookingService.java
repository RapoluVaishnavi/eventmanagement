package com.eventmanagement.EventManagement.userBooking;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eventmanagement.EventManagement.entities.Events;
import com.eventmanagement.EventManagement.entities.UserBookings;
import com.eventmanagement.EventManagement.events.EventsRepository;

@Service
public class UserBookingService {
	
	@Autowired
	private EventsRepository eventsRepository;
	
	@Autowired
	private UserBookingRepository userBookingRepository;

	public Boolean registerEvent(UserBookingDTO bookingDTO) {

		UserBookings bookings = new UserBookings();
		
		bookings.setEventsId(bookingDTO.getEventsId());
		bookings.setUserId(bookingDTO.getUserId());
		
		Optional<Events> e = eventsRepository.findById(bookingDTO.getEventsId());
		
		if(e.isEmpty()) {
			return false;
		}
		
		e.get().setUnReservedSeatCount(e.get().getUnReservedSeatCount() - 1);
		
		eventsRepository.save(e.get());
		userBookingRepository.save(bookings);
		
		return null;
	}

	public List<UserBookingDTO> getAllRegisteredEvents(Long userId) {
			
		List<Object[]> results = userBookingRepository.findEventsByUserId(userId);
	    List<UserBookingDTO> dtoList = new ArrayList<>();

	    for (Object[] row : results) {
	    	UserBookingDTO dto = new UserBookingDTO();
	        dto.setEventsId(((Number) row[0]).longValue());
	        dto.setEventName((String) row[1]);
	        dto.setEventType((String) row[2]);
	        dto.setDescription((String) row[3]);
	        dto.setImage((String) row[4]);
	        dto.setEventDateTime((String) row[5]);
	        dto.setPrice(row[6] != null ? ((Number) row[6]).doubleValue() : 0);

	        dtoList.add(dto);
	    }

	    return dtoList;
	}

}
