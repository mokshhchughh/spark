part of 'placeholder_imports.dart';

class CommentsPlaceholder extends StatelessWidget {
  const CommentsPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSizes.gap12Space,
        VxShimmer(
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: AppColors.alphaBlack20,
                borderRadius: BorderRadius.circular(10)),
            child: const SizedBox(
              height: 20,
              width: 100,
            ),
          ),
        ),
        const Divider(
          color: AppColors.alphaBlack10,
        ),
        AppSizes.gap12Space,
        Expanded(
          child: ListView.separated(
            itemCount: 7,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 60.0, left: 16, right: 16),
            separatorBuilder: (context, index) => AppSizes.gap12Space,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  VxShimmer(
                    child: CircleAvatar(
                      radius: 26.r,
                      backgroundColor: AppColors.alphaBlack20,
                    ),
                  ),
                  AppSizes.gapH10Space,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VxShimmer(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: AppColors.alphaBlack20,
                                borderRadius: BorderRadius.circular(10)),
                            child: const SizedBox(
                              height: 20,
                              width: 180,
                            ),
                          ),
                        ),
                        AppSizes.gap4Space,
                        VxShimmer(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: AppColors.alphaBlack20,
                                borderRadius: BorderRadius.circular(10)),
                            child: const SizedBox(
                              height: 14,
                              width: 100,
                            ),
                          ),
                        ),
                        AppSizes.gap4Space,
                        VxShimmer(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: AppColors.alphaBlack20,
                                borderRadius: BorderRadius.circular(10)),
                            child: const SizedBox(
                              height: 10,
                              width: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
