package com.brianaubry.helpdesk.repository;


import com.brianaubry.helpdesk.model.Status;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface StatusRepository extends JpaRepository<Status, Integer> {

}
