part of 'splash_imports.dart';

@RoutePage()
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    moveToAuth();
    super.initState();
  }

  moveToAuth() async {
    await Future.delayed(const Duration(seconds: 2), () {
      AutoRouter.of(context).popAndPush(const OnboardRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadedScaleAnimation(
          child: const FlutterLogo(
            size: 200,
          ),
        ),
      ),
    );
  }
}
