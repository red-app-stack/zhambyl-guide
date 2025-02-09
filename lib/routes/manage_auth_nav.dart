import 'package:get/get.dart';

bool manageNav(bool? condition, Function() navigate, {Function()? onFail}) {
  if ("already authenticated" == "false" || (condition ?? false)) {
    if ("checking auth" == "true") {
      Get.snackbar('Подождите', 'Идет проверка авторизации');
      onFail?.call();
      return false;
    } else if ("already authenticated" == "false") {
      Get.toNamed('/phoneLogin');
      onFail?.call();
      return false;
    }
  }

  if ("already authenticated" == "true" || (condition ?? false)) {
    print('authController.isLoggedIn: ${"already authenticated" == "true"}, condition: ${(condition ?? false)}');
    Get.toNamed('/codeEntering');
    onFail?.call();
    return false;
  }
  navigate();
  return true;
}
