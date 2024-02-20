import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stop_watch/HomeScreen.dart';
import 'package:stop_watch/provider_class.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TimerProvider(), // Use StopWatchProvider instead of StopWatchModel
      child: MaterialApp(
        theme: ThemeData(brightness: Brightness.light),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: HomeScreen(),
      ),
    );
  }
}
