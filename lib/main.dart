import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'data/notification_model.dart';
import 'data/notification_items_service.dart';
import 'pages/home_page.dart';
import 'widgets/main_app_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<NotificationItem> notifications = [];
  bool isLoading = false;

  void _setLoadingState(bool state) {
    setState(() {
      isLoading = state;
    });
  }

  void fetchNotifications() async {
    HapticFeedback.lightImpact();
    _setLoadingState(true);
    try {
      final List<NotificationItem> newNotifications =
          await NotificationItemsService().getNotificationItems();
      setState(() {
        notifications = newNotifications;
      });
    } catch (e) {
      debugPrint("Error while fetchNotifications call: ");
      debugPrint(e.toString());
    } finally {
      Future.delayed(const Duration(seconds: 2))
          .then((value) => _setLoadingState(false));
    }
  }

  @override
  void initState() {
    fetchNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        fontFamily: "Rubik",
        useMaterial3: true,
      ),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          enableFeedback: true,
          onPressed: fetchNotifications,
          child: const Icon(Icons.refresh),
        ),
        backgroundColor: Colors.black,
        appBar: getMainAppBar(),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : HomePage(notifications: notifications),
      ),
    );
  }
}
