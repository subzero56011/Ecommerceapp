import 'package:ecommerce_app/modules/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:ecommerce_app/modules/forgot_password/forgot_password_screen.dart';

class RegisterScreen extends StatelessWidget {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                controller: firstName,
                type: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 20.0,
              ),
              DefaultTextForm(
                title: 'Last name',
                hint: 'Smith',
                controller: lastName,
                type: TextInputType.emailAddress,
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
              Button(
                text: 'Register',
                borderRadius: 15,
                onPressed: () {
                  print(firstName);
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
        ),
      ),
    );
  }
}
