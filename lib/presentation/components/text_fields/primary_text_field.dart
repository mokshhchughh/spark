part of 'text_fields_imports.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField(
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
      this.onFieldSubmitted,
      this.autofocus = false,
      this.maxLength,
      this.icon,
      this.focusNode,
      this.keyboardType,
      this.labelText});

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
  final bool autofocus;
  final int? maxLength;
  final Widget? icon;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      readOnly: readOnly,
      focusNode: focusNode,
      onTap: onTap,
      keyboardType: keyboardType,
      controller: controller,
      maxLines: maxLines,
      maxLength: maxLength,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onTapOutside: onTapOutSide ??
          (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        errorText: errorText,
        hintText: hintText,
        icon: icon,
        labelText: labelText,
        hintMaxLines: maxLines,
        contentPadding: EdgeInsets.all(contentPadding),
        hintStyle: const TextStyle(color: Color(0xffc0c0c9)),
        fillColor: fillColor ?? AppColors.transparent,
        filled: true,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(18.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(18.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(18.r),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
