part of 'components_imports.dart';

class AppRichText extends StatelessWidget {
  const AppRichText(
      {super.key,
      required this.mainText,
      this.color,
      this.fontWeight,
      this.decoration,
      this.onTap,
      this.firstText,
      this.secondText,
      this.thirdText,
      this.mainTextStyle,
      this.firstTextStyle,
      this.secondTextStyle,
      this.fontSize,
      this.textAlign = TextAlign.start,
      this.fourthText,
      this.thirdTextStyle,
      this.fourthTextStyle});

  final String mainText;
  final String? firstText;
  final String? secondText;
  final String? thirdText;
  final String? fourthText;
  final Color? color;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final Function()? onTap;
  final TextStyle? mainTextStyle;
  final TextStyle? firstTextStyle;
  final TextStyle? secondTextStyle;
  final TextStyle? thirdTextStyle;
  final TextStyle? fourthTextStyle;
  final double? fontSize;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        text: mainText,
        children: [
          TextSpan(
            text: firstText,
            recognizer: TapGestureRecognizer()..onTap = onTap,
            style: firstTextStyle ??
                Theme.of(context).textTheme.bodySmall!.copyWith(
                      decoration: TextDecoration.underline,
                    ),
          ),
          TextSpan(
            text: secondText,
            recognizer: TapGestureRecognizer()..onTap = onTap,
            style: secondTextStyle ??
                Theme.of(context).textTheme.bodySmall!.copyWith(
                      decoration: TextDecoration.underline,
                    ),
          ),
          TextSpan(
            text: thirdText,
            style: thirdTextStyle ??
                Theme.of(context).textTheme.bodySmall!.copyWith(
                      decoration: TextDecoration.underline,
                    ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
          TextSpan(
            text: fourthText,
            style: fourthTextStyle ??
                Theme.of(context).textTheme.bodySmall!.copyWith(
                      decoration: TextDecoration.underline,
                    ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
        style: mainTextStyle ??
            TextStyle(
              fontFamily: Theme.of(context).textTheme.bodySmall!.fontFamily,
              fontSize:
                  fontSize ?? Theme.of(context).textTheme.bodySmall!.fontSize,
              color: color ?? Theme.of(context).textTheme.bodySmall!.color,
              fontWeight: fontWeight ??
                  Theme.of(context).textTheme.bodySmall!.fontWeight,
              decoration: decoration ??
                  Theme.of(context).textTheme.bodySmall!.decoration,
            ),
      ),
    );
  }
}
