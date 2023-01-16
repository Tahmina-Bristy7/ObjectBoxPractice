import 'package:flutter/material.dart';
import 'package:obejctbox/home_page.dart';
import 'package:obejctbox/objectbox.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ObjectBox.createStore();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Object Box Demo',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const MyHomePage(),
    );
  }
}
