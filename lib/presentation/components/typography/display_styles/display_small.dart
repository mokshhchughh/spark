part of '../typography_imports.dart';

class DisplaySmall extends StatelessWidget {
  const DisplaySmall(
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
        fontSize: Theme.of(context).textTheme.displaySmall!.fontSize,
        color: color ?? Theme.of(context).textTheme.displaySmall!.color,
        fontWeight:
            fontWeight ?? Theme.of(context).textTheme.displaySmall!.fontWeight,
        overflow:
            overflow ?? Theme.of(context).textTheme.displaySmall!.overflow,
        decoration:
            decoration ?? Theme.of(context).textTheme.displaySmall!.decoration,
        fontFamily: Theme.of(context).textTheme.displaySmall!.fontFamily,
      ),
    );
  }
}
