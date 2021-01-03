import 'package:angkut/config/config.dart';
import 'package:angkut/custom_widget/widgets/text_form_field.dart';
import 'package:angkut/util/route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom:62.0),
                child: Center(child: Text("Login",style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700
                ),)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:32.0),
                child: TextFormFiledCustom(
                  hintText: "Username",
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:62.0),
                child: TextFormFiledCustom(
                  hintText: "Password",
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:32.0),
                child: Container(
                  width: double.infinity,
                  height: 58,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    boxShadow: ThemeShadow.shadowForm,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    child: FlatButton(
                      onPressed: () async{
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setBool(Constant.LOGIN_PREFERENCE, true);
                        Navigator.pushNamedAndRemoveUntil(context, Routers.main, (route) => false);
                      },
                      child: Text("Login",style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                      ),),
                      textColor: Colors.white,
                      color: ThemeColor.primaryColor,
                    ),
                  ),
                ),
              ),
              RichText(text: TextSpan(
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black
                ),
                children: [
                  TextSpan(
                    text: "Belum punya akun ? ",
                  ),
                  TextSpan(
                    text: "Klik Disini",
                    style: TextStyle(
                      color: ThemeColor.primaryColor,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {
                        Navigator.pushReplacementNamed(context, Routers.register);
                    },
                  ),
                ]
              )),
            ],
          ),
        ),
      ),
    );
  }
}
