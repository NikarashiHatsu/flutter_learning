import 'package:flutter/material.dart';

SnackBar snackBarSuccess(String message) {
  SnackBar snackBarSuccess = SnackBar(
    content: Text(
      message,
      style: TextStyle(
        color: Colors.greenAccent,
      ),
    ),
  );

  return snackBarSuccess;
}