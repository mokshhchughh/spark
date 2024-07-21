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
                title: 'Enter Your Details',
                fontWeight: FontWeight.bold,
              ),
              PrimaryTextField(
                controller: TextEditingController(),
                labelText: 'Full Name',
              ),
              AppSizes.gap12Space,
              DropdownButton<String>(
                isExpanded: true,
                hint: const Text('Select Age'),
                value: selectedValue,
                items: classList.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
              ),
              AppSizes.gap12Space,
              DropdownButton<String>(
                isExpanded: true,
                hint: const Text('Gender'),
                value: selectedValue,
                items: classList.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
              ),
              AppSizes.gap12Space,
              DropdownButton<String>(
                hint: const Text('Select Class'),
                isExpanded: true,
                value: selectedValue,
                items: classList.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
              ),
              // DropdownButtonHideUnderline(
              //   child: DropdownButton2<String>(
              //       alignment: Alignment.center,
              //       isExpanded: false,
              //       items: classList
              //           .map((String item) => DropdownMenuItem<String>(
              //               value: item, child: TitleMedium(title: item)))
              //           .toList(),
              //       value: selectedValue,
              //       onChanged: (String? value) {
              //         setState(() {
              //           selectedValue = value!;
              //         });
              //       },
              //       dropdownStyleData: DropdownStyleData(
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(10)),
              //         width: MediaQuery.sizeOf(context).width * 0.9,
              //       ),
              //       buttonStyleData: ButtonStyleData(
              //         padding: EdgeInsets.zero,
              //         width: 60.w,
              //       ),
              //       menuItemStyleData: MenuItemStyleData(height: 40.h)),
              // ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      AutoRouter.of(context).push(const ChooseInterestsRoute());
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
    );
  }
}
