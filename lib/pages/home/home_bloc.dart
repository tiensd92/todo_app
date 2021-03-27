import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/di/locator.dart';
import 'package:todo_app/services/local/dao/task_dao.dart';
import 'package:todo_app/services/local/db_helper.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:todo_app/utils/variable_extension.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _dbHelper = locator<DBHelper>();
  final calendar = CalendarWeekController();
  List<TaskDao> listTask = [];

  int get current => listTask.where((task) => task.status == 1).length;

  int get total => listTask.length;

  DateTime get selectedDate => calendar.selectedDate;

  HomeBloc() : super(HomeState(date: DateTime.now())) {
    add(GetTaskDate(date: DateTime.now()));
  }

  static HomeBloc of(BuildContext context) => context.read<HomeBloc>();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetTaskDate) {
      listTask = _dbHelper.getTasks(event.date);
      yield state.copyWith(date: event.date, current: current, total: total);
      return;
    }

    if (event is UpdateTask) {
      listTask[event.index].updateAt = DateTime.now();
      listTask[event.index].status = event.doneTask ? 1 : 0;
      await listTask[event.index].save();
      yield state.copyWith(current: current, total: total);
      return;
    }
  }
}

class HomeState extends Equatable {
  final DateTime date;
  final int current;
  final int total;

  String get dateString => date.toDateString;

  HomeState({required this.date, this.current = 0, this.total = 0});

  HomeState copyWith({DateTime? date, int? current, int? total}) {
    return HomeState(
        date: date ?? this.date,
        current: current ?? this.current,
        total: total ?? this.total);
  }

  @override
  List get props => [date, current, total];
}

abstract class HomeEvent {}

class UpdateTask extends HomeEvent {
  final int index;
  final bool doneTask;

  UpdateTask({required this.index, this.doneTask = true});
}

class GetTaskDate extends HomeEvent {
  final DateTime date;

  GetTaskDate({required this.date});
}
