import 'package:angkut/config/config.dart';
import 'package:angkut/util/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<_ProfileItem> _listItem;

  @override
  void initState() {
    super.initState();
    _listItem = [
      _ProfileItem(Icons.account_balance_wallet_rounded, "Saldo Saya", () {
        Navigator.pushNamed(context, Routers.comingSoon);
      }),
      _ProfileItem(Icons.settings, "Setting", () {
        Navigator.pushNamed(context, Routers.comingSoon);
      }),
      _ProfileItem(Icons.info, "About", () {
        showAboutDialog(context: context,
        applicationLegalese: "Kelompok 2 MSTR",
        applicationVersion: "0.0.1",
        applicationIcon: Image.asset("assets/images/ic_launcher_round.png",height: 50,width: 50,),
        applicationName: Constant.appName,
        );
      }),
      _ProfileItem(Icons.logout, "Log out", () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            contentPadding: EdgeInsets.all(30),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Sudah Yakin dengan pilihan anda ?",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child:  Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: ThemeShadow.shadow,
                          ),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Tidak",style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            color: ThemeColor.secondaryTextColor,
                            textColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child:  Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: ThemeShadow.shadow,
                          ),
                          child: FlatButton(
                            onPressed: () async{
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              prefs.setBool(Constant.LOGIN_PREFERENCE,false);
                              Navigator.pushNamedAndRemoveUntil(context, Routers.login, (route) => false);
                            },
                            child: Text("Ya",style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            color: ThemeColor.primaryColor,
                            textColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: ThemeColor.primaryColor,
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 130,
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Center(
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(45)),
                              child: Image.asset(
                                "assets/images/profile.jpeg",
                                fit: BoxFit.cover,
                                width: 130,
                                height: 130,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                color: Colors.white,
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        "Jhon Doe",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40.0),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 70.0, left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: _listItem
                        .map((e) => ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
                              child: Material(
                                child: InkWell(
                                  onTap: e.onTap,
                                  child: ListTile(
                                    leading: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        color: ThemeColor.secondaryColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                      ),
                                      child: Icon(
                                        e.icon,
                                        size: 20,
                                        color: ThemeColor.primaryColor,
                                      ),
                                    ),
                                    title: Text(
                                      e.text,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.0),
                                    ),
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
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

class _ProfileItem {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  _ProfileItem(this.icon, this.text, this.onTap);
}
