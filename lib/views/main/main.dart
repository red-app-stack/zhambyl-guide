import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:dot_curved_bottom_nav/dot_curved_bottom_nav.dart';
import 'package:zhambyl_guide/views/main/home.dart';
import 'package:zhambyl_guide/views/main/favourite.dart';
import 'package:zhambyl_guide/views/main/feedback.dart';
import 'package:zhambyl_guide/views/main/menu.dart';

import 'package:zhambyl_guide/views/shared/search_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  late PageController _pageController;

  final List<Widget> _screens = [
    HomeScreen(),
    FavouriteScreen(),
    FeedbackScreen(),
    MenuScreen(),
  ];

  final List<String> _iconPaths = [
    'assets/icons/nav_home.svg',
    'assets/icons/nav_favourite.svg',
    'assets/icons/nav_feedback.svg',
    'assets/icons/nav_menu.svg',
  ];

  final List<String> _selectedIconPaths = [
    'assets/icons/nav_home_on.svg',
    'assets/icons/nav_favourite_on.svg',
    'assets/icons/nav_feedback_on.svg',
    'assets/icons/nav_menu_on.svg',
  ];

  final List<String> _labels = [
    'Главная',
    'Нравится',
    'Отзывы',
    'Меню',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToPage(int index) {
    if (index == _selectedIndex) return;
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Widget _buildNavItem(int index) {
    return SvgPicture.asset(
      _selectedIndex == index ? _selectedIconPaths[index] : _iconPaths[index],
      width: 24,
      height: 24,
      colorFilter: ColorFilter.mode(
        _selectedIndex == index ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onSurfaceVariant,
        BlendMode.srcIn,
      ),
    );
  }

  // Widget dotCurvedBottomNavItem(int index) {
  //   final bool isSelected = index == _selectedIndex;
  //   final String iconPath = _iconPaths[index];
  //   // final String label = _labels[index];
  //   final animDuration = isSelected ? 300 : 150;

  //   return AnimatedContainer(
  //     duration: Duration(milliseconds: animDuration),
  //     curve: isSelected ? Curves.easeOutCubic : Curves.easeInOut,
  //     width: isSelected ? 40 : 30,
  //     height: isSelected ? 40 : 30,
  //     child: TweenAnimationBuilder<Color?>(
  //       duration: Duration(milliseconds: animDuration), // Faster when deselecting
  //       curve: isSelected
  //           ? Curves.easeOutCubic // Smooth transition when selecting
  //           : Curves.easeInOut, // Quick transition when deselecting
  //       tween: ColorTween(
  //         // For home icon (index 2), use these colors

  //         begin: index == 2 ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurfaceVariant,
  //         // When selected, transition to onPrimary, otherwise onSurfaceVariant
  //         end: isSelected ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurfaceVariant,
  //       ),
  //       // Add a key to prevent unnecessary rebuilds
  //       key: ValueKey('icon_$index'),
  //       builder: (BuildContext context, Color? color, Widget? child) {
  //         return SvgPicture.asset(
  //           iconPath,
  //           colorFilter: ColorFilter.mode(
  //             color!,
  //             BlendMode.srcIn,
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 1,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              color: theme.colorScheme.surface,
              child: TopBar(
                onProfileTap: () {},
                onSearchTap: () {},
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: _screens,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FloatingNavbar(
        onTap: _navigateToPage,
        currentIndex: _selectedIndex,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        padding: const EdgeInsets.only(bottom: 8, top: 8),
        borderRadius: 24,
        itemBorderRadius: 24,
        backgroundColor: theme.colorScheme.inverseSurface,
        selectedBackgroundColor: theme.colorScheme.surface,
        selectedItemColor: theme.colorScheme.inverseSurface,
        unselectedItemColor: theme.colorScheme.surface,
        items: [
          FloatingNavbarItem(
              // title: _labels[0],
              customWidget: _buildNavItem(0)),
          FloatingNavbarItem(
              // title: _labels[1],
              customWidget: _buildNavItem(1)),
          FloatingNavbarItem(
              // title: _labels[2],
              customWidget: _buildNavItem(2)),
          FloatingNavbarItem(
              // title: _labels[3],
              customWidget: _buildNavItem(3)),
        ],
      ),
    );
  }
}
