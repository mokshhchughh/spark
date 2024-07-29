part of 'otp_verification_imports.dart';

@RoutePage()
class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
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

  OtpVerificationViewModel otpVerificationViewModel =
      OtpVerificationViewModel();

  String _selectedGender = 'Male';

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
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (DateTime newDate) {
              setState(() {
                _selectedDate = newDate;
                otpVerificationViewModel.dateController.text =
                    DateFormat.yMMMd().format(newDate);
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
                  title: 'Enter Your Details',
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
                          prefixIcon: Image.asset(
                            AppIcons.iconsUserRoundedOutline,
                            scale: 2,
                            color: AppColors.black,
                          ),
                          controller:
                              otpVerificationViewModel.fullNameController,
                          labelText: 'Full Name (as per Govt Identity)',
                        ),
                        AppSizes.gap12Space,
                        PrimaryTextField(
                          fillColor: AppColors.white,
                          readOnly: true,
                          onTap: () {
                            _showDatePicker(context);
                          },
                          controller: otpVerificationViewModel.dateController,
                          prefixIcon: Image.asset(
                            AppIcons.iconsCalendar,
                            scale: 1.8,
                            color: AppColors.black,
                          ),
                          labelText: 'Date of Birth',
                        ),
                        AppSizes.gap12Space,
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            border: Border.all(color: AppColors.borderColor),
                            borderRadius: BorderRadius.circular(18.r),
                          ),
                          child: DropdownButton<String>(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 4),
                            hint: Row(
                              children: [
                                Image.asset(
                                  AppIcons.iconsHatOutlined,
                                  height: 24,
                                  width: 24,
                                  color: AppColors.black,
                                ),
                                AppSizes.gapH10Space,
                                const Text('Select Class'),
                              ],
                            ),
                            dropdownColor: AppColors.white,
                            isExpanded: true,
                            elevation: 0,
                            underline: const SizedBox.shrink(),
                            value: selectedValue,
                            items: classList.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: TitleMedium(title: value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue = newValue!;
                              });
                            },
                          ),
                        ),
                        AppSizes.verticalSpace,
                        const TitleMedium(
                          title: 'Gender',
                          fontWeight: FontWeight.bold,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: RadioListTile(
                                contentPadding: EdgeInsets.zero,
                                dense: true,
                                activeColor: AppColors.primary,
                                title: const TitleSmall(title: 'Male'),
                                value: 'Male',
                                groupValue: _selectedGender,
                                onChanged: (String? value) {
                                  setState(() {
                                    _selectedGender = value!;
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: RadioListTile(
                                activeColor: AppColors.primary,
                                contentPadding: EdgeInsets.zero,
                                dense: true,
                                title: const TitleSmall(title: 'Female'),
                                value: 'Female',
                                groupValue: _selectedGender,
                                onChanged: (String? value) {
                                  setState(() {
                                    _selectedGender = value!;
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: RadioListTile(
                                activeColor: AppColors.primary,
                                contentPadding: EdgeInsets.zero,
                                dense: true,
                                title: const TitleSmall(title: 'Others'),
                                value: 'Others',
                                groupValue: _selectedGender,
                                onChanged: (String? value) {
                                  setState(() {
                                    _selectedGender = value!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                PrimaryButton(
                  title: 'Next',
                  onTap: () {
                    otpVerificationViewModel.addUserDetails(
                        context, _selectedGender, selectedValue!);
                    // AutoRouter.of(context).push(const ChooseInterestsRoute());
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
