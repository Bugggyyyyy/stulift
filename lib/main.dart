import 'package:flutter/material.dart';
import 'package:flutter_application_1/accept.dart';
import 'package:flutter_application_1/forgot.dart';
import 'package:flutter_application_1/form.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/manage.dart';
import 'package:flutter_application_1/otp.dart';
import 'package:flutter_application_1/password.dart';
import 'package:flutter_application_1/hiker.dart';
import 'package:flutter_application_1/request.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context) => const MyLogin(),
      
      'homepage': (context) =>  const MyHome(),
      'password': (context) => const MyPassword(),
      'forgot': (context) => const MyForgot(),
      'otp': (context) => const MyOtp(),
      'MyScreen': (context) => const MyScreen(),
      'form': (context) => const MyApp(),
      
      'request': (context) => const MyRequest(),
      'manage': (context) => const MyManage(),
      'accept': (context) => const MyAccepts(),
    },
  ));
}
