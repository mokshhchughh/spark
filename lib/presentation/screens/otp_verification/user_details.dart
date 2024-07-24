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
                const DisplaySmall(
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
                            scale: 2,
                          ),
                          labelText: 'Date of Birth',
                        ),
                        AppSizes.gap12Space,
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            border: Border.all(color: AppColors.alphaBlack20),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: DropdownButton<String>(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 4),
                            hint: Row(
                              children: [
                                Image.asset(
                                  AppIcons.iconsHat,
                                  height: 24,
                                  width: 24,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        otpVerificationViewModel.addUserDetails(
                            context, _selectedGender, selectedValue!);
                        // AutoRouter.of(context)
                        //     .push(const ChooseInterestsRoute());
                      },
                      child: Ink(
                        height: 80.h,
                        width: 80.w,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TitleMedium(
                              title: 'Next',
                              color: AppColors.white,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: AppColors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
