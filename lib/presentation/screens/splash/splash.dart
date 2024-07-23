part of 'splash_imports.dart';

@RoutePage()
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  User? _user;
  @override
  void initState() {
    _checkUserStatus();
    super.initState();
  }

  void _checkUserStatus() async {
    await Future.delayed(const Duration(seconds: 2), () {
      FirebaseAuth auth = FirebaseAuth.instance;
      setState(() {
        _user = auth.currentUser;
      });
      if (_user == null) {
        AutoRouter.of(context).push(const OnboardRoute());
      } else {
        AutoRouter.of(context).push(const DashboardRoute());
      }
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
