import 'package:angkut/config/config.dart';
import 'package:angkut/custom_widget/widgets/text_form_field.dart';
import 'package:angkut/util/route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          padding: const EdgeInsets.all(28.0),
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom:62.0,top: 32),
              child: Center(child: Text("Daftar",style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700
              ),)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:32.0),
              child: TextFormFiledCustom(
                hintText: "Nama",
                keyboardType: TextInputType.name,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:32.0),
              child: TextFormFiledCustom(
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:32.0),
              child: TextFormFiledCustom(
                hintText: "No. Telepon",
                keyboardType: TextInputType.phone,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:32.0),
              child: TextFormFiledCustom(
                hintText: "Password",
                isPassword: true,
                keyboardType: TextInputType.visiblePassword,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom:62.0),
              child: TextFormFiledCustom(
                hintText: "Konfirmasi Password",
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
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, Routers.main, (route) => false);
                    },
                    child: Text("Daftar",style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),),
                    textColor: Colors.white,
                    color: ThemeColor.primaryColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:32.0),
              child: Center(
                child: RichText(text: TextSpan(
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black
                    ),
                    children: [
                      TextSpan(
                        text: "Sudah punya akun ? ",
                      ),
                      TextSpan(
                        text: "Klik Disini",
                        style: TextStyle(
                          color: ThemeColor.primaryColor,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {
                            Navigator.pushReplacementNamed(context, Routers.firstPage);
                        },
                      ),
                    ]
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
