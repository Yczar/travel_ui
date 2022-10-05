import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_ui/app/enums/bottom_nav_item.dart';
import 'package:travel_ui/app/presentation/ui/pages/home_page.dart';
import 'package:travel_ui/src/res/svgs.dart';
import 'package:travel_ui/src/values/colors.dart';
import 'package:travel_ui/src/values/dimens.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late ValueNotifier<BottomNavItem> _selectedItem;
  @override
  void initState() {
    super.initState();
    _selectedItem = ValueNotifier(BottomNavItem.home);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _selectedItem,
      builder: (_, selectedItem, __) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  kMainHomeSvg,
                  height: kDimen24,
                  color: _getNavItemColor(
                    selectedItem == BottomNavItem.home,
                  ),
                ),
                label: _getTitleFromEnum(
                  BottomNavItem.home,
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  kMainDiscountSvg,
                  height: kDimen24,
                  color: _getNavItemColor(
                    selectedItem == BottomNavItem.settings,
                  ),
                ),
                label: _getTitleFromEnum(
                  BottomNavItem.settings,
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  kMainProfileSvg,
                  height: kDimen24,
                  color: _getNavItemColor(
                    selectedItem == BottomNavItem.profile,
                  ),
                ),
                label: _getTitleFromEnum(
                  BottomNavItem.profile,
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  kMainPaperSvg,
                  height: kDimen24,
                  color: _getNavItemColor(
                    selectedItem == BottomNavItem.note,
                  ),
                ),
                label: _getTitleFromEnum(
                  BottomNavItem.note,
                ),
              ),
            ],
            onTap: (index) {
              _selectedItem.value = _mapIndexToNavItem(index);
            },
            currentIndex: _mapNavItemToIndex(
              selectedItem,
            ),
          ),
          body: _mapNavItemToWidget(
            selectedItem,
          ),
        );
      },
    );
  }

  String _getTitleFromEnum(BottomNavItem item) {
    switch (item) {
      case BottomNavItem.home:
        return 'Home';
      case BottomNavItem.settings:
        return 'Discount';
      case BottomNavItem.profile:
        return 'Profile';
      case BottomNavItem.note:
        return 'Note';
    }
  }

  Color _getNavItemColor(bool selected) {
    return selected ? kPrimaryColor : kGrayColor;
  }

  BottomNavItem _mapIndexToNavItem(int index) {
    switch (index) {
      case 0:
        return BottomNavItem.home;
      case 1:
        return BottomNavItem.settings;
      case 2:
        return BottomNavItem.profile;
      case 3:
        return BottomNavItem.note;
      default:
        return BottomNavItem.home;
    }
  }

  int _mapNavItemToIndex(BottomNavItem item) {
    switch (item) {
      case BottomNavItem.home:
        return 0;
      case BottomNavItem.settings:
        return 1;
      case BottomNavItem.profile:
        return 2;
      case BottomNavItem.note:
        return 3;
      default:
        return 0;
    }
  }

  Widget _mapNavItemToWidget(BottomNavItem item) {
    switch (item) {
      case BottomNavItem.home:
        return const HomePage();
      case BottomNavItem.settings:
        return Container();
      case BottomNavItem.profile:
        return Container();
      case BottomNavItem.note:
        return Container();
      default:
        return Container();
    }
  }
}
