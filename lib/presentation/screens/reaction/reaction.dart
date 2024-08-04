part of 'reaction_imports.dart';

@RoutePage()
class Reaction extends StatefulWidget {
  const Reaction({super.key});

  @override
  State<Reaction> createState() => _ReactionState();
}

class _ReactionState extends State<Reaction> {
  ReactionViewModel reactionViewModel = ReactionViewModel();

  @override
  void initState() {
    reactionViewModel.getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DetailsAppBar(
        title: 'Your Reaction',
      ),
      body: BlocBuilder<VelocityBloc<List<Post>>, VelocityState<List<Post>>>(
        bloc: reactionViewModel.postssBloc,
        builder: (context, state) {
          if (state is VelocityInitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
            itemCount: state.data.length,
            padding: const EdgeInsets.all(16),
            separatorBuilder: (_, __) => const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Divider(
                color: AppColors.alphaBlack20,
              ),
            ),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    children: [
                      TitleMedium(
                        title: '${state.data[index].postTitle}: ',
                        fontWeight: FontWeight.bold,
                      ),
                      TitleSmall(title: state.data[index].postDescription),
                    ],
                  ),
                  AppSizes.gap12Space,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 0.40.sw,
                        decoration: BoxDecoration(
                          color: const Color(0xfff4f4f4),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: TitleSmall(
                            title:
                                'Total Likes: ${state.data[index].postLikes}',
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      Container(
                        width: 0.40.sw,
                        decoration: BoxDecoration(
                          color: const Color(0xfff4f4f4),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: TitleSmall(
                            title:
                                'Total Comments: ${state.data[index].postComments}',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
