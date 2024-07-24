part of 'widget_imports.dart';

class SecondPostsCard extends StatelessWidget {
  const SecondPostsCard({super.key});

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
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.network(
            fit: BoxFit.cover,
            'https://picsum.photos/200/300',
            width: 1.sw,
            height: 220,
          ),
        ),
      ],
    );
  }
}
