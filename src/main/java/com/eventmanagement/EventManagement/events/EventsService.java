package com.eventmanagement.EventManagement.events;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eventmanagement.EventManagement.entities.Events;

@Service
public class EventsService {

	
	@Autowired
	private EventsRepository eventsRepository;
	
	
	public Boolean addEvent(EventsDTO dto) {
		
		Events event = new Events();

		event.setEventName(dto.getEventName());
		event.setEventType(dto.getEventType());
		event.setDescription(dto.getDescription());
		event.setPrice(dto.getPrice());
		event.setSeatsCount(dto.getSeatsCount());
//		event.setImage(dto.getImage());
		event.setEventDateTime(dto.getEventDateTime());
		event.setUnReservedSeatCount(dto.getSeatsCount());

		Events events = eventsRepository.save(event);

		if(events == null) {
			return false;
		}
		else {
			return true;
		}
	}


	public List<EventsDTO> getAllEvents() {
		// TODO Auto-generated method stub
		
		List<EventsDTO> eventsDTOs = new ArrayList<EventsDTO>();
		
		List<Events> eventList = eventsRepository.findAll();
		
		if(eventList.isEmpty()) {
			return eventsDTOs;
		}
		
		for(Events event : eventList) {
			
			EventsDTO eventsDTO = new EventsDTO(event);
			
			eventsDTOs.add(eventsDTO);
			
		}
		
		return eventsDTOs;
	}

	@Transactional
	public Boolean deleteEvent(EventsDTO dto) {
		
		Optional<Events> events = eventsRepository.findById(dto.getId());
		
		if(events.isEmpty()) {
			return false;
		}
		
		eventsRepository.deleteById(dto.getId());
		
		return true;
	}

}
