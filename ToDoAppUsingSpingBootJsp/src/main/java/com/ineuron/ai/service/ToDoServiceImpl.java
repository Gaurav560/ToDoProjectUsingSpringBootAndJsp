package com.ineuron.ai.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ineuron.ai.model.ToDo;
import com.ineuron.ai.repo.ToDoRepo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Service
@NoArgsConstructor
@Data
@AllArgsConstructor
public class ToDoServiceImpl implements ToDoService {

    @Autowired
    private ToDoRepo toDoRepo;

    @Override
    public List<ToDo> getToDoAllItems() {
        List<ToDo> toDoList = new ArrayList<>();
        toDoRepo.findAll().forEach(obj -> {
            toDoList.add(obj);
        });
        return toDoList;
    }

    @Override
    public ToDo getToDoItemById(Long idLong) {
        return toDoRepo.findById(idLong).orElse(null);
    }

    @Override
    public Boolean updateStatus(Long idLong) {
        ToDo toDo = toDoRepo.findById(idLong).orElse(null);
        if (toDo != null) {
            toDo.setStatus("Completed");
            return saveOrUpdateToDoItem(toDo);
        }
        return false;
    }

    @Override
    public Boolean saveOrUpdateToDoItem(ToDo toDo) {
        ToDo updatedObject = toDoRepo.save(toDo);
        return getToDoItemById(updatedObject.getId()) != null;
    }

    @Override
    public Boolean deleteToDoItem(Long idLong) {
        toDoRepo.deleteById(idLong);
        return getToDoItemById(idLong) == null;
    }
}
