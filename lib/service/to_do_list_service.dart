import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:test_project/model/to_do_model.dart';

class ToDoListService {
  static final List<ToDoModel> _toDoList = [];

  static List<ToDoModel> getToDoList() {
    return _toDoList;
  }

  static saveToDo(ToDoModel toDo) {
    _toDoList.add(toDo);
  }

  static reMoveToDo(ToDoModel done) {
    _toDoList.remove(done);
  }

  // static dateTime(ToDoModel toDo) {

  // }
  // TODO add function delete
}
