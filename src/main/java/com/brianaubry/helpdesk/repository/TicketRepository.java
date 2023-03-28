package com.brianaubry.helpdesk.repository;

import com.brianaubry.helpdesk.model.Stage;
import com.brianaubry.helpdesk.model.Ticket;
import com.brianaubry.helpdesk.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public interface TicketRepository extends JpaRepository<Ticket, Integer> {
    Ticket findById(int id);

    List<Ticket> findByAssignedToId(int id);
    List<Ticket> findByStage(Stage s);
    List<Ticket> findByCreatedBy(User user);
}
