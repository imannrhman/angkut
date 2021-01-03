import 'package:flutter/material.dart';

class PaymentHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Hai John Doe",style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24.0,
            color: Colors.white,
          ),),
          SizedBox(
            height: 30,
          ),
          Text("Kamu telah tiba di tujuan! Segera lakukan pembayaran",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),),
        ],
      ),
    );
  }
}
