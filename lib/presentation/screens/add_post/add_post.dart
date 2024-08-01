part of 'add_post_imports.dart';

@RoutePage()
class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  List<String> classList = [
    'VI',
    'VII',
    'VIII',
    'IX',
    'X',
    'XI',
    'XII',
  ];

  String? selectedValue;

  AddPostViewModel addPostViewModel = AddPostViewModel();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AppIcons.iconsOnboardBg),
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          backgroundColor: AppColors.transparent,
        ),
        body: SafeArea(
          child: Padding(
            padding: AppPaddings.appPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeadlineMedium(
                  title: 'Add New Post',
                  fontWeight: FontWeight.bold,
                ),
                AppSizes.gap24Space,
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PrimaryTextField(
                          fillColor: AppColors.white,
                          hintText: 'Post Title',
                          controller: addPostViewModel.postController,
                        ),
                        AppSizes.gap12Space,
                        PrimaryTextField(
                          fillColor: AppColors.white,
                          hintText: 'Post Author',
                          controller: addPostViewModel.postAuthorController,
                        ),
                        AppSizes.gap12Space,
                        PrimaryTextField(
                          fillColor: AppColors.white,
                          hintText: 'Post Description',
                          maxLines: 5,
                          controller: addPostViewModel.descController,
                        ),
                        AppSizes.gap12Space,
                      ],
                    ),
                  ),
                ),
                BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
                  bloc: addPostViewModel.isLoadingBloc,
                  builder: (context, state) {
                    return PrimaryButton(
                      title: 'Add Post',
                      isLoading: state.data,
                      onTap: () {
                        addPostViewModel.addNewPost(context);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
