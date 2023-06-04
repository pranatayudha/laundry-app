import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app/constants/common.dart';

double statusBarHeight(BuildContext context) =>
    MediaQuery.of(context).padding.top;

final double baseHeaderHeight =
    Device.get().isIphoneX ? (90.h + Common.statusBarHeightDiff) : 90.h;

final double prakarsaHeaderHeight = Device.get().isIphoneX ? 150.h : 130.h;

final double akunHeaderHeight = Device.get().isIphoneX ? 155.h : 140.h;
