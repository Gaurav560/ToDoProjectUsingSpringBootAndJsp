package com.ineuron.ai.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ineuron.ai.model.ToDo;
@Repository
public interface ToDoRepo extends JpaRepository<ToDo, Long> {

}
