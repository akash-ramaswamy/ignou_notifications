import 'package:flutter/material.dart';

AppBar getMainAppBar() {
  return AppBar(
    foregroundColor: Colors.black,
    backgroundColor: Colors.black,
    title: const Text(
      "Latest IGNOU Notifications",
      style: TextStyle(
        color: Colors.deepOrange,
        fontWeight: FontWeight.w800,
        fontStyle: FontStyle.italic,
      ),
    ),
    centerTitle: true,
  );
}
