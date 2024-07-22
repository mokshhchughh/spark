// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:career_growth/presentation/screens/auth/auth_imports.dart'
    as _i1;
import 'package:career_growth/presentation/screens/community/community_imports.dart'
    as _i3;
import 'package:career_growth/presentation/screens/dashboard/dashboard_imports.dart'
    as _i4;
import 'package:career_growth/presentation/screens/events/events_imports.dart'
    as _i5;
import 'package:career_growth/presentation/screens/home/home_imports.dart'
    as _i6;
import 'package:career_growth/presentation/screens/onboard/onboard_imports.dart'
    as _i7;
import 'package:career_growth/presentation/screens/otp_verification/otp_verification_imports.dart'
    as _i2;
import 'package:career_growth/presentation/screens/profile/profile_imports.dart'
    as _i8;
import 'package:career_growth/presentation/screens/splash/splash_imports.dart'
    as _i9;
import 'package:flutter/material.dart' as _i11;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.Auth(),
      );
    },
    ChooseInterestsRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ChooseInterests(),
      );
    },
    CommunityRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.Community(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.Dashboard(),
      );
    },
    EventsRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.Events(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.Home(),
      );
    },
    HomeDetailsRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomeDetails(),
      );
    },
    OnboardRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.Onboard(),
      );
    },
    OtpVerificationRoute.name: (routeData) {
      final args = routeData.argsAs<OtpVerificationRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.OtpVerification(
          key: args.key,
          verificationId: args.verificationId,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.Profile(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.Splash(),
      );
    },
    UserDetailsRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.UserDetails(),
      );
    },
  };
}

/// generated route for
/// [_i1.Auth]
class AuthRoute extends _i10.PageRouteInfo<void> {
  const AuthRoute({List<_i10.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ChooseInterests]
class ChooseInterestsRoute extends _i10.PageRouteInfo<void> {
  const ChooseInterestsRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ChooseInterestsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseInterestsRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.Community]
class CommunityRoute extends _i10.PageRouteInfo<void> {
  const CommunityRoute({List<_i10.PageRouteInfo>? children})
      : super(
          CommunityRoute.name,
          initialChildren: children,
        );

  static const String name = 'CommunityRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.Dashboard]
class DashboardRoute extends _i10.PageRouteInfo<void> {
  const DashboardRoute({List<_i10.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i5.Events]
class EventsRoute extends _i10.PageRouteInfo<void> {
  const EventsRoute({List<_i10.PageRouteInfo>? children})
      : super(
          EventsRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventsRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.Home]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomeDetails]
class HomeDetailsRoute extends _i10.PageRouteInfo<void> {
  const HomeDetailsRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomeDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeDetailsRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.Onboard]
class OnboardRoute extends _i10.PageRouteInfo<void> {
  const OnboardRoute({List<_i10.PageRouteInfo>? children})
      : super(
          OnboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.OtpVerification]
class OtpVerificationRoute
    extends _i10.PageRouteInfo<OtpVerificationRouteArgs> {
  OtpVerificationRoute({
    _i11.Key? key,
    required String verificationId,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          OtpVerificationRoute.name,
          args: OtpVerificationRouteArgs(
            key: key,
            verificationId: verificationId,
          ),
          initialChildren: children,
        );

  static const String name = 'OtpVerificationRoute';

  static const _i10.PageInfo<OtpVerificationRouteArgs> page =
      _i10.PageInfo<OtpVerificationRouteArgs>(name);
}

class OtpVerificationRouteArgs {
  const OtpVerificationRouteArgs({
    this.key,
    required this.verificationId,
  });

  final _i11.Key? key;

  final String verificationId;

  @override
  String toString() {
    return 'OtpVerificationRouteArgs{key: $key, verificationId: $verificationId}';
  }
}

/// generated route for
/// [_i8.Profile]
class ProfileRoute extends _i10.PageRouteInfo<void> {
  const ProfileRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.Splash]
class SplashRoute extends _i10.PageRouteInfo<void> {
  const SplashRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.UserDetails]
class UserDetailsRoute extends _i10.PageRouteInfo<void> {
  const UserDetailsRoute({List<_i10.PageRouteInfo>? children})
      : super(
          UserDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserDetailsRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
