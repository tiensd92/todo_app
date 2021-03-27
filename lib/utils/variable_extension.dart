import 'package:intl/intl.dart';
import 'package:todo_app/generated/l10n.dart';

extension DateTimExt on DateTime {
  bool isSameDay(DateTime date) {
    return this.year == date.year &&
        this.month == date.month &&
        this.day == date.day;
  }

  String get toDateString {
    final now = DateTime.now();
    if (now.isSameDay(this)) return S.current.today;

    final tomorrow = now.add(Duration(days: 1));
    if (tomorrow.isSameDay(this)) return S.current.tomorrow;

    final yesterday = now.add(Duration(days: -1));
    if (yesterday.isSameDay(this)) return S.current.yesterday;

    return DateFormat('dd/MM/yyyy').format(this);
  }
}
