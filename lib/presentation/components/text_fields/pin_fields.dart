part of 'text_fields_imports.dart';

class PinFields extends StatelessWidget {
  final Color? backgroundColor;

  const PinFields(
      {super.key,
      this.bottomText,
      this.backgroundColor,
      required this.onChanged,
      required this.onCompleted,
      this.onTap,
      this.controller,
      this.length = 6,
      this.height,
      this.width,
      this.shape,
      this.autofocus = false,
      this.obscureText = false,
      this.obscuringWidget,
      this.isError = false,
      this.borderRadius});

  final String? bottomText;
  final Function(String) onChanged;
  final Function(String) onCompleted;
  final Function? onTap;
  final TextEditingController? controller;
  final int length;
  final double? height;
  final double? width;
  final PinCodeFieldShape? shape;
  final bool autofocus;
  final bool obscureText;
  final Widget? obscuringWidget;
  final bool? isError;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: length,
      obscureText: obscureText,
      autoFocus: autofocus,
      animationType: AnimationType.fade,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      errorTextMargin: EdgeInsets.zero,
      errorTextSpace: 0,
      obscuringWidget: obscuringWidget,
      showCursor: false,
      keyboardType: TextInputType.number,
      controller: controller,
      enablePinAutofill: true,
      textStyle: TextStyle(
          color: isError == true ? AppColors.destructive600 : AppColors.black,
          fontWeight: FontWeight.bold),
      pinTheme: PinTheme(
        fieldOuterPadding: EdgeInsets.symmetric(horizontal: 5.h),
        shape: shape ?? PinCodeFieldShape.box,
        borderRadius: shape != null
            ? BorderRadius.zero
            : BorderRadius.circular(borderRadius ?? 0.r),
        fieldHeight: height ?? 50,
        fieldWidth: width ?? 46,
        activeFillColor: Colors.white,
        activeColor:
            isError == true ? AppColors.destructive600 : AppColors.primary,
        selectedColor: backgroundColor ?? AppColors.primary,
        selectedFillColor: backgroundColor ?? Colors.transparent,
        inactiveColor: AppColors.grey500,
        inactiveFillColor: Colors.transparent,
        borderWidth: 1,
      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      // errorAnimationController: errorController,
      // controller: textEditingController,
      onCompleted: onCompleted,
      onChanged: onChanged,
      onTap: onTap,
      beforeTextPaste: (text) {
        if (kDebugMode) {
          print("Allowing to paste $text");
        }
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
    );
  }
}
