part of 'widget_imports.dart';

class CommentsSection extends StatefulWidget {
  const CommentsSection({super.key});

  @override
  State<CommentsSection> createState() => _CommentsSectionState();
}

class _CommentsSectionState extends State<CommentsSection> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 1.4,
      child: SafeArea(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          child: Scaffold(
            backgroundColor: AppColors.white,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      AppSizes.gap12Space,
                      const TitleMedium(
                        title: "10 Comments",
                        fontWeight: FontWeight.bold,
                      ),
                      const Divider(
                        color: AppColors.alphaBlack10,
                      ),
                      AppSizes.gap12Space,
                      Expanded(
                        child: ListView.separated(
                          itemCount: 2,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.only(
                              bottom: 60.0, left: 16, right: 16),
                          separatorBuilder: (context, index) =>
                              AppSizes.gap12Space,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 20.r,
                                  backgroundImage:
                                      const AssetImage(AppIcons.iconsUser1),
                                ),
                                AppSizes.gapH10Space,
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      LabelLarge(
                                        title: 'ok',
                                        fontWeight: FontWeight.w500,
                                      ),
                                      LabelMedium(title: 'ko'),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: AppColors.alphaBlack10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPaddings.appHPadding),
                  child: PrimaryTextField(
                    fillColor: AppColors.grey100,
                    icon: const CircleAvatar(
                      backgroundImage: AssetImage(AppIcons.iconsUser4),
                    ),
                    controller: _textEditingController,
                    hintText: 'Add comment...',
                    contentPadding: 8,
                    suffixIcon: IconButton(
                        onPressed: () {
                          VxToast.show(context, msg: 'Comments Added!');
                          _textEditingController.clear();
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.send)),
                  ),
                ),
                AppSizes.gap8Space,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
