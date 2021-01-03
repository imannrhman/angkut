import 'package:angkut/config/config.dart';
import 'package:flutter/material.dart';
import '../../util/route.dart';

class HomeSearch extends StatefulWidget {
  @override
  _HomeSearchState createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top:16.0,bottom: 26),
          child: Text("Apakah kamu akan pergi hari ini ? ",style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
            color: ThemeColor.secondaryTextColor,

          ),),
        ),
        Container(
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
                          Navigator.pushNamed(context, Routers.order);
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
        ),
      ],
    );
  }
}
