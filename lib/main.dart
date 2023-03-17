import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shorttraining_riverpod_usage/screens/counter_screen.dart';
import 'package:shorttraining_riverpod_usage/screens/future_screen.dart';
import 'package:shorttraining_riverpod_usage/screens/stream_screen.dart';

import '../screens/home_page_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.green,
              brightness: Brightness.dark,
              surface: const Color(0xff003909))),
      home: HomePage(),
      routes: {
        CounterScreen.routeName: (context) => const CounterScreen(),
        StreamScreen.routeName: (context) => const StreamScreen(),
        FutureScreen.routeName: (context) => FutureScreen(),
      },
    );
  }
}
