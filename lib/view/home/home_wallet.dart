import 'package:angkut/config/config.dart';
import 'package:angkut/util/route.dart';
import 'package:flutter/material.dart';

class HomeWallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.symmetric(vertical: 32),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          boxShadow: ThemeShadow.shadow,
          color: ThemeColor.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.white30,
                    hoverColor: Colors.white30,
                    onTap: (){
                      Navigator.pushNamed(context, Routers.comingSoon);
                    },
                    child: Container(
                      width: 50,
                      height: 22,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      alignment: Alignment.center,
                      child: Text(
                        "Top Up",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: Icon(
                Icons.account_balance_wallet,
                color: Colors.white,
                size: 50,
              )),
              Expanded(
                  flex: 3,
                  child: Text(
                    "Rp. 100.000,00",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
