import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zhambyl_guide/views/main/favourite.dart';
import 'package:zhambyl_guide/views/main/feedback.dart';
import 'package:zhambyl_guide/views/main/home.dart';
import 'package:zhambyl_guide/views/main/main.dart';
import 'package:zhambyl_guide/views/main/menu.dart';

class Routes {
  static const main = '/main';
  static const home = '/home';
  static const favourite = '/favourite';
  static const feedback = '/feedback';
  static const menu = '/menu';
  // static const profile = '/profile';
}

class AppRoutes {
  static final routes = [
    GetPage(
      name: Routes.main,
      page: () => MainScreen(),
      customTransition: ZoomFadeTransition(),
      transitionDuration: Duration(milliseconds: 800),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomeScreen(),
      customTransition: FadeWithHeroTransition(),
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.favourite,
      page: () => FavouriteScreen(),
      customTransition: ZoomFadeTransition(),
      transitionDuration: Duration(milliseconds: 400),
    ),
    GetPage(
      name: Routes.feedback,
      page: () => FeedbackScreen(),
      customTransition: ZoomFadeTransition(),
      transitionDuration: Duration(milliseconds: 400),
    ),
    GetPage(
      name: Routes.menu,
      page: () => MenuScreen(),
      customTransition: ZoomFadeTransition(),
      transitionDuration: Duration(milliseconds: 400),
    ),
  ];
}

class FadeWithHeroTransition extends CustomTransition {
  @override
  Widget buildTransition(
    BuildContext context,
    Curve? curve,
    Alignment? alignment,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}

class ZoomFadeTransition extends CustomTransition {
  @override
  Widget buildTransition(
    BuildContext context,
    Curve? curve,
    Alignment? alignment,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final zoomCurve = CurvedAnimation(
      parent: animation,
      curve: const Interval(0.0, 0.8, curve: Curves.easeOutCubic),
    );

    final fadeCurve = CurvedAnimation(
      parent: animation,
      curve: const Interval(0.3, 1.0, curve: Curves.easeInOut),
    );

    return FadeTransition(
      opacity: fadeCurve,
      child: ScaleTransition(
        alignment: alignment ?? Alignment.center,
        scale: Tween<double>(
          begin: 0.85,
          end: 1.0,
        ).animate(zoomCurve),
        child: child,
      ),
    );
  }
}

class ScaleFadeTransition extends CustomTransition {
  @override
  Widget buildTransition(
    BuildContext context,
    Curve? curve,
    Alignment? alignment,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final scaleCurve = CurvedAnimation(
      parent: animation,
      curve: const Interval(
        0.0,
        0.9,
        curve: Curves.easeOutCubic,
      ),
    );

    final fadeCurve = CurvedAnimation(
      parent: animation,
      curve: const Interval(
        0.2,
        1.0,
        curve: Curves.easeInOut,
      ),
    );

    return ScaleTransition(
      alignment: alignment ?? Alignment.center,
      scale: Tween<double>(
        begin: 0.92,
        end: 1.0,
      ).animate(scaleCurve),
      child: FadeTransition(
        opacity: fadeCurve,
        child: child,
      ),
    );
  }
}

class CustomSlideTransition extends CustomTransition {
  @override
  Widget buildTransition(
    BuildContext context,
    Curve? curve,
    Alignment? alignment,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final tween = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).chain(CurveTween(curve: curve ?? Curves.easeInOut));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
}

class CustomSlideTransitionLeft extends CustomTransition {
  @override
  Widget buildTransition(
    BuildContext context,
    Curve? curve,
    Alignment? alignment,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final tween = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).chain(CurveTween(curve: curve ?? Curves.easeInOut));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
}
