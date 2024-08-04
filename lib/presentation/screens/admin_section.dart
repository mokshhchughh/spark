import 'package:auto_route/auto_route.dart';
import 'package:career_growth/presentation/components/typography/typography_imports.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_icons.dart';
import '../routes/router_imports.gr.dart';
import 'home/widgets/widget_imports.dart';

@RoutePage()
class AdminSection extends StatelessWidget {
  const AdminSection({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AppIcons.iconsOnboardBg),
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: const DetailsAppBar(
          title: 'Admin Section',
        ),
        body: Column(
          children: [
            ListTile(
              onTap: () {
                AutoRouter.of(context).push(const AddPostRoute());
              },
              leading: const TitleMedium(
                title: 'Add Post',
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              onTap: () {
                AutoRouter.of(context).push(const AddEventsRoute());
              },
              leading: const TitleMedium(
                title: 'Add Event',
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              onTap: () {
                AutoRouter.of(context).push(const AddTrophiesRoute());
              },
              leading: const TitleMedium(
                title: 'Add Trophy',
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              onTap: () {
                AutoRouter.of(context).push(const ReactionRoute());
              },
              leading: const TitleMedium(
                title: 'Add Reactions',
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}
