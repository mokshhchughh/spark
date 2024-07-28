import 'package:flutter/material.dart';

sealed class AppColors {
  const AppColors._();
  // Product Gradient Colors
  static Gradient goldGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      const Color(0xFFAE734B),
      const Color(0xFFAE7B4B),
      const Color(0xFFB18051).withOpacity(0.93),
      const Color(0xFFB6895E).withOpacity(0.80),
      const Color(0xFFE9DDD2),
      const Color(0xFFAE7B4B),
    ],
  );
  static Gradient silverGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      const Color(0xFFCFCFCF),
      const Color(0xFFCFCFCF),
      const Color(0xFFCFCFCF).withOpacity(0.80),
      const Color(0xFF949494),
      const Color(0xFFCFCFCF),
    ],
  );
  static Gradient yellowGradient = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xFFBBA14F),
      Color(0xFFB59452),
      Color(0xFFBBA14F),
      Color(0xFFE9E3D2),
      Color(0xFFBBA14F),
      Color(0xFFBBA14F),
    ],
  );

  /// Default Colors
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;
  static const Color red = Color(0xFFE00C0C);
  static const Color white = Colors.white;
  static const Color orange = Color(0xffFF8169);

  /// Figma Colors
  static const Color primary = Color(0xFFBB65FF);
  static const Color secondary = Color(0xff00579c);
  static const Color textColor = Color(0xFFF4F4F4);
  static const Color grey = Color(0xffD9D9D9);
  static const Color dividerColor = Color(0xFFA0ABBB);
  static const Color profileBg = Color(0xFFE1D1D1);
  static const Color drawerBg = Color(0xffF9F4F4);
  static const Color secondDividerColor = Color(0xffD8D8D8);
  static const Color darkColor = Color(0xff1E1E28);
  static const Color backgroundColor = Color(0xff242430);
  static const Color darkTextColor = Color(0xff6C6C6C);
  static const Color tabBgColor = Color(0xffF6F6F8);

  // primary
  static const Color primary50 = Color(0xff999999);
  static const Color primary100 = Color(0xff888888);
  static const Color primary200 = Color(0xff777777);
  static const Color primary300 = Color(0xff666666);
  static const Color primary400 = Color(0xff555555);
  static const Color primary500 = Color(0xff444444);
  static const Color primary600 = Color(0xff333333);
  static const Color primary700 = Color(0xff222222);
  static const Color primary800 = Color(0xff111111);
  static const Color primary900 = Color(0xff000000);
  // Grey
  static const Color grey50 = Color(0xffFAFAFA);
  static const Color grey100 = Color(0xffF5F5F5);
  static const Color grey200 = Color(0xffEEEEEE);

  static const Color grey300 = Color(0xffE0E0E0);
  static const Color grey400 = Color(0xffB0B0B0);
  static const Color grey500 = Color(0xffC0C0C9);
  static const Color grey600 = Color(0xff777777);

  // Success
  static const Color success50 = Color(0xffEFFDF6);
  static const Color success100 = Color(0xffD9F9E6);
  static const Color success200 = Color(0xffB8F1D2);
  static const Color success300 = Color(0xff8EE4BA);
  static const Color success400 = Color(0xff6AD09D);
  static const Color success500 = Color(0xff53B483);
  static const Color success600 = Color(0xff2F9461);
  static const Color success700 = Color(0xff2F7657);
  static const Color success800 = Color(0xff255E46);
  static const Color success900 = Color(0xff1E4D3A);
  // warning
  static const Color warning50 = Color(0xffFEFAF5);
  static const Color warning100 = Color(0xffFBF2CB);
  static const Color warning200 = Color(0xffFDE57E);
  static const Color warning300 = Color(0xffFFD16A);
  static const Color warning400 = Color(0xffFBBC55);
  static const Color warning500 = Color(0xffE9A23B);
  static const Color warning600 = Color(0xffC8811A);
  static const Color warning700 = Color(0xffA35C00);
  static const Color warning800 = Color(0xff8B4400);
  static const Color warning900 = Color(0xff78310B);
  // Destructive
  static const Color destructive50 = Color(0xffFEF2F2);
  static const Color destructive100 = Color(0xffFDE9E9);
  static const Color destructive200 = Color(0xffFAC7C7);
  static const Color destructive300 = Color(0xffF7A1A1);
  static const Color destructive400 = Color(0xffF37373);
  static const Color destructive500 = Color(0xffF34141);
  static const Color destructive600 = Color(0xffCD3636);
  static const Color destructive700 = Color(0xffA32E2E);
  static const Color destructive800 = Color(0xff7C2323);
  static const Color destructive900 = Color(0xff601B1B);

  // Alpha Black
  static const Color alphaBlack5 = Color.fromRGBO(47, 43, 67, 0.05);
  static const Color alphaBlack10 = Color.fromRGBO(47, 43, 67, 0.10);
  static const Color alphaBlack20 = Color.fromRGBO(47, 43, 67, 0.20);
  static const Color alphaBlack30 = Color.fromRGBO(47, 43, 67, 0.30);
  static const Color alphaBlack40 = Color.fromRGBO(47, 43, 67, 0.40);
  static const Color alphaBlack50 = Color.fromRGBO(47, 43, 67, 0.50);
  static const Color alphaBlack60 = Color.fromRGBO(47, 43, 67, 0.60);
  static const Color alphaBlack70 = Color.fromRGBO(47, 43, 67, 0.70);
  static const Color alphaBlack80 = Color.fromRGBO(47, 43, 67, 0.80);
  static const Color alphaBlack90 = Color.fromRGBO(47, 43, 67, 0.90);
//   // Alpha White
//   static const Color alphaWhite5 = Color.fromRGBO(255, 255, 255, 0.05);
//   static const Color alphaWhite10 = Color.fromRGBO(255, 255, 255, 0.10);
//   static const Color alphaWhite20 = Color.fromRGBO(255, 255, 255, 0.20);
//   static const Color alphaWhite30 = Color.fromRGBO(255, 255, 255, 0.30);
//   static const Color alphaWhite40 = Color.fromRGBO(255, 255, 255, 0.40);
//   static const Color alphaWhite50 = Color.fromRGBO(255, 255, 255, 0.50);
//   static const Color alphaWhite60 = Color.fromRGBO(255, 255, 255, 0.60);
//   static const Color alphaWhite70 = Color.fromRGBO(255, 255, 255, 0.70);
//   static const Color alphaWhite80 = Color.fromRGBO(255, 255, 255, 0.80);
//   static const Color alphaWhite90 = Color.fromRGBO(255, 255, 255, 0.90);
}
