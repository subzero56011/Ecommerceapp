import 'package:ecommerce_app/layout/cubit/cubit.dart';
import 'package:ecommerce_app/layout/home.dart';
import 'package:ecommerce_app/modules/login/cubit/cubit.dart';
import 'package:ecommerce_app/modules/register/cubit/cubit.dart';
import 'package:ecommerce_app/modules/welcome/welcome_screen.dart';
import 'package:ecommerce_app/shared/components/components.dart';
import 'package:ecommerce_app/shared/network/local/shared_prefrences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'shared/colors/color_common.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var widget;

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
