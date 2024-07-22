part of 'widget_imports.dart';

class EventsCard extends StatelessWidget {
  const EventsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(AppIcons.iconsEvent),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Container(
              margin: const EdgeInsets.only(right: 10, top: 10),
              alignment: AlignmentDirectional.center,
              height: 70,
              width: 60,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(4)),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TitleLarge(title: 'May'),
                  TitleLarge(title: '24'),
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              height: 106,
              width: 1.sw,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.alphaBlack10),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleMedium(
                        title: 'Dance Rocks',
                        fontWeight: FontWeight.bold,
                      ),
                      TitleMedium(
                        title: 'By Moksh',
                        color: AppColors.alphaBlack50,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        AppIcons.iconsMapPoint,
                        scale: 2.5,
                      ),
                      AppSizes.gapH8Space,
                      const TitleSmall(
                        title: 'Bangalore, India',
                        color: AppColors.alphaBlack50,
                      ),
                    ],
                  ),
                  AppSizes.gap4Space,
                  const LabelSmall(
                    title: AppConstants.appDummyText,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
