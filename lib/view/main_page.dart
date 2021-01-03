import 'package:angkut/config/config.dart';
import 'package:angkut/view/schedule/schedule.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home/home.dart';
import 'profile/profile.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _clickedCenterFAB = false;
  int _selectedIndex = 0;

  List<_IconItem> _listItem = [
    _IconItem(text: "Home", icon: Icons.home_rounded),
    _IconItem(text: "Profile", icon: Icons.person),
  ];

  List<Widget> _listPage = [
     HomePage(),
     ProfilePage(),
  ];

  void _updateTabSelection(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          _listPage.elementAt(_selectedIndex),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 250),
              height: _clickedCenterFAB ? height : 0.0,
              width: _clickedCenterFAB ? width : 0.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_clickedCenterFAB ? 0.0 : 300),
                color: Colors.white,
              ),
              child: SchedulePage(
                show: _clickedCenterFAB,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         setState(() {
           _clickedCenterFAB = !_clickedCenterFAB;
         });
        },
        child: Center(
          child:Icon(_clickedCenterFAB ? Icons.close : Icons.date_range,color: Colors.white,),
        ),
        elevation: 2.0,
        isExtended: true,
        hoverElevation: 4.0,
        focusElevation: 3.0,
      ) ,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
       notchMargin: 8.0,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12.0,),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              _listItem.length,
              (index) => ClipOval(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: (){
                      _updateTabSelection(index);
                    },
                    child: Container(
                      width: 60.0,
                      height: 60.0,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            _listItem[index].icon,
                            color: _selectedIndex == index
                                ? ThemeColor.primaryColor
                                : ThemeColor.secondaryTextColor,
                          ),
                          Text(
                            _listItem[index].text,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: _selectedIndex == index
                                  ? FontWeight.w500
                                  : FontWeight.w400,
                              color: _selectedIndex == index
                                  ? ThemeColor.primaryColor
                                  : ThemeColor.secondaryTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _IconItem {
  final IconData icon;
  final String text;

  _IconItem({this.icon, this.text});
}
