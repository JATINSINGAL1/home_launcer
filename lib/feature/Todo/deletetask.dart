import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget DeleteTask(controller) {
  return IconButton(
      onPressed: () {
        controller.todoList = List.empty(growable: true);
        controller.itemcount.value = 0;
      },
      icon: const Icon(Icons.delete));
}
