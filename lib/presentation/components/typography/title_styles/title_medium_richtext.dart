part of '../typography_imports.dart';

class TitleMediumRichText extends StatelessWidget {
  final String title;

  const TitleMediumRichText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    List<TextSpan> spans = [];

    // Split the title into words
    title.split(' ').forEach((word) {
      if (word.contains('#')) {
        // If the word contains '#', make it bold
        spans.add(
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () => {},
            text: "$word ",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        );
      } else {
        // Otherwise, display it normally
        spans.add(TextSpan(text: "$word "));
      }
    });

    return RichText(
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(), // Default title style
        children: spans,
      ),
    );
  }
}
