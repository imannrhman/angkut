import 'package:angkut/view/coming_soon.dart';
import 'package:angkut/view/login/login.dart';
import 'package:angkut/view/main_page.dart';
import 'package:angkut/view/onboarding/onboarding.dart';
import 'package:angkut/view/order/order.dart';
import 'package:angkut/view/payment/payment.dart';
import 'package:angkut/view/register/register.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Routers{
  static const String main = 'main';
  static const String schedule = 'schedule';
  static const String order = 'order';
  static const String login = 'login';
  static const String firstPage = 'on-boarding';
  static const String register = 'register';
  static const String payment = 'payment';
  static const String comingSoon = 'coming-soon';


  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case main:
        return MaterialPageRoute(builder: (_)=>MainPage());
      case firstPage:
        return MaterialPageRoute(builder: (_)=>OnBoardingPage());
      case register:
        return MaterialPageRoute(builder: (_)=>RegisterPage());
      case order:
        return MaterialPageRoute(builder: (_)=>MapPage());
      case login:
        return MaterialPageRoute(builder: (_)=>LoginPage());
      case payment:
        return MaterialPageRoute(builder: (_)=>PaymentPage());
      case comingSoon:
        return MaterialPageRoute(builder: (_)=>ComingSoon());
     default:
       return MaterialPageRoute(builder: (_) => Scaffold(
         body: Center(
           child: Text('Page Not Found'),
         ),
       ));
    }
  }

}