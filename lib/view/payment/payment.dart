import 'package:angkut/config/config.dart';
import 'package:angkut/view/payment/peyment_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'payment_content.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: ThemeColor.primaryColor,
          statusBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
          backgroundColor: ThemeColor.primaryColor,
          body: Column(
            children: [
              Expanded(
                flex: 4,
                child: PaymentHeader(),
              ),
              Expanded(
                flex: 7,
                child: PaymentContent(),
              ),
            ],
          ),
        ));
  }
}
