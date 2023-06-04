import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';

class RowInfo extends StatelessWidget {
  final String title;
  final String value;
  final TextAlign textAlign;
  const RowInfo(
      {Key? key,
      required this.title,
      required this.value,
      required this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: mTitleStyle16,
                ),
                Text(
                  ':',
                  style: mTitleStyle16,
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                value,
                style: mTitleStyle16,
                textAlign: textAlign,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
