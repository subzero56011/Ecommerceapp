import 'package:ecommerce_app/layout/home.dart';
import 'package:ecommerce_app/modules/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:ecommerce_app/modules/forgot_password/forgot_password_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/modules/register/cubit/cubit.dart';
import 'package:ecommerce_app/modules/register/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';

class RegisterScreen extends StatelessWidget {
  var firstController = TextEditingController();
  var lastController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
      if (state is RegisterStateLoading) {
        buildProgress(
          context: context,
          text: 'please wait',
        );
      }
      if (state is RegisterStateSuccess) {
        navigateAndFinish(
          context,
          HomeScreen(),
        );
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                headText('Sign up'),
                SizedBox(
                  height: 20.0,
                ),
                DefaultTextForm(
                  title: 'First name',
                  hint: 'Sarah',
                  controller: firstController,
                  type: TextInputType.text,
                ),
                SizedBox(
                  height: 20.0,
                ),
                DefaultTextForm(
                  title: 'Last name',
                  hint: 'Smith',
                  controller: lastController,
                  type: TextInputType.text,
                ),
                SizedBox(
                  height: 20.0,
                ),
                DefaultTextForm(
                  title: 'Email',
                  hint: 'enter your email',
                  type: TextInputType.emailAddress,
                  controller: emailController,
                ),
                SizedBox(
                  height: 20,
                ),
                DefaultTextForm(
                  title: 'Password',
                  hint: 'enter your Password',
                  type: TextInputType.visiblePassword,
                  controller: passwordController,
                ),
                SizedBox(
                  height: 20,
                ),
                DefaultTextForm(
                  title: 'City',
                  hint: 'enter your City',
                  type: TextInputType.visiblePassword,
                  controller: cityController,
                ),
                SizedBox(
                  height: 20,
                ),
                Button(
                  text: 'Register',
                  borderRadius: 15,
                  onPressed: () {
                    RegisterCubit.get(context).register(
                      first: firstController.text,
                      last: lastController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      city: cityController.text,
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Button(
                  text: 'login',
                  borderRadius: 15,
                  onPressed: () {
                    navigateTo(context, LoginScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
