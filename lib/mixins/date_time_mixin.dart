class DateTimeMixin {
  String getDate(DateTime dateTime) {
    String dateSlug =
        "${dateTime.year.toString()}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
    return dateSlug;
  }
}
