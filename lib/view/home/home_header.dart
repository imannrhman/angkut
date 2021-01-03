import 'package:angkut/util/route.dart';
import 'package:badges/badges.dart';

import '../../config/config.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Text("Hai, Jhon Doe",style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 24.0,
            ),),
          ),
          Expanded(
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: ThemeColor.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                boxShadow: ThemeShadow.shadow,
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Badge(
                      child: Icon(Icons.notifications,),
                      badgeContent: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text('5',style: TextStyle(fontWeight: FontWeight.w900,color: Colors.white,fontSize: 12),),
                      ),
                      animationType: BadgeAnimationType.slide,
                      showBadge: true,
                      animationDuration: Duration(seconds: 1),
                      shape: BadgeShape.circle,
                    ),
                  ),
                  Positioned.fill(child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.white30,
                        hoverColor: Colors.white30,
                        onTap: (){
                          Navigator.pushNamed(context, Routers.comingSoon);
                        },
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
