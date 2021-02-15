import 'package:ecommerce_app/layout/cubit/cubit.dart';
import 'package:ecommerce_app/layout/home.dart';
import 'package:ecommerce_app/modules/courses/courses_screen.dart';
import 'package:ecommerce_app/modules/login/cubit/cubit.dart';
import 'package:ecommerce_app/modules/register/cubit/cubit.dart';
import 'package:ecommerce_app/modules/welcome/welcome_screen.dart';
import 'package:ecommerce_app/shared/components/components.dart';
import 'package:ecommerce_app/shared/network/local/shared_prefrences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'shared/colors/color_common.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  var widget;

  FirebaseMessaging().subscribeToTopic('juniors');

  await initPref().then((value) {
    if (getToken() != null && getToken().length > 0)
      widget = HomeScreen();
    else
      widget = WelcomeScreen();
  });

  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  final widget;
  MyApp(this.widget);

  @override
  Widget build(BuildContext context) {
    initApp();
    setFirebaseMessaging();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(color: kDefaultColor),
          scaffoldBackgroundColor: Colors.grey[200],
        ),
        home: widget,
      ),
    );
  }
}

setFirebaseMessaging() {
  FirebaseMessaging().configure(
    onMessage: (msg) {
      print('notu recived');
      print(msg.toString());
      return null;
    },
  );
}
