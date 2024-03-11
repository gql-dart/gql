class CustomDate extends DateTime {
  CustomDate(
    super.year,
    super.month,
    super.day,
  );

  static CustomDate parse(String formattedString) {
    final DateTime dateTime = DateTime.parse(formattedString);
    return CustomDate(dateTime.year, dateTime.month, dateTime.day);
  }

  @override
  CustomDate toLocal() {
    final DateTime localDateTime = super.toLocal();
    return CustomDate(
        localDateTime.year, localDateTime.month, localDateTime.day);
  }
}
