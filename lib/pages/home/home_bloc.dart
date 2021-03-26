import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/di/locator.dart';
import 'package:todo_app/services/local/dao/task_dao.dart';
import 'package:todo_app/services/local/db_helper.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _dbHelper = locator<DBHelper>();
  HomeState _currentState;

  HomeBloc(this._currentState) : super(_currentState);

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetTaskDate) {
      yield HomeState(
          listTask: _dbHelper.getTasks(event.date), date: event.date);
      return;
    }

    if (event is DoneTask) {
      yield HomeState(
          listTask: _currentState.listTask, date: _currentState.date);
      return;
    }

    if (event is DoingTask) {
      yield HomeState(
          listTask: _currentState.listTask, date: _currentState.date);
      return;
    }
  }
}

class HomeState extends Equatable {
  final DateTime date;
  final List<TaskDao> listTask;

  HomeState({required this.listTask, required this.date});

  @override
  List get props => [date, listTask];
}

abstract class HomeEvent {}

class DoneTask extends HomeEvent {
  final TaskDao task;

  DoneTask({required this.task});
}

class DoingTask extends HomeEvent {
  final TaskDao task;

  DoingTask({required this.task});
}

class GetTaskDate extends HomeEvent {
  final DateTime date;

  GetTaskDate({required this.date});
}

class AddTask extends HomeEvent {
  final TaskDao task;

  AddTask({required this.task});
}
