part of 'home_imports.dart';

class HomeViewModel {
  PageController pageController = PageController();
  Timer? _timer;

  void startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
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
