import 'package:flutter/material.dart';
import '../data/notification_model.dart';

@immutable
class NewsListTile extends StatelessWidget {
  final NotificationItem notification;
  const NewsListTile({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          notification.message,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Rubik",
              color: Colors.deepOrange,
              letterSpacing: 0,
              fontSize: 20,
              height: 1.2),
        ),
        subtitle: Text(
          notification.date,
          style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontFamily: "Rubik",
              color: Colors.grey,
              fontStyle: FontStyle.italic),
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.deepOrange,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(13),
        ),
      ),
    );
  }
}
