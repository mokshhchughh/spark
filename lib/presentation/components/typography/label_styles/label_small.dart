part of '../typography_imports.dart';

class LabelSmall extends StatelessWidget {
  const LabelSmall(
      {super.key,
      required this.title,
      this.color,
      this.fontWeight,
      this.overflow,
      this.textAlign = TextAlign.start,
      this.decoration,
      this.fontSize});

  final String title;
  final Color? color;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final TextAlign textAlign;
  final TextDecoration? decoration;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? Theme.of(context).textTheme.labelSmall!.fontSize,
        color: color ?? Theme.of(context).textTheme.labelSmall!.color,
        fontWeight:
            fontWeight ?? Theme.of(context).textTheme.labelSmall!.fontWeight,
        overflow: overflow ?? Theme.of(context).textTheme.labelSmall!.overflow,
        decoration:
            decoration ?? Theme.of(context).textTheme.labelSmall!.decoration,
        fontFamily: Theme.of(context).textTheme.labelSmall!.fontFamily,
      ),
    );
  }
}
