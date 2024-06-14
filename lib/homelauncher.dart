import 'package:home_launcer/packages.dart';

class HomeLauncher extends StatefulWidget {
  const HomeLauncher({super.key});

  @override
  State<HomeLauncher> createState() => _HomeLauncherState();
}

class _HomeLauncherState extends State<HomeLauncher> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(Taskcontroller());

    return Scaffold(
      floatingActionButton: FAB(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // DATE and Time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TimeClock(),
                DateText(),
              ],
            ),

            const SizedBox(
              height: 32,
            ),

            // Motivational Quote using API
            Quote(),

            const SizedBox(
              height: 32,
            ),

            Obx(
              () => Expanded(
                  child: Column(
                children: [
                  // Title Bar
                  Row(
                    children: [
                      TitleTask(),
                      AddTask(context, controller),
                      DeleteTask(controller),
                    ],
                  ),

                  // Display of Task
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
                            child: Row(
                              children: [
                                Checkbox(
                                  value: controller.todoList[index]
                                      ['ischecked'],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      controller.todoList[index]['ischecked'] =
                                          value;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                TaskTextDisplay(controller, index),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
