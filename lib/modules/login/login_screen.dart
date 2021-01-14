import 'package:ecommerce_app/layout/cubit/cubit.dart';
import 'package:ecommerce_app/layout/home.dart';
import 'package:ecommerce_app/modules/login/cubit/cubit.dart';
import 'package:ecommerce_app/modules/login/cubit/states.dart';
import 'package:ecommerce_app/modules/register/register_screen.dart';
import 'package:ecommerce_app/shared/network/local/shared_prefrences.dart';
import 'package:flutter/cupertino.dart';
import 'package:ecommerce_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/modules/forgot_password/forgot_password_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  String email;
  String password;

  LoginScreen({this.email, this.password});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (email != null && password != null) {
      emailController.text = email;
      passwordController.text = password;
    }
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginStateLoading) {
            buildProgress(context: context, text: 'please watit');
          }

          if (state is LoginStateSuccess) {
            Navigator.pop(context);
            saveToken(state.token).then((value) {
              //ma haza bool?
              if (value) {
                HomeCubit.get(context).changeIndex(0);
                navigateAndFinish(context, HomeScreen());
              } else
                showToast(error: false, text: 'failed');
            });
          }
          if (state is LoginStateError) {
            Navigator.pop(context);

            buildProgress(
              context: context,
              text: 'no account',
              error: true,
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
                            controller: emailController),
                        SizedBox(
                          height: 10,
                        ),
                        DefaultTextForm(
                          title: 'Password',
                          hint: 'enter your Password',
                          type: TextInputType.visiblePassword,
                          controller: passwordController,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Button(
                          text: 'login',
                          borderRadius: 15,
                          onPressed: () {
                            String email = emailController.text;
                            String password = passwordController.text;

                            if (email.isEmpty || password.isEmpty) {
                              showToast(
                                text: 'please enter a valid data',
                                error: true,
                              );
                              return;
                            }

                            LoginCubit.get(context).login(
                              email: email,
                              password: password,
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
