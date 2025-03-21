import 'package:flutter/material.dart';

void printStarLine() {
  print('*' * 150);
}

void mprint(String? message) {
  printStarLine();
  print('Mohamed : $message');
  printStarLine();
}

void showSnackbar({required String message, required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    ),
  );
}
