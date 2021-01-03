import 'package:angkut/util/route.dart';
import 'package:badges/badges.dart';

import '../../config/config.dart';
import 'package:flutter/material.dart';

class ScheduleHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:16.0,bottom: 40),
      child: Container(
        height: 50,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text("Jadwal Angkot",textAlign: TextAlign.center,style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
              ),),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
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
                      height: 50,
                      decoration: BoxDecoration(
                        color: ThemeColor.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        boxShadow: ThemeShadow.shadow,
                      ),
                      child: Icon(Icons.date_range_rounded),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
