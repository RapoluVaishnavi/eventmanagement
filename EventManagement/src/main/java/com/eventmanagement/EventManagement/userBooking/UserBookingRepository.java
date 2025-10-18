package com.eventmanagement.EventManagement.userBooking;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.eventmanagement.EventManagement.entities.UserBookings;

@Repository
public interface UserBookingRepository extends JpaRepository<UserBookings, Long>{

	
	  @Query(value = """
		        SELECT 
		            e.id as eventId,
		            e.event_name as eventName,
		            e.event_type as eventType,
		            e.description,
		            e.image,
		            CONCAT(e.event_date, ' ', e.event_time) as eventDateTime,
		            e.price
		        FROM 
		            eventmanagement.events e
		        JOIN 
		            eventmanagement.user_bookings ub ON e.id = ub.event_id
		        WHERE 
		            ub.user_id = :userId
		        """, nativeQuery = true)
		    List<Object[]> findEventsByUserId(@Param("userId") Long userId);

}
