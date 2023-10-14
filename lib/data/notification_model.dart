class NotificationItem {
  final String message;
  final String date;
  final String link;

  NotificationItem({
    required this.message,
    required this.date,
    required this.link,
  });

  @override
  String toString() {
    return '''{
    message: $message,
    date: $date,
    link: $link
  }''';
  }
}
