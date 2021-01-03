import 'package:angkut/config/config.dart';
import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';

class CalculateOrder extends StatelessWidget {
  final VoidCallback onTap;

  const CalculateOrder({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.only(top:20.0),
          child: Center(
            child: Container(
              width: 35,
              height: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Colors.grey,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 28),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.directions_run,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey,
                      size: 15,
                    ),
                    Icon(Icons.directions_car, color: Colors.grey),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Cipatik-Tg Lega",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Text(
                  "10 m",
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        Divider(
          thickness: 1,
          height: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.directions_run,
                    color: ThemeColor.primaryColor,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Jalan kaki 10 meter",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Container(
                width: 23,
                height: 50.0,
                margin: EdgeInsets.symmetric(vertical: 4),
                alignment: Alignment.center,
                child: FDottedLine(
                  color: Colors.grey,
                  height: 50.0,
                  strokeWidth: 2.0,
                  dottedLength: 5.0,
                  space: 2.0,
                  corner: FDottedLineCorner.all(6.0),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.directions_car,
                    color: ThemeColor.primaryColor,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cipatik-Tg. Lega",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "2 km",
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    ],
                  ),
                  Flexible(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 35,
                        width: 86,
                        child: FlatButton(
                          onPressed: onTap,
                          child: Text("Telusuri",style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),),
                          color: ThemeColor.primaryColor,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
