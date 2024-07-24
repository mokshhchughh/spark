part of 'widget_imports.dart';

class FiltersSection extends StatefulWidget {
  const FiltersSection({super.key});

  @override
  State<FiltersSection> createState() => _FiltersSectionState();
}

class _FiltersSectionState extends State<FiltersSection> {
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
    return Column(
      children: [
        AppSizes.verticalSpace,
        const ExpansionTile(
          shape: RoundedRectangleBorder(),
          title: TitleMedium(title: 'A-Z'),
          children: [],
        ),
        const Divider(),
        ExpansionTile(
          childrenPadding: const EdgeInsets.symmetric(horizontal: 10),
          shape: const RoundedRectangleBorder(),
          title: const TitleMedium(title: 'Interests'),
          children: [
            Wrap(
              spacing: 16.0,
              children: _choices.map((choice) {
                return ChoiceChip(
                  label: TitleSmall(
                      title: choice,
                      color: _selectedChoices.contains(choice)
                          ? AppColors.white
                          : AppColors.black),
                  selected: _selectedChoices.contains(choice),
                  selectedColor: AppColors.primary,
                  backgroundColor: AppColors.white,
                  checkmarkColor: AppColors.white,
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
          ],
        ),
        const Divider(),
        const ExpansionTile(
          shape: RoundedRectangleBorder(),
          title: TitleMedium(title: 'Mode'),
          children: [],
        ),
      ],
    );
  }
}
