// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Widget TitleTask() {
  return const Expanded(
      child: Center(
          child: Text(
    "Tasks",
    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
  )));
}

Widget TaskTextDisplay(controller, index) {
  return Text(
    softWrap: true,
    controller.todoList[index]['value'].toString(),
    style: TextStyle(
        fontSize: 24,
        fontWeight: controller.todoList[index]['ischecked']
            ? FontWeight.w300
            : FontWeight.w500,
        decoration: controller.todoList[index]['ischecked']
            ? TextDecoration.lineThrough
            : null),
  );
}
