extension DateTimExt on DateTime {
  bool isSameDay(DateTime date) {
    return this.year == date.year &&
        this.month == date.month &&
        this.day == date.day;
  }
}
