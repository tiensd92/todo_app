import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/di/locator.dart';
import 'package:todo_app/services/local/dao/task_dao.dart';
import 'package:todo_app/services/local/db_helper.dart';

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  final _dbHelper = locator<DBHelper>();
  final focusDesc = FocusNode();
  final formKey = GlobalKey<FormState>();
  final controllerTitle = TextEditingController();
  final controllerDesc = TextEditingController();
  VoidCallback? onAddSuccess;

  AddTaskBloc() : super(AddTaskState(date: DateTime.now()));

  @override
  Stream<AddTaskState> mapEventToState(event) async* {
    if (event is ChangeCategoryEvent) {
      yield state.copyWith(filter: event.category, date: state.date);
      return;
    }

    if (event is ChangeDateEvent) {
      yield state.copyWith(filter: state.category, date: event.date);
      return;
    }

    if (event is AddNewTaskEvent) {
      if (formKey.currentState == null || !formKey.currentState!.validate()) {
        return;
      }

      _dbHelper.insert(TaskDao(
          title: controllerTitle.text,
          description: controllerDesc.text,
          category: state.category,
          createAt: state.date));
      onAddSuccess?.call();
    }
  }
}

class AddTaskState extends Equatable {
  final int category;
  final DateTime date;

  AddTaskState({this.category = 0, required this.date});

  AddTaskState copyWith({required int filter, required DateTime date}) {
    return AddTaskState(category: filter, date: date);
  }

  @override
  List<Object?> get props => [category, date];
}

abstract class AddTaskEvent {}

class AddNewTaskEvent extends AddTaskEvent {}

class ChangeCategoryEvent extends AddTaskEvent {
  final int category;

  ChangeCategoryEvent(this.category);
}

class ChangeDateEvent extends AddTaskEvent {
  final DateTime date;

  ChangeDateEvent(this.date);
}
