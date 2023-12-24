package com.ineuron.ai.service;

import java.util.List;


import com.ineuron.ai.model.ToDo;

public interface ToDoService {

	public List<ToDo> getToDoAllItems();

	public ToDo getToDoItemById(Long idLong);

	public Boolean updateStatus(Long idLong);

	public Boolean saveOrUpdateToDoItem(ToDo toDo);

	public Boolean deleteToDoItem(Long idLong);

}
