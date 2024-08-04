// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:career_growth/presentation/screens/add_events/add_events_imports.dart'
    as _i1;
import 'package:career_growth/presentation/screens/add_post/add_post_imports.dart'
    as _i2;
import 'package:career_growth/presentation/screens/add_trophies/add_trophies_imports.dart'
    as _i3;
import 'package:career_growth/presentation/screens/admin_section.dart' as _i4;
import 'package:career_growth/presentation/screens/auth/auth_imports.dart'
    as _i5;
import 'package:career_growth/presentation/screens/community/community_imports.dart'
    as _i7;
import 'package:career_growth/presentation/screens/dashboard/dashboard_imports.dart'
    as _i8;
import 'package:career_growth/presentation/screens/events/events_imports.dart'
    as _i9;
import 'package:career_growth/presentation/screens/home/home_imports.dart'
    as _i10;
import 'package:career_growth/presentation/screens/onboard/onboard_imports.dart'
    as _i11;
import 'package:career_growth/presentation/screens/otp_verification/otp_verification_imports.dart'
    as _i6;
import 'package:career_growth/presentation/screens/profile/profile_imports.dart'
    as _i12;
import 'package:career_growth/presentation/screens/reaction/reaction_imports.dart'
    as _i13;
import 'package:career_growth/presentation/screens/splash/splash_imports.dart'
    as _i14;
import 'package:flutter/cupertino.dart' as _i16;

abstract class $AppRouter extends _i15.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    AddEventsRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddEvents(),
      );
    },
    AddPostRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AddPost(),
      );
    },
    AddTrophiesRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AddTrophies(),
      );
    },
    AdminSectionRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.AdminSection(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.Auth(),
      );
    },
    ChooseInterestsRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ChooseInterests(),
      );
    },
    CommunityRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.Community(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.Dashboard(),
      );
    },
    EventsRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.Events(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.Home(),
      );
    },
    HomeDetailsEventsRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.HomeDetailsEvents(),
      );
    },
    HomeDetailsGiveawayRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.HomeDetailsGiveaway(),
      );
    },
    HomeDetailsScholarshipRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.HomeDetailsScholarship(),
      );
    },
    OnboardRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.Onboard(),
      );
    },
    OtpVerificationRoute.name: (routeData) {
      final args = routeData.argsAs<OtpVerificationRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.OtpVerification(
          key: args.key,
          verificationId: args.verificationId,
          mobileNumber: args.mobileNumber,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.Profile(),
      );
    },
    ReactionRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.Reaction(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.Splash(),
      );
    },
    UserDetailsRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.UserDetails(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddEvents]
class AddEventsRoute extends _i15.PageRouteInfo<void> {
  const AddEventsRoute({List<_i15.PageRouteInfo>? children})
      : super(
          AddEventsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddEventsRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddPost]
class AddPostRoute extends _i15.PageRouteInfo<void> {
  const AddPostRoute({List<_i15.PageRouteInfo>? children})
      : super(
          AddPostRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddPostRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AddTrophies]
class AddTrophiesRoute extends _i15.PageRouteInfo<void> {
  const AddTrophiesRoute({List<_i15.PageRouteInfo>? children})
      : super(
          AddTrophiesRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddTrophiesRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i4.AdminSection]
class AdminSectionRoute extends _i15.PageRouteInfo<void> {
  const AdminSectionRoute({List<_i15.PageRouteInfo>? children})
      : super(
          AdminSectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminSectionRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i5.Auth]
class AuthRoute extends _i15.PageRouteInfo<void> {
  const AuthRoute({List<_i15.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ChooseInterests]
class ChooseInterestsRoute extends _i15.PageRouteInfo<void> {
  const ChooseInterestsRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ChooseInterestsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseInterestsRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i7.Community]
class CommunityRoute extends _i15.PageRouteInfo<void> {
  const CommunityRoute({List<_i15.PageRouteInfo>? children})
      : super(
          CommunityRoute.name,
          initialChildren: children,
        );

  static const String name = 'CommunityRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i8.Dashboard]
class DashboardRoute extends _i15.PageRouteInfo<void> {
  const DashboardRoute({List<_i15.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i9.Events]
class EventsRoute extends _i15.PageRouteInfo<void> {
  const EventsRoute({List<_i15.PageRouteInfo>? children})
      : super(
          EventsRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventsRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i10.Home]
class HomeRoute extends _i15.PageRouteInfo<void> {
  const HomeRoute({List<_i15.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i10.HomeDetailsEvents]
class HomeDetailsEventsRoute extends _i15.PageRouteInfo<void> {
  const HomeDetailsEventsRoute({List<_i15.PageRouteInfo>? children})
      : super(
          HomeDetailsEventsRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeDetailsEventsRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i10.HomeDetailsGiveaway]
class HomeDetailsGiveawayRoute extends _i15.PageRouteInfo<void> {
  const HomeDetailsGiveawayRoute({List<_i15.PageRouteInfo>? children})
      : super(
          HomeDetailsGiveawayRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeDetailsGiveawayRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i10.HomeDetailsScholarship]
class HomeDetailsScholarshipRoute extends _i15.PageRouteInfo<void> {
  const HomeDetailsScholarshipRoute({List<_i15.PageRouteInfo>? children})
      : super(
          HomeDetailsScholarshipRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeDetailsScholarshipRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i11.Onboard]
class OnboardRoute extends _i15.PageRouteInfo<void> {
  const OnboardRoute({List<_i15.PageRouteInfo>? children})
      : super(
          OnboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i6.OtpVerification]
class OtpVerificationRoute
    extends _i15.PageRouteInfo<OtpVerificationRouteArgs> {
  OtpVerificationRoute({
    _i16.Key? key,
    required String verificationId,
    required String mobileNumber,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          OtpVerificationRoute.name,
          args: OtpVerificationRouteArgs(
            key: key,
            verificationId: verificationId,
            mobileNumber: mobileNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'OtpVerificationRoute';

  static const _i15.PageInfo<OtpVerificationRouteArgs> page =
      _i15.PageInfo<OtpVerificationRouteArgs>(name);
}

class OtpVerificationRouteArgs {
  const OtpVerificationRouteArgs({
    this.key,
    required this.verificationId,
    required this.mobileNumber,
  });

  final _i16.Key? key;

  final String verificationId;

  final String mobileNumber;

  @override
  String toString() {
    return 'OtpVerificationRouteArgs{key: $key, verificationId: $verificationId, mobileNumber: $mobileNumber}';
  }
}

/// generated route for
/// [_i12.Profile]
class ProfileRoute extends _i15.PageRouteInfo<void> {
  const ProfileRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i13.Reaction]
class ReactionRoute extends _i15.PageRouteInfo<void> {
  const ReactionRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ReactionRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReactionRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i14.Splash]
class SplashRoute extends _i15.PageRouteInfo<void> {
  const SplashRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i6.UserDetails]
class UserDetailsRoute extends _i15.PageRouteInfo<void> {
  const UserDetailsRoute({List<_i15.PageRouteInfo>? children})
      : super(
          UserDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserDetailsRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}
