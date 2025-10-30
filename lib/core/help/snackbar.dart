import 'package:flutter/material.dart';

void showsnackbar(BuildContext context, String message) {
  final snackBar = SnackBar(
    duration: const Duration(seconds: 2),
    content: Text(message));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}