import 'package:angkut/config/config.dart';
import 'package:flutter/material.dart';

class TextFormFiledCustom extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextInputType keyboardType;

  const TextFormFiledCustom({Key key, this.hintText, this.isPassword =false, this.keyboardType}) : super(key: key);

  @override
  _TextFormFiledCustomState createState() => _TextFormFiledCustomState();
}

class _TextFormFiledCustomState extends State<TextFormFiledCustom> {
  bool _show = true;

  void _showPassword() {
    setState(() {
      _show = !_show;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      decoration: BoxDecoration(
        boxShadow:ThemeShadow.shadow,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Container(
          color: Colors.white,
          height: double.infinity,
          alignment: Alignment.centerLeft,
          child: TextFormField(
            textAlignVertical: TextAlignVertical.center,
            keyboardType: widget.keyboardType,
            obscureText: widget.isPassword ? _show : false,
            decoration: InputDecoration(
              hintText: widget.hintText,
              isCollapsed: false,
              contentPadding: EdgeInsets.all(16.0),
              hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                color: ThemeColor.secondaryTextColor,
              ),
              suffixIcon: widget.isPassword ? IconButton(
                icon: Icon(_show ? Icons.visibility : Icons.visibility_off),
                color: ThemeColor.secondaryTextColor,
                onPressed: _showPassword,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ) : null,
              isDense: true,
              alignLabelWithHint: false,
              border: InputBorder.none,
              fillColor: Colors.white,
              focusColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}


