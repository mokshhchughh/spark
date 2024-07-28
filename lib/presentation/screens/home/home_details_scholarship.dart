part of 'home_imports.dart';

@RoutePage()
class HomeDetailsScholarship extends StatelessWidget {
  const HomeDetailsScholarship({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DetailsAppBar(
        title: 'Scholarships',
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: 10,
          separatorBuilder: (context, index) => AppSizes.verticalSpace,
          itemBuilder: (context, index) {
            return InkWell(
              borderRadius: BorderRadius.circular(18),
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: const Color(0xffE1E1E1),
                  ),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleMedium(
                          title: 'Scholarship $index',
                          fontWeight: FontWeight.bold,
                        ),
                        TitleSmall(
                          title: 'Scholarship $index',
                          color: AppColors.darkTextColor,
                        ),
                        TitleSmall(
                          title: 'Scholarship $index',
                          color: AppColors.darkTextColor,
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_rounded),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
