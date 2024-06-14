import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Taskcontroller extends GetxController {
  var textcontroller = TextEditingController();
  List todoList = [];
  String singlevalue = "";
  bool ischecked = false;
  task(content) {
    itemcount.value++;
    singlevalue = content;
    todoList.add({"value": singlevalue, "ischecked": false});
  }

  var itemcount = 0.obs;
}
