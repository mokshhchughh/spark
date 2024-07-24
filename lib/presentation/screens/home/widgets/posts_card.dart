part of 'widget_imports.dart';

class PostsCard extends StatelessWidget {
  const PostsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(AppIcons.iconsUser1),
            ),
            AppSizes.gapH8Space,
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleMedium(
                  title: 'User Full Name',
                  fontWeight: FontWeight.w600,
                ),
                TitleSmall(
                  title: 'Designation',
                  color: AppColors.alphaBlack50,
                ),
              ],
            )
          ],
        ),
        AppSizes.gap12Space,
        const TitleSmall(
          title: AppConstants.appDummyText,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        AppSizes.gap12Space,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AppIcons.iconsHat,
              height: 20,
              width: 20,
              color: AppColors.primary,
            ),
            AppSizes.gapH8Space,
            Image.asset(
              AppIcons.iconsHeart,
              height: 20,
              width: 20,
              color: AppColors.destructive500,
            ),
            AppSizes.gapH8Space,
            Image.asset(
              AppIcons.iconsLightbulbBolt,
              height: 20,
              width: 20,
              color: AppColors.warning400,
            ),
            AppSizes.gapH4Space,
            const TitleSmall(
              title: '60',
            ),
            const Spacer(),
            const TitleSmall(
              title: '10 Comments',
            ),
          ],
        ),
        AppSizes.gap12Space,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xfff4f4f4),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  AppIcons.iconsHat,
                  height: 20,
                  width: 20,
                ),
                label: const TitleSmall(
                  title: 'Like',
                ),
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  AppIcons.iconsChatRoundDots,
                  height: 20,
                  width: 20,
                ),
                label: const TitleSmall(
                  title: 'Comments',
                ),
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  AppIcons.iconsForward,
                  height: 20,
                  width: 20,
                ),
                label: const TitleSmall(
                  title: 'Share',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
