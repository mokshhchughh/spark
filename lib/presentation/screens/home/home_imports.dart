import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:career_growth/core/constants/app_colors.dart';
import 'package:career_growth/presentation/components/buttons/buttons_imports.dart';
import 'package:career_growth/presentation/components/text_fields/text_fields_imports.dart';
import 'package:career_growth/presentation/components/typography/typography_imports.dart';
import 'package:career_growth/presentation/routes/router_imports.gr.dart';
import 'package:career_growth/presentation/screens/events/events_model.dart';
import 'package:career_growth/presentation/screens/events/widgets/widget_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:velocity_bloc/velocity_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/constants/app_icons.dart';
import '../../../core/constants/app_paddings.dart';
import '../../../core/constants/app_sizes.dart';
import '../events/events_imports.dart';
import 'widgets/widget_imports.dart';

part 'home.dart';
part 'home_details_events.dart';
part 'home_view_model.dart';
part 'home_details_giveaway.dart';
part 'home_details_scholarship.dart';
