part of '../typography_imports.dart';

class BodyLarge extends StatelessWidget {
  const BodyLarge(
      {super.key,
      required this.title,
      this.color,
      this.fontWeight,
      this.overflow,
      this.textAlign = TextAlign.start,
      this.decoration});

  final String title;
  final Color? color;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final TextAlign textAlign;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
        color: color ?? Theme.of(context).textTheme.bodyLarge!.color,
        fontWeight:
            fontWeight ?? Theme.of(context).textTheme.bodyLarge!.fontWeight,
        overflow: overflow ?? Theme.of(context).textTheme.bodyLarge!.overflow,
        decoration:
            decoration ?? Theme.of(context).textTheme.bodyLarge!.decoration,
        fontFamily: Theme.of(context).textTheme.bodyLarge!.fontFamily,
      ),
    );
  }
}
