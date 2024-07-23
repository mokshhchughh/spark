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
    this.borderRadius,
    this.padding,
    this.isLoading,
  });

  final String title;
  final VoidCallback onTap;
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
    return ElevatedButton.icon(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: padding,
        backgroundColor: color ?? AppColors.primary,
        minimumSize:
            Size(width ?? MediaQuery.sizeOf(context).width, height ?? 44.h),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
        ),
      ),
      icon: icon,
      label: isLoading == true
          ? const CircularProgressIndicator.adaptive(
              backgroundColor: AppColors.white,
            )
          : TitleMedium(
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
