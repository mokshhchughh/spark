part of 'components_imports.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage(
      {super.key,
      required this.imageUrl,
      this.width = 40,
      this.height = 40,
      this.borderRadius = 18,
      this.iconSize = 20,
      this.boxShape});

  final String imageUrl;
  final double width, height, borderRadius, iconSize;
  final BoxShape? boxShape;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        imageBuilder: (context, imageProvider) => Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            shape: boxShape ?? BoxShape.rectangle,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: CircularProgressIndicator.adaptive(),
          ),
        ),
        errorWidget: (context, url, error) => Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(
              Icons.error_outline,
              size: iconSize,
            )),
      ),
    );
  }
}
