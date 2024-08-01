part of 'add_events_imports.dart';

@RoutePage()
class AddEvents extends StatefulWidget {
  const AddEvents({super.key});

  @override
  State<AddEvents> createState() => _AddEventsState();
}

class _AddEventsState extends State<AddEvents> {
  AddEventsViewModel addEventsViewModel = AddEventsViewModel();
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

  DateTime _selectedDate = DateTime.now();

  void _showDatePicker(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: AppColors.white,
      context: context,
      builder: (BuildContext builder) {
        return SizedBox(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          child: CupertinoDatePicker(
            initialDateTime: _selectedDate,
            use24hFormat: false,
            mode: CupertinoDatePickerMode.dateAndTime,
            onDateTimeChanged: (DateTime newDate) {
              setState(() {
                _selectedDate = newDate;
                addEventsViewModel.dateController.text =
                    DateFormat("MMMM dd, yyyy 'at' hh:mm:ss a")
                        .format(_selectedDate);
              });
            },
          ),
        );
      },
    );
  }

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
                  title: 'Add New Event',
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
                          hintText: 'Event Title',
                          controller: addEventsViewModel.titleController,
                        ),
                        AppSizes.gap12Space,
                        PrimaryTextField(
                          fillColor: AppColors.white,
                          hintText: 'Event Host',
                          controller: addEventsViewModel.hostController,
                        ),
                        AppSizes.gap12Space,
                        PrimaryTextField(
                          fillColor: AppColors.white,
                          hintText: 'Event Location',
                          controller: addEventsViewModel.locationController,
                        ),
                        AppSizes.gap12Space,
                        PrimaryTextField(
                          fillColor: AppColors.white,
                          readOnly: true,
                          onTap: () {
                            _showDatePicker(context);
                          },
                          controller: addEventsViewModel.dateController,
                          hintText: 'Event Date',
                        ),
                        AppSizes.gap12Space,
                        PrimaryTextField(
                          fillColor: AppColors.white,
                          hintText: 'Event Description',
                          maxLines: 5,
                          controller: addEventsViewModel.descriptionController,
                        ),
                        AppSizes.verticalSpace,
                        const TitleMedium(
                          title: 'Select Category',
                          fontWeight: FontWeight.bold,
                        ),
                        AppSizes.gap12Space,
                        BlocBuilder<VelocityBloc<List<String>>,
                            VelocityState<List<String>>>(
                          bloc: addEventsViewModel.selectedChoicesBloc,
                          builder: (context, state) {
                            return Wrap(
                              spacing: 8.0,
                              children: _choices.map((choice) {
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
                                  side: BorderSide.none,
                                  onSelected: (bool selected) {
                                    setState(() {
                                      if (selected) {
                                        state.data.add(choice);
                                      } else {
                                        state.data.remove(choice);
                                      }
                                    });
                                  },
                                  elevation: 4.0,
                                );
                              }).toList(),
                            );
                          },
                        ),
                        AppSizes.gap32Space,
                        BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
                          bloc: addEventsViewModel.isLoadingBloc,
                          builder: (context, state) {
                            return PrimaryButton(
                              title: 'Add Event',
                              isLoading: state.data,
                              onTap: () {
                                addEventsViewModel.addNewEvent(context);
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
