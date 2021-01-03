import 'package:angkut/config/config.dart';
import 'package:angkut/custom_widget/custom_widget.dart';
import 'package:angkut/view/schedule/schedule_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SchedulePage extends StatelessWidget {
  final bool show;


  const SchedulePage({Key key, this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List data = Constant.listStops;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
          children: [
            show ? ScheduleHeader() : Container(),
            show ? StopBuilder(
              text: "Halte A",
              data: data,
            ) : Container(),
            show ? StopBuilder(
              text: "Halte B",
              data: data,
            ) : Container(),
          ],
        ),
      ),
    );
  }
}
