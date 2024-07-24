import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:career_growth/core/constants/app_paddings.dart';
import 'package:career_growth/core/constants/app_sizes.dart';
import 'package:career_growth/presentation/auth/auth_bloc.dart';
import 'package:career_growth/presentation/components/buttons/buttons_imports.dart';
import 'package:career_growth/presentation/routes/router_imports.gr.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_icons.dart';
import '../../components/text_fields/text_fields_imports.dart';
import '../../components/typography/typography_imports.dart';

part 'otp_verification.dart';
part 'otp_verification_view_model.dart';
part 'user_details.dart';
part 'choose_interests.dart';
