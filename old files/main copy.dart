// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:zhambyl_guide/views/main/home.dart';
// import '../../routes/manage_auth_nav.dart';
// import '../../utils/themes/theme_extension.dart';

// class MainScreenController extends GetxController with GetSingleTickerProviderStateMixin {
//   late AnimationController overlayAnimationController;
//   late Animation<double> overlayAnimation;
//   final Rx<Widget?> overlayScreen = Rx<Widget?>(null);
//   final RxBool isProfileOpen = false.obs;
//   final RxBool isSupportOpen = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     overlayAnimationController = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     );
//     overlayAnimation = CurvedAnimation(
//       parent: overlayAnimationController,
//       curve: Curves.easeOutCubic,
//       reverseCurve: Curves.easeInCubic,
//     );
//   }

//   // @override
//   // void onClose() {
//   //   overlayAnimationController.dispose();
//   //   super.onClose();
//   // }

//   void showOverlay(Widget screen, {bool isProfile = false, bool isSupport = false}) {
//     if (hasOverlay) {
//       overlayAnimationController.reverse(from: 0.003).whenComplete(() {
//         overlayScreen.value = screen;
//         isProfileOpen.value = isProfile;
//         isSupportOpen.value = isSupport;
//         overlayAnimationController.forward(from: 0.003);
//       });
//     } else {
//       overlayScreen.value = screen;
//       isProfileOpen.value = isProfile;
//       isSupportOpen.value = isSupport;
//       overlayAnimationController.forward();
//     }
//   }

//   Future<void> hideOverlay() async {
//     await overlayAnimationController.reverse();
//     overlayScreen.value = null;
//     isProfileOpen.value = false;
//     isSupportOpen.value = false;
//   }

//   bool get hasOverlay => overlayScreen.value != null;
// }

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});

//   @override
//   MainScreenState createState() => MainScreenState();
// }

// class MainScreenState extends State<MainScreen> {
//   int _selectedIndex = 2;
//   final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
//   late PageController _pageController;
//   final MainScreenController _controller = Get.put(MainScreenController());

//   final List<Widget> _screens = [
//     HomeScreen(),
//     FavouriteScreen(),
//     FeedbackScreen(),
//     MenuScreen(),
//   ];

//   final List<String> _iconPaths = [
//     'assets/icons/home.svg',
//     'assets/icons/favourite.svg',
//     'assets/icons/feedback.svg',
//     'assets/icons/menu.svg',
//   ];

//   final List<String> _labels = [
//     'Платежи',
//     'Переводы',
//     'Главная',
//     'Счета',
//     'Меню',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(initialPage: Get.arguments == '/transfers' ? 1 : _selectedIndex);

//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   Duration _calculateAnimationDuration(int currentIndex, int newIndex) {
//     int distance = (currentIndex - newIndex).abs();
//     int duration = 200 + (distance * 200);
//     return Duration(milliseconds: duration.clamp(200, 1000));
//   }

//   void _handleProfileTap() {
//     manageNav(
//         false,
//         () => {
//               if (_controller.isProfileOpen.value)
//                 {_controller.hideOverlay()}
//               else
//                 {
//                   // _controller.showOverlay(
//                   //   ProfileScreen(
//                   //     onBack: () => _controller.hideOverlay(),
//                   //   ),
//                   //   isProfile: true,
//                   // )
//                 }
//             });
//   }

//   void _handleSupportTap() {
//     if (_controller.isSupportOpen.value) {
//       _controller.hideOverlay();
//     } else {
//       // _controller.showOverlay(
//       //   SupportScreen(
//       //     onBack: () => _controller.hideOverlay(),
//       //   ),
//       //   isSupport: true,
//       // );
//     }
//   }

//   void onItemTapped(int index) {
//     if (!(index == 2 || index == 4)) {
//       manageNav(false, () => _navigateToPage(index), onFail: () {
//         setState(() {
//           _selectedIndex = _pageController.page!.round();
//         });
//       });
//     } else {
//       _navigateToPage(index);
//     }
//   }

//   void _navigateToPage(int index) {
//     if (_controller.hasOverlay) {
//       _controller.hideOverlay();
//     }

//     if (index == _selectedIndex) return;

//     final duration = _calculateAnimationDuration(_selectedIndex, index);

//     setState(() {
//       _selectedIndex = index;
//     });

