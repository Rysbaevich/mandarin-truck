import 'package:flutter/material.dart';

Widget customSuccessWidget() {
  return Container(
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: Colors.green, // Green background for success
      borderRadius: BorderRadius.circular(50.0),
    ),
    child: const Icon(Icons.done, color: Colors.white),
  );
}

Widget customErrorWidget() {
  return Container(
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: Colors.red, // Red background for error
      borderRadius: BorderRadius.circular(50.0),
    ),
    child: const Icon(Icons.close, color: Colors.white),
  );
}
