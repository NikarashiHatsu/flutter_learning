import 'package:flutter/material.dart';

SnackBar snackBarFailed(String message) {
  SnackBar snackBarFailed = SnackBar(
    content: Text(
      message,
      style: TextStyle(
        color: Colors.redAccent,
      ),
    ),
  );

  return snackBarFailed;
}