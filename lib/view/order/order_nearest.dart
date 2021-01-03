import 'package:angkut/config/config.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class OrderNearest extends StatelessWidget {
  final VoidCallback onTap;

  const OrderNearest({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(30),
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom:30.0),
          child: Text(
            "Angkot Terdekat",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        Column(
          children: [
            {
              "color": ThemeColor.primaryColor,
              "no_plate": "D 2347 BE",
              "passenger": 7,
            },
            {
              "color": Colors.redAccent,
              "no_plate": "D 2347 BE",
              "passenger": 10,
            },
          ]
              .map(
                (e) => ListTile(
              leading: Icon(
                Icons.directions_car,
                color: e["color"],
              ),
              title: Text(
                e["no_plate"],
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: (e["passenger"] as int) < 10
                      ? Colors.black
                      : ThemeColor.secondaryTextColor,
                ),
              ),
              contentPadding: EdgeInsets.all(0),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: LinearPercentIndicator(
                      width: 115.0,
                      lineHeight: 6.0,
                      percent: (e["passenger"] as int)/10,
                      progressColor:  (e["passenger"] as int) < 10 ?  ThemeColor.primaryColor:Colors.red,
                      padding: const EdgeInsets.all(0),
                    ),
                  ),

                  Text(   (e["passenger"] as int) < 10 ? "${e["passenger"]}/10 Terisi" : "Terisi Penuh",style: TextStyle(
                      fontSize: 12,
                      color: ThemeColor.secondaryTextColor
                  ),),
                ],
              ),
              trailing:  (e["passenger"] as int) < 10 ? Container(
                height: 35,
                width: 80,
                child: FlatButton(
                  onPressed: onTap,
                  child: Text("Pesan"),
                  color: ThemeColor.primaryColor,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10),)
                  ),
                ),
              ) : null,
              isThreeLine: true,
            ),
          )
              .toList(),
        ),
      ],
    );
  }
}
