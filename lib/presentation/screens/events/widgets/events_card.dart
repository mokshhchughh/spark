part of 'widget_imports.dart';

class EventsCard extends StatelessWidget {
  const EventsCard({super.key, required this.eventsModel});

  final EventsModel eventsModel;

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
                child: Image.network(
                  eventsModel.eventsImage,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TitleLarge(
                        title: eventsModel.formattedDate,
                        color: AppColors.darkTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                      TitleMedium(
                        title: eventsModel.formattedMonth.substring(0, 3),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitleMedium(
                      title: eventsModel.name,
                      fontWeight: FontWeight.bold,
                    ),
                    TitleSmall(
                      title: eventsModel.formattedTime,
                      color: AppColors.darkTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                AppSizes.gap8Space,
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AppIcons.iconsMapPoint,
                      scale: 1.8,
                    ),
                    AppSizes.gapH8Space,
                    SizedBox(
                      width:
                          eventsModel.locationName.length > 17 ? 0.3.sw : null,
                      child: TitleSmall(
                        title: eventsModel.locationName,
                        color: AppColors.alphaBlack50,
                        fontWeight: FontWeight.w500,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Image.asset(
                      AppIcons.iconsHost,
                      scale: 1.4,
                    ),
                    AppSizes.gapH8Space,
                    TitleSmall(
                      title: 'By ${eventsModel.host}',
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
