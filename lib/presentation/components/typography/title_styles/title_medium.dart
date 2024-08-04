part of '../typography_imports.dart';

class TitleMedium extends StatelessWidget {
  const TitleMedium(
      {super.key,
      required this.title,
      this.color,
      this.fontWeight,
      this.overflow,
      this.textAlign = TextAlign.start,
      this.decoration,
      this.maxLines,
      this.fontSize});

  final String title;
  final Color? color;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final TextAlign textAlign;
  final TextDecoration? decoration;
  final int? maxLines;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? Theme.of(context).textTheme.titleMedium!.fontSize,
        color: color ?? Theme.of(context).textTheme.titleMedium!.color,
        fontWeight:
            fontWeight ?? Theme.of(context).textTheme.titleMedium!.fontWeight,
        overflow: overflow ?? Theme.of(context).textTheme.titleMedium!.overflow,
        decoration:
            decoration ?? Theme.of(context).textTheme.titleMedium!.decoration,
        fontFamily: Theme.of(context).textTheme.titleMedium!.fontFamily,
      ),
    );
  }
}
