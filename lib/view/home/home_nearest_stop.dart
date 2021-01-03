import 'package:angkut/config/config.dart';
import 'package:angkut/custom_widget/custom_widget.dart';
import 'package:flutter/material.dart';

class HomeNearestStop extends StatelessWidget {
  final List data = Constant.listStops;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Halte Terdekat",
            style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: ThemeColor.secondaryTextColor),
          ),
         StopBuilder(
           text: "Halte A",
           data: data,
         ),
        ],
      ),
    );
  }
}
