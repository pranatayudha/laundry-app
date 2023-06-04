import 'package:flutter/material.dart';

import '../../size_config.dart';
import '../../utils/constants.dart';

class DefaultButtonCustomeColor extends StatelessWidget {
  const DefaultButtonCustomeColor(
      {Key? key, this.text, this.color, this.press, this.textColor})
      : super(key: key);
  final String? text;
  final Color? color;
  final Color? textColor;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          // primary: Colors.white,
          backgroundColor: color,
          side: BorderSide(color: textColor ?? mBlueColor2),
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(20),
            color: textColor ?? mBlueColor2,
          ),
        ),
      ),
    );
  }
}
