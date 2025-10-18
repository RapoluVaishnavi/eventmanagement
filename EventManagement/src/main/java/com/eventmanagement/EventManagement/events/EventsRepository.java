package com.eventmanagement.EventManagement.events;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.eventmanagement.EventManagement.entities.Events;

@Repository
public interface EventsRepository extends JpaRepository<Events, Long>{

	
	
	
}
