import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/di/locator.dart';
import 'package:todo_app/services/local/dao/task_dao.dart';
import 'package:todo_app/services/local/db_helper.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _dbHelper = locator<DBHelper>();
  final calendar = CalendarWeekController();

  DateTime get selectedDate => calendar.selectedDate;

  HomeBloc() : super(HomeState(date: DateTime.now(), listTask: [])) {
    add(GetTaskDate(date: DateTime.now()));
  }

  static HomeBloc of(BuildContext context) => context.read<HomeBloc>();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetTaskDate) {
      yield state.copyWith(
          date: event.date, listTask: _dbHelper.getTasks(event.date));
      return;
    }

    if (event is UpdateTask) {
      yield state;
    }
  }
}

class HomeState extends Equatable {
  final DateTime date;
  final List<TaskDao> listTask;

  int get current => listTask.where((task) => task.status == 1).length;

  int get total => listTask.length;

  String get dateString => 'Today';

  HomeState({required this.date, required this.listTask});

  HomeState copyWith(
      {required DateTime date, required List<TaskDao> listTask}) {
    return HomeState(date: date, listTask: listTask);
  }

  @override
  List get props => [date, listTask];
}

abstract class HomeEvent {}

class UpdateTask extends HomeEvent {
  final TaskDao task;

  UpdateTask({required this.task, bool doneTask = true}) {
    task.updateAt = DateTime.now();
    task.status = doneTask ? 1 : 0;
    task.save();
  }
}

class GetTaskDate extends HomeEvent {
  final DateTime date;

  GetTaskDate({required this.date});
}

class AddTask extends HomeEvent {
  final TaskDao task;

  AddTask({required this.task});
}
