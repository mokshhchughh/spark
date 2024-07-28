part of 'widget_imports.dart';

class DetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DetailsAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      centerTitle: false,
      elevation: 8,
      shape: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xffCBCBCB),
        ),
        borderRadius: BorderRadius.zero,
      ),
      title: TitleMedium(
        title: title,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
