import 'package:angkut/config/config.dart';
import 'package:angkut/util/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstLaunch = prefs?.get(Constant.FIRST_LAUNCH) ?? true;
  bool isLogin = prefs?.get(Constant.LOGIN_PREFERENCE) ?? false;
  runApp(MyApp(
    isLogin: isLogin,
    isFirstLaunch: isFirstLaunch,
  ));
}

class MyApp extends StatelessWidget {
  final bool isLogin;
  final bool isFirstLaunch;

  const MyApp({Key key, this.isLogin, this.isFirstLaunch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.light,
    ));
    return MaterialApp(
      title: Constant.appName,
      initialRoute: isFirstLaunch
          ? Routers.firstPage
          : isLogin
              ? Routers.main
              : Routers.login,
      onGenerateRoute: Routers.generateRoute,

      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        brightness: Brightness.light,
        primaryColorBrightness: Brightness.light,
        accentColorBrightness: Brightness.light,
        cursorColor: ThemeColor.primaryColor,
        primaryColor: ThemeColor.primaryColor,
        accentColor: ThemeColor.primaryColor,
        unselectedWidgetColor: ThemeColor.secondaryTextColor,
        buttonColor: ThemeColor.primaryColor,
        backgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        bottomAppBarColor: Colors.white,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
          overline: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          caption:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w500,),
          button: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
            color: ThemeColor.primaryColor,
          ),
        ),
        primaryColorLight: Colors.white,

        dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        accentIconTheme: IconThemeData(
          color: Colors.white,
        ),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          brightness: Brightness.dark,
          textTheme: TextTheme(
            headline6: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              const Set<MaterialState> interactiveStates = <MaterialState>{
                MaterialState.pressed,
                MaterialState.hovered,
                MaterialState.focused,
              };
              if (states.any(interactiveStates.contains)) {
                return ThemeColor.primaryColor;
              }
              return ThemeColor.primaryColor;
            }),
          ),
        ),
        textSelectionColor: ThemeColor.primaryColor,
        fontFamily: 'Montserrat',
      ),
    );
  }
}
