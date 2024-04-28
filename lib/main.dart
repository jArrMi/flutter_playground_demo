import 'package:flutter/material.dart';
import 'package:flutter_playrground_1/provider/past_launch_provider.dart';
import 'package:flutter_playrground_1/provider/upcoming_launch_provider.dart';
import 'package:flutter_playrground_1/ui/launches/launch_list_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UpcomingLaunchProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PastLaunchProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Playground',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const LaunchListPage(),
    );
  }
}
