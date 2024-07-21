import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

sealed class AppSizes {
  const AppSizes._();

  static double height = 24.h;

  // Vertical Spaces
  static Widget verticalSpace = 16.verticalSpace;
  static Widget gap2Space = 2.verticalSpace;
  static Widget gap4Space = 4.verticalSpace;
  static Widget gap8Space = 8.verticalSpace;
  static Widget gap12Space = 12.verticalSpace;
  static Widget gap24Space = 24.verticalSpace;
  static Widget gap28Space = 28.verticalSpace;
  static Widget gap32Space = 32.verticalSpace;
  static Widget gap48Space = 48.verticalSpace;
  static Widget gap52Space = 52.verticalSpace;

  // Horizontal Spaces
  static Widget horizontalSpace = 16.horizontalSpace;
  static Widget gapH2Space = 2.horizontalSpace;
  static Widget gapH4Space = 4.horizontalSpace;
  static Widget gapH8Space = 8.horizontalSpace;
  static Widget gapH10Space = 10.horizontalSpace;
  static Widget gapH12Space = 12.horizontalSpace;
  static Widget gapH24Space = 24.horizontalSpace;
  static Widget gapH28Space = 28.horizontalSpace;
  static Widget gapH32Space = 32.horizontalSpace;
  static Widget gapH48Space = 48.horizontalSpace;
  static Widget gapH52Space = 52.horizontalSpace;
}
