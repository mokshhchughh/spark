part of 'utils_imports.dart';

sealed class Utils {
  Utils._();

  // static Future launchURL({required String url}) async {
  //   if (!url.toString().startsWith("https")) {
  //     url = "https://$url";
  //   }
  //   await launchUrl(Uri.parse(url));
  // }
  static copyToClipBoard(String text, context) {
    Clipboard.setData(ClipboardData(text: text)).then(
      (value) => VxToast.show(context, msg: "$text copied"),
    );
  }
}
