import 'dart:async';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialpad/flutter_dialpad.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:home_launcer/data.dart';
import 'package:home_launcer/feature/task/taskcontroller.dart';
import 'package:home_launcer/feature/text_clock/date.dart';
import 'package:home_launcer/feature/text_clock/textclock.dart';

import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeLauncher extends StatefulWidget {
  const HomeLauncher({super.key});

  @override
  State<HomeLauncher> createState() => _HomeLauncherState();
}

class _HomeLauncherState extends State<HomeLauncher> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(Taskcontroller());
    void _launchUrl(Uri uri) async {
      try {
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      } catch (e) {
        print(e.toString());
      }
    }

    return Scaffold(
      floatingActionButton: SpeedDial(
         animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 22),
          
          visible: true,
          curve: Curves.bounceIn,
        children: [
          SpeedDialChild(
              onTap: () async {
                bool isInstalled = await DeviceApps.isAppInstalled(
                    'com.sec.android.app.popupcalculator');
                if (isInstalled != false) {
                  DeviceApps.openApp('com.sec.android.app.popupcalculator');
                } else {
                  print("can't open");
                }
              },
              label: "Calculator",
              child: const Icon(Icons.calculate)),
              SpeedDialChild(
              onTap: () async {
                bool isInstalled = await DeviceApps.isAppInstalled(
                    'com.samsung.android.calendar');
                if (isInstalled != false) {
                  DeviceApps.openApp('com.samsung.android.calendar');
                } else {
                  print("can't open");
                }
              },
              label: "Calendar",
              child: const Icon(Icons.calendar_view_month)),
          SpeedDialChild(
              onTap: () {
                _launchUrl(Uri.parse('tel:+123156789'));
              },
              label: "Phone",
              child: const Icon(Icons.dialpad)),
        ],
      ),
      // backgroundColor: Colors.yellow,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TimeClock(),
                DateText(),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            FutureBuilder(
              future: Data.fetchAlbum(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "${snapshot.data!['text']}",
                    style: const TextStyle(
                        fontSize: 36, fontWeight: FontWeight.bold),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
            const SizedBox(
              height: 32,
            ),
            Obx(
              () => Expanded(
                  child: Container(
                // color: Colors.yellow,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                            child: Center(
                                child: Text(
                          "Tasks",
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.w500),
                        ))),
                        IconButton(
                            onPressed: () async {
                              await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    title: const Text(
                                      'I CAN and I WILL!',
                                      style: TextStyle(
                                        fontSize: 32,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    content: TextField(
                                      
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText:
                                              "What is your todays task?"),
                                      controller: controller.textcontroller,
                                    ),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            if (controller.textcontroller.text
                                                .isNotEmpty) {
                                              controller.task(controller
                                                  .textcontroller.text);
                                              Navigator.pop(context);
                                            } else {
                                              
                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Field Requied"),));
                                            }
                                          },
                                          child: const Text('ADD'))
                                    ],
                                  );
                                },
                              );
                              controller.textcontroller.clear();
                            },
                            icon: const Icon(Icons.add)),
                        IconButton(
                            onPressed: () {
                              controller.todoList = List.empty(growable: true);
                              controller.itemcount.value = 0;
                            },
                            icon: const Icon(Icons.delete))
                      ],
                    ),
                    // Container(width: 200,height: 200,color: Colors.red,),
                    Expanded(
                      child: SizedBox(
                        width: 500,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.itemcount.value,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 100,

                              margin: const EdgeInsets.all(8),
                              // color: Colors.red,
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: controller.todoList[index]
                                        ['ischecked'],
                                    onChanged: (bool? value) {
                                      setState(() {
                                        controller.todoList[index]
                                            ['ischecked'] = value;
                                      });
                                    },
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    softWrap: true,
                                    controller.todoList[index]['value']
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: controller.todoList[index]
                                                ['ischecked']
                                            ? FontWeight.w300
                                            : FontWeight.w500,
                                        decoration: controller.todoList[index]
                                                ['ischecked']
                                            ? TextDecoration.lineThrough
                                            : null),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