//     _pageController.animateToPage(
//       index,
//       duration: duration,
//       curve: Curves.easeInOut,
//     );
//   }

//   Widget _buildTopBarIcons(ThemeData theme) {
//     return Row(
//       children: [
//         Obx(() => IconButton(
//               icon: Stack(
//                 alignment: Alignment.topRight,
//                 clipBehavior: Clip.none,
//                 children: [
//                   AnimatedSwitcher(
//                     duration: const Duration(milliseconds: 300),
//                     transitionBuilder: (Widget child, Animation<double> animation) {
//                       return FadeTransition(
//                         opacity: animation,
//                         child: ScaleTransition(
//                           scale: animation,
//                           child: child,
//                         ),
//                       );
//                     },
//                     child: SvgPicture.asset(
//                       _controller.isProfileOpen.value ? 'assets/icons/ic_back.svg' : 'assets/icons/user.svg',
//                       key: ValueKey<bool>(_controller.isProfileOpen.value),
//                       width: 32,
//                       height: 32,
//                       colorFilter: ColorFilter.mode(
//                         theme.colorScheme.primary,
//                         BlendMode.srcIn,
//                       ),
//                     ),
//                   ),
//                   if (!_controller.isProfileOpen.value && 1 > 0)
//                     Positioned(
//                       top: 3,
//                       right: 3,
//                       child: Container(
//                         width: 8,
//                         height: 8,
//                         decoration: BoxDecoration(
//                           color: theme.extension<CustomColors>()!.notifications,
//                           shape: BoxShape.circle,
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//               onPressed: _handleProfileTap,
//             )),
//         Expanded(
//           child: Container(
//             height: 48,
//             margin: EdgeInsets.symmetric(horizontal: 12),
//             decoration: BoxDecoration(
//               color: theme.colorScheme.surfaceContainer,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: TextField(
//               textAlignVertical: TextAlignVertical.center,
//               textInputAction: TextInputAction.search,
//               decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.search),
//                 border: InputBorder.none,
//                 hintText: 'Поиск...',
//                 contentPadding: EdgeInsets.symmetric(horizontal: 12),
//               ),
//             ),
//           ),
//         ),
//         Obx(() => IconButton(
//               icon: Stack(
//                 alignment: Alignment.topRight,
//                 clipBehavior: Clip.none,
//                 children: [
//                   AnimatedSwitcher(
//                     duration: const Duration(milliseconds: 300),
//                     transitionBuilder: (Widget child, Animation<double> animation) {
//                       return FadeTransition(
//                         opacity: animation,
//                         child: ScaleTransition(
//                           scale: animation,
//                           child: child,
//                         ),
//                       );
//                     },
//                     child: SvgPicture.asset(
//                       _controller.isSupportOpen.value ? 'assets/icons/ic_back.svg' : 'assets/icons/support.svg',
//                       key: ValueKey<bool>(_controller.isSupportOpen.value),
//                       width: 32,
//                       height: 32,
//                       colorFilter: ColorFilter.mode(
//                         theme.colorScheme.primary,
//                         BlendMode.srcIn,
//                       ),
//                     ),
//                   ),
//                   if (!_controller.isSupportOpen.value && 1 < 0)
//                     Positioned(
//                       top: 3,
//                       right: 3,
//                       child: Container(
//                         width: 8,
//                         height: 8,
//                         decoration: BoxDecoration(
//                           color: theme.extension<CustomColors>()!.notifications,
//                           shape: BoxShape.circle,
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//               onPressed: _handleSupportTap,
//             )),
//       ],
//     );
//   }

//   CurvedNavigationBarItem _buildIcon(int index) {
//     final bool isSelected = index == _selectedIndex;
//     final String iconPath = _iconPaths[index];
//     final String label = _labels[index];
//     final animDuration = isSelected ? 300 : 150;

//     return CurvedNavigationBarItem(
//       child: AnimatedContainer(
//         duration: Duration(milliseconds: animDuration),
//         curve: isSelected ? Curves.easeOutCubic : Curves.easeInOut,
//         width: isSelected ? 40 : 30,
//         height: isSelected ? 40 : 30,
//         child: TweenAnimationBuilder<Color?>(
//           duration: Duration(milliseconds: animDuration), // Faster when deselecting
//           curve: isSelected
//               ? Curves.easeOutCubic // Smooth transition when selecting
//               : Curves.easeInOut, // Quick transition when deselecting
//           tween: ColorTween(
//             // For home icon (index 2), use these colors

