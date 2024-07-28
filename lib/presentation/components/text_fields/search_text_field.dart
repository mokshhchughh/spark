part of 'text_fields_imports.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField(
      {super.key,
      this.controller,
      this.hintText,
      this.onTap,
      this.onTapOutSide,
      this.maxLines,
      this.errorText,
      this.prefixIcon,
      this.contentPadding = 16,
      this.borderRadius,
      this.suffixIcon,
      this.readOnly = false,
      this.fillColor,
      this.onChanged,
      this.onEditingComplete,
      this.onFieldSubmitted});

  final TextEditingController? controller;
  final String? hintText;
  final Function()? onTap;
  final Function(PointerDownEvent)? onTapOutSide;
  final int? maxLines;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double contentPadding;
  final double? borderRadius;
  final bool readOnly;
  final Color? fillColor;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      onTap: onTap,
      controller: controller,
      maxLines: maxLines ?? 1,
      textInputAction: TextInputAction.search,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onTapOutside: onTapOutSide ??
          (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        errorText: errorText,
        hintMaxLines: maxLines,
        hintText: hintText,
        contentPadding: EdgeInsets.all(contentPadding),
        hintStyle: const TextStyle(color: Color(0xffc0c0c9)),
        fillColor: fillColor ?? AppColors.grey100,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(borderRadius ?? 18.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(borderRadius ?? 18.r),
        ),
        prefixIcon: Image.asset(
          AppIcons.iconsMinimalisticMagnifer,
          scale: 2.4,
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
