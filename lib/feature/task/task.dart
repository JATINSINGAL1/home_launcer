import 'package:flutter/material.dart';

class task extends StatelessWidget {
  const task({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text("Tasks"),
            IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
          ],
        ),
        SingleChildScrollView(
          child: SizedBox(
            height: 100,
            width: MediaQuery.sizeOf(context).width,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
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
      ],
    );
  }
}
