part of 'widget_imports.dart';

class FiltersSection extends StatefulWidget {
  const FiltersSection({super.key, required this.eventsViewModel});

  final EventsViewModel eventsViewModel;

  @override
  State<FiltersSection> createState() => _FiltersSectionState();
}

class _FiltersSectionState extends State<FiltersSection> {
  SortOrder _sortOrder = SortOrder.none;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSizes.verticalSpace,
        ExpansionTile(
          shape: const RoundedRectangleBorder(),
          title: const TitleMedium(title: 'A-Z'),
          children: [
            ListTile(
              title: const Text('None'),
              leading: Radio<SortOrder>(
                value: SortOrder.none,
                groupValue: _sortOrder,
                onChanged: (SortOrder? value) {
                  setState(() {
                    _sortOrder = value!;
                    widget.eventsViewModel.getEvents(sortOrder: _sortOrder);
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Ascending'),
              leading: Radio<SortOrder>(
                value: SortOrder.ascending,
                groupValue: _sortOrder,
                onChanged: (SortOrder? value) {
                  setState(() {
                    _sortOrder = value!;
                    widget.eventsViewModel.getEvents(sortOrder: _sortOrder);
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Descending'),
              leading: Radio<SortOrder>(
                value: SortOrder.descending,
                groupValue: _sortOrder,
                onChanged: (SortOrder? value) {
                  setState(() {
                    _sortOrder = value!;
                    widget.eventsViewModel.getEvents(sortOrder: _sortOrder);
                  });
                },
              ),
            ),
          ],
        ),
        const Divider(),
        ExpansionTile(
          childrenPadding: const EdgeInsets.symmetric(horizontal: 10),
          shape: const RoundedRectangleBorder(),
          title: const TitleMedium(title: 'Interests'),
          children: [
            BlocBuilder<VelocityBloc<List<String>>,
                VelocityState<List<String>>>(
              bloc: widget.eventsViewModel.selectedChoicesBloc,
              builder: (context, state) {
                return Wrap(
                  spacing: 16.0,
                  children: widget.eventsViewModel.choices.map((choice) {
                    return ChoiceChip(
                      label: TitleSmall(
                          title: choice,
                          color: state.data.contains(choice)
                              ? AppColors.white
                              : AppColors.black),
                      selected: state.data.contains(choice),
                      selectedColor: AppColors.primary,
                      backgroundColor: AppColors.white,
                      checkmarkColor: AppColors.white,
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                            state.data.add(choice);
                            widget.eventsViewModel
                                .getEvents(categories: state.data);
                          } else {
                            state.data.remove(choice);
                            widget.eventsViewModel
                                .getEvents(categories: state.data);
                          }
                        });
                      },
                      elevation: 4.0,
                    );
                  }).toList(),
                );
              },
            ),
            AppSizes.gap24Space,
          ],
        ),
        // const Divider(),
        // const ExpansionTile(
        //   shape: RoundedRectangleBorder(),
        //   title: TitleMedium(title: 'Mode'),
        //   children: [],
        // ),
      ],
    );
  }
}
