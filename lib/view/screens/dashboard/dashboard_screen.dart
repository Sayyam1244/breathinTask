// ignore_for_file: deprecated_member_use

import 'package:breathin/controllers/songs_controller.dart';
import 'package:breathin/imports.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int screenIndex = 0;
  final List<Widget> screens = [
    const HomeScreen(),
    const SizedBox(),
    const SizedBox(),
  ];
  final List<String> icons = [
    Images.homeIcon,
    Images.discoverIcon,
    Images.profileIcon,
  ];
  @override
  void initState() {
    SongsController.to.getSongs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: AppConstants.appName,
        allowBack: false,
        actions: [
          CustomIconButton(
            iconPath: Images.messageIcon,
            onPressed: () {},
            showAlert: true,
          ),
          8.horizontalSpace,
          CustomIconButton(
            iconPath: Images.notificationIcon,
            onPressed: () {},
            showAlert: false,
          ),
          20.horizontalSpace,
        ],
      ),
      body: screens[screenIndex],
      bottomNavigationBar: Container(
        padding: paddingHorizontal,
        height: 85.sp,
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.theme.colorScheme.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.sp),
            topRight: Radius.circular(30.sp),
          ),
          boxShadow: [
            BoxShadow(
              color: context.theme.shadowColor.withOpacity(0.1),
              offset: const Offset(0, -2),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: screens
              .mapIndexed(
                (index, element) => CustomBottomItemWidget(
                  icon: icons[index],
                  onTap: () {
                    setState(() {
                      screenIndex = index;
                    });
                  },
                  isSelected: screenIndex == index,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class CustomBottomItemWidget extends StatelessWidget {
  const CustomBottomItemWidget({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: SvgPicture.asset(
          icon,
          color: isSelected
              ? context.theme.colorScheme.primary
              : context.theme.colorScheme.onBackground,
          height: 24.sp,
        ),
      ),
    );
  }
}
