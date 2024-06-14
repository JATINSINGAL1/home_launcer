// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Widget AddTask(context, controller) {
  return IconButton(
      onPressed: () async {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              title: const Text(
                'I CAN and I WILL!',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              content: TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "What is your todays task?"),
                controller: controller.textcontroller,
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      if (controller.textcontroller.text.isNotEmpty) {
                        controller.task(controller.textcontroller.text);
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Field Requied"),
                        ));
                      }
                    },
                    child: const Text('ADD'))
              ],
            );
          },
        );
        controller.textcontroller.clear();
      },
      icon: const Icon(Icons.add));
}
