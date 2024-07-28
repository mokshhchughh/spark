part of 'widget_imports.dart';

class EventsCard extends StatelessWidget {
  const EventsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                ),
                child: Image.asset(
                  AppIcons.iconsEvent,
                  height: 173.h,
                  width: 1.sw,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: Container(
                  margin: const EdgeInsets.only(right: 10, top: 10),
                  alignment: AlignmentDirectional.center,
                  height: 70,
                  width: 60,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TitleLarge(
                        title: '24',
                        color: AppColors.darkTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                      TitleMedium(
                        title: 'May',
                        color: AppColors.darkTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitleMedium(
                      title: 'Cooking and baking classes',
                      fontWeight: FontWeight.bold,
                    ),
                    TitleMedium(
                      title: '11:00 AM',
                      color: AppColors.darkTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                AppSizes.gap4Space,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AppIcons.iconsMapPoint,
                      scale: 1.8,
                    ),
                    AppSizes.gapH8Space,
                    const TitleSmall(
                      title: 'Radha park, Chennai',
                      color: AppColors.alphaBlack50,
                      fontWeight: FontWeight.w500,
                    ),
                    const Spacer(),
                    Image.asset(
                      AppIcons.iconsHost,
                      scale: 1.4,
                    ),
                    AppSizes.gapH8Space,
                    const TitleSmall(
                      title: 'By Pushkar',
                      color: AppColors.alphaBlack50,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
