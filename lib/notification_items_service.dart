import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

void main() async {
  var url = Uri.http('ignou.ac.in', 'ignou/bulletinboard/announcements/latest');
  final htmlContent = await http.read(url);

  final parsedHtml = parse(htmlContent);
  final listItems = parsedHtml.querySelectorAll(".middleconten ul li");
  final List<NotificationItem> notificationItems = [];

  for (var element in listItems) {
    final childrenElements = element.children;
    if (childrenElements.isNotEmpty) {
      final notificationMessage = childrenElements[0].text;
      final notificationDate = childrenElements.length > 2
          ? childrenElements[2].text
          : childrenElements[1].text;
      final notificationLink = childrenElements[0].attributes["href"] ?? "#";

      notificationItems.add(NotificationItem(
        message: notificationMessage,
        date: notificationDate,
        link: notificationLink,
      ));
    }
  }
}

class NotificationItem {
  final String message;
  final String date;
  final String link;

  NotificationItem({
    required this.message,
    required this.date,
    required this.link,
  });
}