//             begin: index == 2 ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurfaceVariant,
//             // When selected, transition to onPrimary, otherwise onSurfaceVariant
//             end: isSelected ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurfaceVariant,
//           ),
//           // Add a key to prevent unnecessary rebuilds
//           key: ValueKey('icon_$index'),
//           builder: (BuildContext context, Color? color, Widget? child) {
//             return SvgPicture.asset(
//               iconPath,
//               colorFilter: ColorFilter.mode(
//                 color!,
//                 BlendMode.srcIn,
//               ),
//             );
//           },
//         ),
//       ),
//       label: label,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     ThemeData theme = Theme.of(context);
//     return Scaffold(
//       // backgroundColor: theme.brightness == Brightness.light
//       //     ? theme.colorScheme.surfaceContainerHighest
//       //     : theme.colorScheme.surface,
//       body: SafeArea(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: _buildTopBarIcons(theme),
//             ),
//             Expanded(
//               child: Stack(
//                 children: [
//                   PageView(
//                     controller: _pageController,
//                     physics: const NeverScrollableScrollPhysics(),
//                     children: _screens,
//                   ),
//                   Obx(() {
//                     final overlay = _controller.overlayScreen.value;
//                     if (overlay == null) return const SizedBox.shrink();

//                     return SlideOverlayTransition(
//                       animation: _controller.overlayAnimation,
//                       fromRight: _controller.isSupportOpen.value,
//                       child: overlay,
//                     );
//                   }),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Theme(
//         data: Theme.of(context).copyWith(
//           canvasColor: Colors.transparent,
//         ),
//         child: CurvedNavigationBar(
//           key: _bottomNavigationKey,
//           color: theme.colorScheme.surfaceContainer,
//           buttonBackgroundColor: Theme.of(context).colorScheme.primary,
//           backgroundColor: Colors.transparent,
//           index: _selectedIndex,
//           items: List.generate(
//             _iconPaths.length,
//             (index) => _buildIcon(index),
//           ),
//           letIndexChange: (index) {
//             if (index == 2 || index == 4) return true;

//             return manageNav(false, () {
//               return true;
//             }, onFail: () {
//               return false;
//             });
//           },
//           onTap: onItemTapped,
//           animationDuration: Duration(milliseconds: 500),
//           animationCurve: Curves.easeInOut,
//         ),
//       ),
//     );
//   }
// }

// class ZoomFadeTransition extends StatelessWidget {
//   final Widget child;
//   final Animation<double> animation;

//   const ZoomFadeTransition({
//     required this.child,
//     required this.animation,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final zoomCurve = CurvedAnimation(
//       parent: animation,
//       curve: const Interval(0.0, 0.8, curve: Curves.easeOutCubic),
//     );

//     final fadeCurve = CurvedAnimation(
//       parent: animation,
//       curve: const Interval(0.3, 1.0, curve: Curves.easeInOut),
//     );

//     return FadeTransition(
//       opacity: fadeCurve,
//       child: ScaleTransition(
//         alignment: Alignment.center,
//         scale: Tween<double>(
//           begin: 0.85,
//           end: 1.0,
//         ).animate(zoomCurve),
//         child: child,
//       ),
//     );
//   }
// }

// class SlideOverlayTransition extends StatelessWidget {
//   final Widget child;
//   final Animation<double> animation;
//   final bool fromRight;

//   const SlideOverlayTransition({
//     required this.child,
//     required this.animation,
//     this.fromRight = true,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: animation,
//       builder: (context, child) {
//         return SlideTransition(
//           position: Tween<Offset>(
//             begin: Offset(fromRight ? 1.0 : -1.0, 0.0),
//             end: Offset.zero,
//           ).animate(CurvedAnimation(
//             parent: animation,
//             curve: Curves.easeOutCubic,
//             reverseCurve: Curves.easeInCubic,
//           )),
//           child: FadeTransition(
//             opacity: Tween<double>(
//               begin: 0.0,
//               end: 1.0,
//             ).animate(CurvedAnimation(
//               parent: animation,
//               curve: const Interval(0.3, 1.0, curve: Curves.easeInOut),
//             )),
//             child: child,
//           ),
//         );
//       },
//       child: child,
//     );
//   }
// }
