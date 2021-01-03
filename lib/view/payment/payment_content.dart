import 'package:angkut/config/config.dart';
import 'package:angkut/util/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentContent extends StatefulWidget {
  @override
  _PaymentContentState createState() => _PaymentContentState();
}

class _PaymentContentState extends State<PaymentContent> {
  int selectedNumber = -1;

  final List<_Item> _list = [
    _Item(text: "5.0000 Rupiah", value: 0),
    _Item(text: "10.0000 Rupiah", value: 1),
    _Item(text: "15.0000 Rupiah", value: 2),
    _Item(text: "20.0000 Rupiah", value: 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: ThemeShadow.shadow,
        borderRadius: BorderRadius.vertical(top:Radius.circular(20)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          Center(child: Container(
            width: 78,
            height: 2,
            color: Colors.grey[300],
          )),
          ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 20),
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: _list.length,
              itemBuilder: (context, index) {
                return PaymentItem(
                  groupValue: selectedNumber,
                  value: _list[index].value,
                  label: _list[index].text,
                  onChanged: (val) {
                    setState(() {
                      selectedNumber = val;
                    });
                  },
                );
              }),
          Padding(
            padding: const EdgeInsets.only(top: 15,bottom: 20),
            child: Container(
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: ThemeShadow.shadow,
              ),
              child: FlatButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, Routers.main, (route) => false);
                },
                child: Text("Bayar",style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                color: ThemeColor.primaryColor,
                textColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentItem extends StatelessWidget {
  final String label;
  final int groupValue;
  final int value;
  final ValueChanged onChanged;

  const PaymentItem(
      {Key key, this.label, this.groupValue, this.value, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              if (value != groupValue) {
                onChanged(value);
              } else {
                onChanged(-1);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: value == groupValue
                        ? ThemeColor.primaryColor
                        : Color(0xFFEAEAEA),
                    width: 1),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              padding: EdgeInsets.symmetric(vertical: 20,horizontal: 16),
              child: Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Item {
  final String text;
  final int value;

  _Item({this.text, this.value});
}
