import 'package:angkut/config/config.dart';
import 'package:angkut/view/home/home_header.dart';
import 'package:angkut/view/home/home_nearest_stop.dart';
import 'package:angkut/view/home/home_search.dart';
import 'package:angkut/view/home/home_wallet.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 28,vertical: 32),
          children: [
            HomeHeader(),
            HomeSearch(),
            HomeWallet(),
            HomeNearestStop(),
            SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
