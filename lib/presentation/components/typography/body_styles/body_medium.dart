part of '../typography_imports.dart';

class BodyMedium extends StatelessWidget {
  const BodyMedium(
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
        fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
        color: color ?? Theme.of(context).textTheme.bodyMedium!.color,
        fontWeight:
            fontWeight ?? Theme.of(context).textTheme.bodyMedium!.fontWeight,
        overflow: overflow ?? Theme.of(context).textTheme.bodyMedium!.overflow,
        decoration:
            decoration ?? Theme.of(context).textTheme.bodyMedium!.decoration,
        fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
      ),
    );
  }
}
