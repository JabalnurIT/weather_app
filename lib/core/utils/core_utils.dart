import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../res/colours.dart';

class CoreUtils {
  const CoreUtils._();

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colours.primaryColour,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.all(10),
        ),
      );
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '**Field tidak boleh kosong';
    } else if (!value.contains('@')) {
      return '**Format email tidak valid';
    } else if (!value.contains('.')) {
      return '**Format email tidak valid';
    } else if (value.contains(' ')) {
      return '**Format email tidak valid';
    }

    return null;
  }

  static String? fileToUriBase64(File? file) {
    if (file == null) {
      return null;
    }
    final filePath = file.path;
    final base64File = base64Encode(file.readAsBytesSync());
    String uriBase64;
    if (filePath.split('/').last.split('.').last == "pdf") {
      uriBase64 = "data:application/pdf;base64,$base64File";
    } else if (filePath.split('/').last.split('.').last == "docx" ||
        filePath.split('/').last.split('.').last == "doc") {
      uriBase64 = "data:application/msword;base64,$base64File";
    } else {
      uriBase64 =
          "data:image/${filePath.split('/').last.split('.').last};base64,$base64File";
    }
    return uriBase64;
  }

  static String formattedTime(DateTime dateTime) {
    String formattedTime = DateFormat('hh a').format(dateTime);
    if (formattedTime.startsWith('0')) {
      formattedTime = formattedTime.substring(1);
    }
    // if hh is 12 then change it to 0
    if (formattedTime.startsWith('12')) {
      formattedTime = '0${formattedTime.substring(2)}';
    }
    return formattedTime;
  }

  static String formattedDay(DateTime dateTime) {
    String formattedDay = DateFormat('EEE').format(dateTime);

    return formattedDay;
  }
}
