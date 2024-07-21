part of '../typography_imports.dart';

class DisplayMedium extends StatelessWidget {
  const DisplayMedium(
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
        fontSize: Theme.of(context).textTheme.displayMedium!.fontSize,
        color: color ?? Theme.of(context).textTheme.displayMedium!.color,
        fontWeight:
            fontWeight ?? Theme.of(context).textTheme.displayMedium!.fontWeight,
        overflow:
            overflow ?? Theme.of(context).textTheme.displayMedium!.overflow,
        decoration:
            decoration ?? Theme.of(context).textTheme.displayMedium!.decoration,
        fontFamily: Theme.of(context).textTheme.displayMedium!.fontFamily,
      ),
    );
  }
}
