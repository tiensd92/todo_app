import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sprintf/sprintf.dart';
import 'package:todo_app/generated/l10n.dart';
import 'package:todo_app/resources/app_color.dart';
import 'package:todo_app/resources/app_style.dart';
import 'package:todo_app/widgets/app_text_field.dart';
import 'package:todo_app/widgets/filter_category.dart';

import 'add_task_bloc.dart';

class AddTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddTaskBloc>(
      create: (_) {
        final bloc = AddTaskBloc();
        bloc.onAddSuccess = () {
          Navigator.of(context).pop(true);
        };

        return bloc;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: AppColor.h444444,
              size: 30,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: BlocBuilder<AddTaskBloc, AddTaskState>(
            builder: (ctx, state) =>
                Form(
                  key: ctx
                      .read<AddTaskBloc>()
                      .formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          S
                              .of(context)
                              .title_add_task,
                          style: AppStyle.title,
                        ),
                      ),
                      const SizedBox(height: 10),
                      AppTextField(
                        controller: ctx
                            .read<AddTaskBloc>()
                            .controllerTitle,
                        label: S
                            .of(context)
                            .hint_title,
                        textInputAction: TextInputAction.next,
                        requiredText: S
                            .of(context)
                            .message_error_need_title,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(ctx
                              .read<AddTaskBloc>()
                              .focusDesc);
                        },
                      ),
                      const SizedBox(height: 16),
                      AppTextField(
                        controller: ctx
                            .read<AddTaskBloc>()
                            .controllerDesc,
                        focusNode: ctx
                            .read<AddTaskBloc>()
                            .focusDesc,
                        label: S
                            .of(context)
                            .hint_description,
                      ),
                      const SizedBox(height: 24),
                      Text(S
                          .of(context)
                          .lbl_filter, style: AppStyle.body),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          FilterCategory(
                              value: 0,
                              groupValue: state.category,
                              onChanged: (value) {
                                ctx
                                    .read<AddTaskBloc>()
                                    .add(ChangeCategoryEvent(value));
                              }),
                          const SizedBox(width: 20),
                          FilterCategory(
                              value: 1,
                              groupValue: state.category,
                              onChanged: (value) {
                                ctx
                                    .read<AddTaskBloc>()
                                    .add(ChangeCategoryEvent(value));
                              }),
                          const SizedBox(width: 20),
                          FilterCategory(
                              value: 2,
                              groupValue: state.category,
                              onChanged: (value) {
                                ctx
                                    .read<AddTaskBloc>()
                                    .add(ChangeCategoryEvent(value));
                              }),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.calendar_today_sharp,
                            color: AppColor.h00e1b4,
                          ),
                          Text(S
                              .of(context)
                              .lbl_date, style: AppStyle.body)
                        ],
                      ),
                      const SizedBox(height: 24),
                      GestureDetector(
                        child: Row(
                          children: [
                            const SizedBox(width: 24),
                            Expanded(
                                child: _DateTimeText(
                                    state.date.day.toString())),
                            const SizedBox(width: 24),
                            Expanded(
                                child: _DateTimeText(
                                    sprintf('%02i', [state.date.month]))),
                            const SizedBox(width: 24),
                            Expanded(
                                child: _DateTimeText(
                                    state.date.year.toString())),
                            const SizedBox(width: 24),
                          ],
                        ),
                        onTap: () {
                          showDatePicker(
                              context: context,
                              initialDate: state.date,
                              firstDate:
                              DateTime.now().add(Duration(days: -365)),
                              lastDate: state.date.add(Duration(days: 365)))
                              .then((value) {
                            if (value != null) {
                              ctx.read<AddTaskBloc>().add(
                                  ChangeDateEvent(value));
                            }
                          });
                        },
                      ),
                      Spacer(),
                      Align(
                          alignment: Alignment.topCenter,
                          child: MaterialButton(
                            onPressed: () {
                              ctx.read<AddTaskBloc>().add(AddNewTaskEvent());
                            },
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            textColor: AppColor.white,
                            color: AppColor.h00e1b4,
                            child: Text(
                              S
                                  .of(context)
                                  .btn_add_task,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                          )),
                      const SizedBox(height: 30)
                    ],
                  ),
                ),
          ),
        ),
      ),
    );
  }
}

class _DateTimeText extends StatelessWidget {
  final String text;

  _DateTimeText(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColor.hcfcfcf))),
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: AppColor.h9d9d9d),
      ),
    );
  }
}
