import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/generated/l10n.dart';
import 'package:todo_app/pages/add_task/add_task_page.dart';
import 'package:todo_app/resources/app_color.dart';
import 'package:todo_app/resources/app_style.dart';
import 'package:todo_app/services/local/dao/task_dao.dart';
import 'package:todo_app/widgets/gradient_progress_indicator.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:todo_app/utils/variable_extension.dart';

import 'home_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (_) => HomeBloc(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 28, right: 28, top: 28, bottom: 16),
          child: BlocBuilder<HomeBloc, HomeState>(
              builder: (ctx, state) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).title_home,
                        style: AppStyle.title,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        S
                            .of(context)
                            .lbl_task_complete(state.current, state.total),
                        style: AppStyle.body.merge(TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                      ),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: GradientProgressIndicator(
                          backgroundColor: AppColor.hd9e5f7,
                          value: state.total == 0
                              ? 0
                              : state.current / state.total,
                          gradient: LinearGradient(
                              colors: [AppColor.h3a7dd5, AppColor.h01d0ff]),
                        ),
                      ),
                      const SizedBox(height: 24),
                      IntrinsicWidth(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              state.dateString,
                              style: AppStyle.header,
                            ),
                            Container(
                              height: 2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(200),
                                  gradient: LinearGradient(colors: [
                                    AppColor.h3a7dd5,
                                    AppColor.h01d0ff
                                  ])),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: AppColor.h000000.withOpacity(0.2),
                                  blurRadius: 6,
                                  offset: Offset(2, 4))
                            ],
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CalendarWeek(
                            backgroundColor: Colors.white,
                            controller: HomeBloc.of(ctx).calendar,
                            height: 80,
                            showMonth: false,
                            pressedDateBackgroundColor: AppColor.h00e1b4,
                            dayOfWeekStyle: AppStyle.calendar,
                            weekendsStyle: AppStyle.calendar,
                            dateStyle: AppStyle.calendar,
                            todayBackgroundColor: HomeBloc.of(ctx)
                                    .selectedDate
                                    .isSameDay(DateTime.now())
                                ? AppColor.h00e1b4
                                : Colors.transparent,
                            todayDateStyle: HomeBloc.of(ctx)
                                    .selectedDate
                                    .isSameDay(DateTime.now())
                                ? AppStyle.calendar
                                    .merge(TextStyle(color: AppColor.white))
                                : AppStyle.calendar,
                            minDate: DateTime.now().add(
                              Duration(days: -365),
                            ),
                            maxDate: DateTime.now().add(
                              Duration(days: 365),
                            ),
                            onDatePressed: (DateTime datetime) {
                              HomeBloc.of(ctx).add(GetTaskDate(date: datetime));
                            },
                            onDateLongPressed: (DateTime datetime) {
                              // Do something
                            },
                            onWeekChanged: () {
                              // Do something
                            },
                          ),
                        ),
                      ),
                      Expanded(
                          child: ListView.builder(
                        itemBuilder: (_, index) =>
                            _TaskItem(state.listTask[index]),
                        itemCount: state.total,
                      ))
                    ],
                  )),
        ),
        floatingActionButton: BlocBuilder<HomeBloc, HomeState>(
            builder: (ctx, state) => FloatingActionButton(
                  child: Icon(
                    Icons.add_rounded,
                    color: AppColor.white,
                    size: 50,
                  ),
                  backgroundColor: AppColor.h00e1b4,
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => AddTaskPage()))
                        .then((value) {
                      if (value == null) return;

                      if (value is bool && value) {
                        HomeBloc.of(ctx).add(GetTaskDate(date: state.date));
                      }
                    });
                  },
                )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

class _TaskItem extends StatelessWidget {
  final TaskDao task;

  _TaskItem(this.task);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: categoryColor,
    );
  }

  Color get categoryColor {
    switch (task.category) {
      case 0:
        return AppColor.hed2139;
      case 1:
        return AppColor.h00077ff;
      case 2:
        return AppColor.h24c1bc;
    }

    return AppColor.hed2139;
  }
}
