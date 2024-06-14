// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../../data.dart';

Widget Quote() {
  return FutureBuilder(
    future: Data.fetchAlbum(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Text(
          "${snapshot.data!['text']}",
          style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        );
      } else if (snapshot.hasError) {
        return Text('${snapshot.error}');
      }

      // By default, show a loading spinner.
      return const CircularProgressIndicator();
    },
  );
}
