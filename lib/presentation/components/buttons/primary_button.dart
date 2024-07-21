part of 'buttons_imports.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    required this.onTap,
    this.width,
    this.height,
    this.color,
    this.titleColor,
    this.icon,
  });

  final String title;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final Color? color;
  final Color? titleColor;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppColors.primary,
        minimumSize:
            Size(width ?? MediaQuery.sizeOf(context).width, height ?? 44.h),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      icon: icon,
      label: TitleMedium(
          title: title,
          color: titleColor ??
              Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .apply(color: AppColors.white)
                  .color),
    );
  }
}
