import 'package:flutter/material.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:sample_flutter_meedu/app/ui/pages/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorObservers: [
        router.observer,
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      /*usar CounterPage()
      para ejemplo con SimpleNotifier
      */
      /*usar LoginPage()
      para ejemplo con StateNotifier
      */
      home: const LoginPage(),
    );
  }
}
