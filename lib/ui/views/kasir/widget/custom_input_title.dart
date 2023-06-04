import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';

class CustomInputTitle extends StatelessWidget {
  final String? title;
  final bool? isMandatory;
  final Widget inputWidget;
  const CustomInputTitle(
      {Key? key, this.title, this.isMandatory, required this.inputWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: title,
              style: mTitle2,
              children: [
                if (isMandatory ?? false)
                  TextSpan(
                    text: ' *',
                    style: mTitleStyleColorRed,
                  ),
              ],
            ),
          ),
          inputWidget
        ],
      ),
    );
  }
}
