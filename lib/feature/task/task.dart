import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class task extends StatelessWidget {
  const task({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("Tasks"),
            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          ],
        ),
        SingleChildScrollView(
          child: SizedBox(
            height: 100,
            width: MediaQuery.sizeOf(context).width,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              // physics: AlwaysScrollableScrollPhysics(),
              itemCount: 10,

              // itemExtent: ESizes.spaceBtwItems,
              itemBuilder: (context, index) {
                return Container(
                  height: 10,
                  width: 10,
                  color: Colors.red,
                );
              },
            ),
          ),
        ),

        //  Expanded(
        //             child: ValueListenableBuilder(
        //                 valueListenable: Task.listenable(),
        //                 builder: (context, box, _) {
        //                   return ListView.builder(
        //                     shrinkWrap: true,
        //                     itemCount: Task.count(),
        //                     itemBuilder: (BuildContext context, int index) {
        //                       Task task = Task.getReversedAt(index);
        //                       return Container(
        //                         padding: EdgeInsets.symmetric(vertical:10),
        //                         child: ListTileTheme(
        //                           contentPadding: EdgeInsets.all(0),
        //                           child: CheckboxListTile(
        //                             checkColor:
        //                                 Theme.of(context).colorScheme.background,
        //                             activeColor:
        //                                 Theme.of(context).colorScheme.primary,
        //                             dense: true,
        //                             value: task.isCompleted,
        //                             title: Text(task.name,
        //                                 style: Theme.of(context)
        //                                     .textTheme
        //                                     .bodyText1
        //                                     .copyWith(
        //                                         decoration: task.isCompleted
        //                                             ? TextDecoration.lineThrough
        //                                             : TextDecoration.none)),
        //                             controlAffinity:
        //                                 ListTileControlAffinity.leading,
        //                             onChanged: (bool value) {
        //                               task.setCompleted(value);
        //                             },
        //                           ),
        //                         ),
        //                       );
        //                     },
        //                   );
        //                 }),
        //           ),
      ],
    );
  }
}
