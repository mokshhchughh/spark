part of 'onboard_imports.dart';

class OnboardViewModel {
  PageController pageController = PageController();
  Timer? _timer;

  void startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (pageController.page!.round() == 2) {
        pageController.jumpToPage(0);
      } else {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });
  }
}
