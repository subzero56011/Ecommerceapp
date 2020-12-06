import 'package:ecommerce_app/modules/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'shared/colors/color_common.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(color: kDefaultColor),
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: WelcomeScreen(),
    );
  }
}
