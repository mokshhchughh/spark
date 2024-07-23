import 'package:auto_route/auto_route.dart';
import 'package:career_growth/core/constants/app_paddings.dart';
import 'package:career_growth/core/constants/app_sizes.dart';
import 'package:career_growth/presentation/components/components_imports.dart';
import 'package:career_growth/presentation/components/typography/typography_imports.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_bloc/cubit/velocity_cubit/velocity_cubit.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_icons.dart';
import '../../routes/router_imports.gr.dart';

part 'profile.dart';
part 'profile_view_model.dart';
