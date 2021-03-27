import 'package:flutter/material.dart';
import 'package:todo_app/generated/l10n.dart';
import 'package:todo_app/resources/app_color.dart';

class FilterCategory extends StatelessWidget {
  final int value;
  final int? groupValue;
  final ValueChanged<int>? onChanged;

  FilterCategory({required this.value, this.groupValue, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged?.call(value);
      },
      child: Container(
        height: 80,
        width: 90,
        padding: const EdgeInsets.all(6),
        alignment: Alignment.bottomCenter,
        child: Text(
          text,
          style: TextStyle(color: AppColor.white, fontSize: 16),
        ),
        decoration: BoxDecoration(
            boxShadow: [
              if (value == groupValue)
                BoxShadow(
                    color: AppColor.h000000.withOpacity(0.2),
                    blurRadius: 6,
                    offset: Offset(4, 4))
            ],
            gradient: LinearGradient(
                colors: [beginColor, endColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  String get text {
    switch (value) {
      case 0:
        return S.current.category_work;
      case 1:
        return S.current.category_home;
      case 2:
        return S.current.category_personal;
    }

    return '';
  }

  Color get beginColor {
    switch (value) {
      case 0:
        return AppColor.hef463a;
      case 1:
        return AppColor.h04c4ff;
      case 2:
        return AppColor.h02dfb6;
    }

    return AppColor.hef463a;
  }

  Color get endColor {
    switch (value) {
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
