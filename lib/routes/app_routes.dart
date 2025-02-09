import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/main/transfers_screen.dart';

import '/views/main/home_screen.dart';
import '../views/main/main_screen.dart';

class Routes {
  static const testing = '/testing';

  static const main = '/main';
  static const phoneLogin = '/phoneLogin';
  static const emailLogin = '/emailLogin';
  static const register = '/register';
  static const home = '/home';
  static const codeEntering = '/codeEntering';
  static const passwordEntering = '/passwordEntering';
  static const transfers = '/transfers';
  static const paymentHistory = '/paymentHistory';
  static const transferHistory = '/transferHistory';
  static const transferDetails = '/transferDetails';

  static const createAccount = '/createAccount';
  static const phoneTransfer = '/phoneTransfer';
  static const selfTransfer = '/selfTransfer';
  static const cardTransfer = '/cardTransfer';

  static const convertation = '/convertation';

  static const qrTransfer = '/qrTransfer';

  static const securitySettings = '/securitySettings';
  static const userChat = '/userChat';
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
      name: Routes.transfers,
      page: () => TransfersScreen(),
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
