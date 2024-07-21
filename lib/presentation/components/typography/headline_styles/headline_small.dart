part of '../typography_imports.dart';

class HeadlineSmall extends StatelessWidget {
  const HeadlineSmall(
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
        fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize,
        color: color ?? Theme.of(context).textTheme.headlineSmall!.color,
        fontWeight:
            fontWeight ?? Theme.of(context).textTheme.headlineSmall!.fontWeight,
        overflow:
            overflow ?? Theme.of(context).textTheme.headlineSmall!.overflow,
        decoration:
            decoration ?? Theme.of(context).textTheme.headlineSmall!.decoration,
        fontFamily: Theme.of(context).textTheme.headlineSmall!.fontFamily,
      ),
    );
  }
}
