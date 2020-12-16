import 'package:ecommerce_app/layout/home.dart';
import 'package:ecommerce_app/modules/login/cubit/cubit.dart';
import 'package:ecommerce_app/modules/login/cubit/states.dart';
import 'package:ecommerce_app/modules/register/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:ecommerce_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/modules/forgot_password/forgot_password_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer(
        listener: (context, state) {
          if (state is LoginStateLoading) {
            buildProgress(context: context, text: 'please watit');
          }
          if (state is LoginStateSuccess) {
            navigateAndFinish(
              context,
              HomeScreen(),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Logo(),
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                        ),
                        DefaultTextForm(
                            title: 'Email',
                            hint: 'enter your email',
                            type: TextInputType.emailAddress,
                            controller: null),
                        SizedBox(
                          height: 10,
                        ),
                        DefaultTextForm(
                          title: 'Password',
                          hint: 'enter your Password',
                          type: TextInputType.visiblePassword,
                          controller: null,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Button(
                          text: 'login',
                          borderRadius: 15,
                          onPressed: () {
                            LoginCubit.get(context).login(
                              email: emailController,
                              password: passwordController,
                            );
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Button(
                          text: 'rigster',
                          borderRadius: 15,
                          onPressed: () {
                            navigateTo(context, RegisterScreen());
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            navigateTo(context, ForgotPassword());
                          },
                          child: captionText('forgot your password?'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
