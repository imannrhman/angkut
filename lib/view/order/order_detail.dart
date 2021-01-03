import 'package:angkut/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/percent_indicator.dart';

class OrderDetail extends StatelessWidget {
  final VoidCallback onTap;

  const OrderDetail({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 30),
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0,bottom: 20.0),
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
        Center(
          child: Text(
            "Profil Sopir Angkot",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18.0,
            ),
          ),
        ),
        Container(
          height: 95,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                child: Image.asset(
                  "assets/images/driver.jpeg",
                  width: 75,fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,/////////////////////////////////////////////////////////
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "D 5521 AR",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Ciwasta - Cijerah ",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Flexible(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "50 Meter",
                    style: TextStyle(
                      color: ThemeColor.primaryColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Rating",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 17.0,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 10),
              child: Text(
                "4,0",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 50.0,
                ),
              ),
            ),
            RatingBar.builder(
              initialRating: 4,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0,),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: ThemeColor.primaryColor,
              ),
              unratedColor: ThemeColor.secondaryColor,
              ignoreGestures: true,
              onRatingUpdate: (rating) {

              },
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Info",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 17.0,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            {
              "ability": "Sikap Sopir",
              "percentage": 88,
            },
            {
              "ability": "Kenyamanan Angkot",
              "percentage": 75,
            },
            {
              "ability": "Sikap Sopir",
              "percentage": 83,
            },
          ]
              .map((e) => Padding(
                    padding: const EdgeInsets.only(bottom: 27.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e["ability"],
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 4,
                                child: LinearPercentIndicator(
                                  lineHeight: 20.0,
                                  percent: (e["percentage"] as int)/100,
                                  progressColor: ThemeColor.primaryColor,
                                  backgroundColor: ThemeColor.secondaryColor,
                                  padding: const EdgeInsets.all(0),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    "${e["percentage"]} %",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 55.0,
          child: FlatButton(
            onPressed: onTap,
            child: Text(
              "Pesan Angkot Ini",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            color: ThemeColor.primaryColor,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(18.0),
            )),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
