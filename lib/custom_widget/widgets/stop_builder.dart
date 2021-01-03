import 'package:angkut/config/config.dart';
import 'package:flutter/material.dart';

class StopBuilder extends StatelessWidget {
  final String text;
  final List data;

  const StopBuilder({Key key, this.text, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: ThemeShadow.shadow,
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: ThemeColor.secondaryTextColor),
          ),
          ListView.builder(
            physics: ScrollPhysics(),
            primary: false,
            padding: EdgeInsets.symmetric(vertical: 16.0),
            itemCount: data.length,
            shrinkWrap: true,
            itemBuilder: (_, index) =>  _Item(
              leading: Icon(
                Icons.directions_car,
                color: ThemeColor.primaryColor,
                size: 35,
              ),
              contentPadding: EdgeInsets.all(0.0),
              title: Text(data[index].route,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14),),
              subtitle: Text(data[index].time,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.grey),),
            ),
          ),
        ],
      ),
    );
  }
}


class _Item extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget subtitle;
  final EdgeInsets contentPadding;

  const _Item({Key key, this.leading, this.title, this.subtitle, this.contentPadding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.all(8.0),
      padding: contentPadding,
      child: Row(
        children: [
          Expanded(child: leading),
          Expanded(
            flex: 3,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(flex: 2,child: Align(alignment: Alignment.centerLeft,child: title)),
                  Expanded(flex: 1,child: subtitle)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
