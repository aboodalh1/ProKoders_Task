import 'dart:async';

import 'package:flutter/material.dart';

void navigateTo(
    BuildContext context,
    Widget widget, {
      FutureOr<dynamic> Function(dynamic)? onValue,
    }) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  ).then(onValue ?? (_) {});
}

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
        (route) => false);
