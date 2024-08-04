part of 'widget_imports.dart';

class PostsCard extends StatefulWidget {
  const PostsCard({super.key, required this.homeViewModel, required this.post});

  final HomeViewModel homeViewModel;
  final Post post;

  @override
  State<PostsCard> createState() => _PostsCardState();
}

class _PostsCardState extends State<PostsCard> {
  bool isLiked = false;
  int likesCount = 0;
  int commentsCount = 0;

  @override
  void initState() {
    likesCount = widget.post.postLikes;
    commentsCount = widget.post.postComments;
    super.initState();
  }

  Future<void> _handleToggleLike(String postId) async {
    await widget.homeViewModel.toggleLikePost(postId);
    widget.homeViewModel.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(AppIcons.iconsUser1),
            ),
            AppSizes.gapH8Space,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleMedium(
                  title: widget.post.postAuthor,
                  fontWeight: FontWeight.w600,
                ),
                const TitleSmall(
                  title: 'Mentor',
                  color: AppColors.alphaBlack50,
                ),
              ],
            )
          ],
        ),
        AppSizes.gap12Space,
        TitleSmall(
          title: widget.post.postDescription,
          maxLines: 2,
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
        ),
        AppSizes.gap12Space,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AppIcons.iconsHatFilled,
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
            TitleSmall(
              title: likesCount.toString(),
            ),

            //     BlocBuilder<VelocityBloc<List<int>>, VelocityState<List<int>>>(
            //   bloc: widget.homeViewModel.likesCountBloc,
            //   builder: (context, state) {
            //     return ;
            //   },
            // ),
            const Spacer(),
            TitleSmall(
              title: '${widget.post.postComments}  Comments',
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
                onPressed: () {
                  _handleToggleLike(widget.post.id);
                  setState(() {
                    isLiked = !isLiked;
                  });
                  if (isLiked == true) {
                    likesCount = likesCount + 1;
                  } else {
                    likesCount = likesCount - 1;
                  }
                },
                icon: Image.asset(
                  isLiked == true
                      ? AppIcons.iconsHatFilled
                      : AppIcons.iconsHatOutlined,
                  height: 20,
                  width: 20,
                ),
                label: TitleSmall(
                  title: isLiked == true ? 'Liked' : 'Like',
                  color: isLiked == true ? AppColors.primary : AppColors.black,
                ),
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: () async {
                  var data = await showModalBottomSheet(
                    context: context,
                    useSafeArea: true,
                    enableDrag: false,
                    isScrollControlled: true,
                    builder: (context) => CommentsSection(
                      homeViewModel: widget.homeViewModel,
                      post: widget.post,
                    ),
                  );
                  if (data != null) {
                    setState(() {
                      commentsCount = data;
                    });
                  }
                },
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
                onPressed: () async {
                  await Share.share(widget.post.postDescription);
                },
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
