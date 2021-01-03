import 'package:angkut/config/config.dart';
import 'package:angkut/util/route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int _current = 0;

  List<_Item> _item = [
    _Item(
        imageAsset: "onboarding_1.png",
        text: "Jadikan perjalananmu lancar tanpa adanya hambatan"),
    _Item(
        imageAsset: "onboarding_2.png",
        text:
            "Tidak perlu lagi menunggu lama, sang sopir akan menemukan lokasimu dengan mudah"),
    _Item(imageAsset: "onboarding_3.png", text: "Jalankan Aplikasi Sekarang !"),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: ThemeColor.primaryColor,
        body: Column(children: [
          Flexible(
            child: CarouselSlider(
              items: List.generate(
                  _item.length,
                  (index) => index != 2
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/${_item[index].imageAsset}",
                              width: 220,
                              height: 220,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30.0),
                              child: Text(
                                _item[index].text,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/${_item[index].imageAsset}",
                              width: 220,
                              height: 220,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30.0),
                              child: Text(
                                _item[index].text,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Container(
                              width: 150,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                boxShadow: ThemeShadow.shadow,
                              ),
                              child: FlatButton(
                                onPressed: () async{
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setBool(Constant.FIRST_LAUNCH, false);
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, Routers.login, (route) => false);
                                },
                                child: Text(
                                  "MULAI",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                textColor: ThemeColor.primaryColor,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )),
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  pageSnapping: true,
                  pauseAutoPlayOnTouch: true,
                  height: 900,
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  autoPlayInterval: Duration(seconds: 5),
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom:40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _item.map((e) {
                int index = _item.indexOf(e);
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                  ),
                );
              }).toList(),
            ),
          ),
        ]),
      ),
    );
  }
}

class _Item {
  final String imageAsset;
  final String text;

  _Item({this.imageAsset, this.text});
}
