import 'dart:async';

import 'package:flutter/material.dart';

class TimeClock extends StatefulWidget {
  const TimeClock({super.key});

  @override
  State<TimeClock> createState() => _TimeClockState();
}

class _TimeClockState extends State<TimeClock> {

   Timer? timer;
  
  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
                  // onTap: () => PlatformIntents.launchAlarmClockIntent(),
                  child: Text(
                    TimeOfDay.now().format(context),
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                  ),
                );
  }
}