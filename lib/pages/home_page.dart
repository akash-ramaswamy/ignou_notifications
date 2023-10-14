import 'package:flutter/material.dart';

import '../data/notification_model.dart';
import '../widgets/news_list_tile.dart';

class HomePage extends StatelessWidget {
  final List<NotificationItem> notifications;
  const HomePage({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    if (notifications.isEmpty) {
      return const Center(
        child: Text(
          "Nothing found here..",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: notifications.map((notification) {
          return NewsListTile(notification: notification);
        }).toList(),
      ),
    );
  }
}
