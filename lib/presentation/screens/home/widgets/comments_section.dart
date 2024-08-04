part of 'widget_imports.dart';

class CommentsSection extends StatefulWidget {
  const CommentsSection(
      {super.key, required this.homeViewModel, required this.post});

  final HomeViewModel homeViewModel;
  final Post post;

  @override
  State<CommentsSection> createState() => _CommentsSectionState();
}

class _CommentsSectionState extends State<CommentsSection> {
  final TextEditingController _textEditingController = TextEditingController();

  int commensCount = 0;

  ProfileViewModel profileViewModel = ProfileViewModel();

  @override
  void dispose() {
    _textEditingController.dispose();
    profileViewModel.getUserDetails();
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
                      TitleMedium(
                        title: "${widget.post.postComments} Comments",
                        fontWeight: FontWeight.bold,
                      ),
                      const Divider(
                        color: AppColors.alphaBlack10,
                      ),
                      AppSizes.gap12Space,
                      Expanded(
                        child: ListView.separated(
                          itemCount: widget.post.comments.length,
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
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BlocBuilder<VelocityBloc, VelocityState>(
                                        bloc: profileViewModel.userDeatils,
                                        builder: (context, state) {
                                          if (state is VelocityInitialState) {
                                            return const Center(
                                              child: SizedBox.shrink(),
                                            );
                                          } else if (state
                                              is VelocityUpdateState) {
                                            return LabelLarge(
                                              title: state.data?['name'] ?? '',
                                              fontWeight: FontWeight.w500,
                                            );
                                          } else {
                                            return const SizedBox.shrink();
                                          }
                                        },
                                      ),
                                      LabelMedium(
                                          title: widget.post.comments[index]),
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
                          widget.homeViewModel.addComment(
                              widget.post, _textEditingController.text);
                          _textEditingController.clear();
                          Navigator.pop(context, commensCount++);
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
