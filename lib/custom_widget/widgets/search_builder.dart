import 'package:angkut/config/config.dart';
import 'package:flutter/material.dart';

class SearchBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      height: 65,
      decoration: BoxDecoration(
        boxShadow:ThemeShadow.shadow,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: _width * 0.55,
                child: FlatButton(
                  onPressed: (){

                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.search,color: Colors.white,),
                  ),
                  color: ThemeColor.primaryColor,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Container(
                color: Colors.white,
                height: double.infinity,
                width: _width * 0.68,
                alignment: Alignment.centerLeft,
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    hintText: "Mau kemana hari ini ?",
                    isCollapsed: false,

                    contentPadding: EdgeInsets.all(16.0),
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: ThemeColor.secondaryTextColor,
                    ),
                    isDense: true,
                    alignLabelWithHint: false,
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    focusColor: Colors.white,
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
