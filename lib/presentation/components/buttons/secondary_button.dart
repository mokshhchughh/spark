part of 'buttons_imports.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.title,
    required this.onTap,
    this.width,
    this.height,
    this.color,
    this.titleColor,
    this.icon,
    this.borderRadius,
    this.padding,
    this.isLoading,
  });

  final String title;
  final Function()? onTap;
  final double? width;
  final double? height;
  final Color? color;
  final Color? titleColor;
  final Widget? icon;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        padding: padding,
        minimumSize:
            Size(width ?? MediaQuery.sizeOf(context).width, height ?? 47.h),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
        ),
      ),
      icon: icon,
      label: isLoading == true
          ? const CircularProgressIndicator.adaptive(
              backgroundColor: AppColors.primary,
            )
          : TitleMedium(
              title: title,
              color: titleColor ??
                  Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .apply(color: AppColors.primary)
                      .color),
    );
  }
}
