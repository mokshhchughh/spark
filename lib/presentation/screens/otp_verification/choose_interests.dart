part of 'otp_verification_imports.dart';

@RoutePage()
class ChooseInterests extends StatefulWidget {
  const ChooseInterests({super.key});

  @override
  State<ChooseInterests> createState() => _ChooseInterestsState();
}

class _ChooseInterestsState extends State<ChooseInterests> {
  final List<String> _choices = [
    'Tech',
    'Arts',
    'Sports',
    'Singing',
    'Dancing',
    'Finance',
    'Entrepreneur',
    'Poetry',
    'Graphic',
    'Marketing',
    'Speaking',
    'Soft Skills',
    'Music',
    'Movies',
    'Books',
    'Travel',
    'Food',
    'Fitness',
    'Gaming',
  ];

  final List<String> _selectedChoices = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: AppPaddings.appPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DisplaySmall(
                title: 'Interests',
                fontWeight: FontWeight.bold,
              ),
              const TitleMedium(
                  title: 'Choose your interests. You can change them later'),
              AppSizes.verticalSpace,
              Wrap(
                spacing: 8.0,
                children: _choices.map((choice) {
                  return ChoiceChip(
                    label: TitleSmall(title: choice),
                    backgroundColor: AppColors.primary.withOpacity(0.1),
                    selected: _selectedChoices.contains(choice),
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          _selectedChoices.add(choice);
                        } else {
                          _selectedChoices.remove(choice);
                        }
                      });
                    },
                    elevation: 4.0,
                  );
                }).toList(),
              ),
              const Spacer(),
              PrimaryButton(
                title: "Let's Go",
                onTap: () {
                  AutoRouter.of(context).push(const DashboardRoute());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
