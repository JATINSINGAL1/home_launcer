import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final now = new DateTime.now();
String date = DateFormat.yMMMMd().format(now);
Widget DateText() {
  return Text(date,style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w500));
}
